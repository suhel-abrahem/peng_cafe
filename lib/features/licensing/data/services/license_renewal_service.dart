import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../repositories/signed_license_cache.dart';
import '../../domain/services/license_validator.dart';
import 'device_identity_vault.dart';

enum LicenseRenewalOutcome {
  renewed,
  activationRequired,
  denied,
  unavailable,
  invalidServerResponse,
}

class LicenseRenewalResult {
  final LicenseRenewalOutcome outcome;
  final String message;

  const LicenseRenewalResult(this.outcome, this.message);

  bool get succeeded => outcome == LicenseRenewalOutcome.renewed;
}

class LicenseRenewalService {
  final http.Client client;
  final Uri baseUrl;
  final DeviceIdentityVault deviceVault;
  final SignedLicenseCache licenseCache;
  final LicenseValidator validator;

  const LicenseRenewalService({
    required this.client,
    required this.baseUrl,
    required this.deviceVault,
    required this.licenseCache,
    required this.validator,
  });

  Future<http.Response> _post(String path, Map<String, dynamic> body) {
    return client
        .post(
          baseUrl.resolve(path),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 15));
  }

  Future<LicenseRenewalResult> _handleFailure(int statusCode) async {
    // Explicit rejection from our licensing API.
    if ([400, 401, 403, 404, 410].contains(statusCode)) {
      await licenseCache.clear();

      return LicenseRenewalResult(
        LicenseRenewalOutcome.denied,
        'Server denied license renewal (HTTP $statusCode).',
      );
    }

    return LicenseRenewalResult(
      LicenseRenewalOutcome.unavailable,
      'Renewal unavailable (HTTP $statusCode).',
    );
  }

  Future<LicenseRenewalResult> renew() async {
    final identity = await deviceVault.loadIdentity();

    if (identity == null) {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.activationRequired,
        'No activated device identity found.',
      );
    }

    try {
      // STEP 1 — Ask for a fresh challenge.
      final challengeResponse = await _post('api/licenses/renewal-challenge', {
        'businessId': identity.businessId,
        'deviceId': identity.deviceId,
      });

      if (challengeResponse.statusCode != 200) {
        return _handleFailure(challengeResponse.statusCode);
      }

      final challenge =
          jsonDecode(challengeResponse.body) as Map<String, dynamic>;

      final challengeId = challenge['challengeId'] as String;
      final nonceBase64 = challenge['nonceBase64'] as String;
      final challengeDeviceId = challenge['deviceId'] as String;

      if (challengeDeviceId.toLowerCase() != identity.deviceId.toLowerCase()) {
        return const LicenseRenewalResult(
          LicenseRenewalOutcome.invalidServerResponse,
          'Challenge device mismatch.',
        );
      }

      if (base64Decode(nonceBase64).length != 32) {
        throw const FormatException('Invalid challenge nonce.');
      }

      // STEP 2 — Sign with the locally protected device key.
      final signatureBase64 = await deviceVault.signRenewalChallenge(
        challengeId: challengeId,
        nonceBase64: nonceBase64,
      );

      // STEP 3 — Submit proof to the API.
      final renewalResponse = await _post('api/licenses/renew', {
        'businessId': identity.businessId,
        'challengeId': challengeId,
        'signatureBase64': signatureBase64,
      });

      if (renewalResponse.statusCode != 200) {
        return _handleFailure(renewalResponse.statusCode);
      }

      final signedLicense =
          jsonDecode(renewalResponse.body) as Map<String, dynamic>;

      // STEP 4 — Independently validate the signed license.
      final validation = await validator.validate(
        signedLicense: signedLicense,
        expectedBusinessId: identity.businessId,
        expectedProductId: identity.productId,
        expectedDeviceId: identity.deviceId,
        expectedDevicePublicKeySpkiBase64: identity.publicKeySpkiBase64,
      );

      if (!validation.isValid) {
        return LicenseRenewalResult(
          LicenseRenewalOutcome.invalidServerResponse,
          'License validation failed: ${validation.status.name}.',
        );
      }

      // STEP 5 — Cache only the verified signed entitlement.
      await licenseCache.save(signedLicense);

      return const LicenseRenewalResult(
        LicenseRenewalOutcome.renewed,
        'Signed license renewed and saved.',
      );
    } on SocketException {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.unavailable,
        'Cannot connect to Peng SaaS.',
      );
    } on TimeoutException {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.unavailable,
        'Peng SaaS request timed out.',
      );
    } on http.ClientException {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.unavailable,
        'Network request failed.',
      );
    } on FormatException {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.invalidServerResponse,
        'Invalid API response.',
      );
    } on TypeError {
      return const LicenseRenewalResult(
        LicenseRenewalOutcome.invalidServerResponse,
        'Unexpected API response structure.',
      );
    }
  }
}
