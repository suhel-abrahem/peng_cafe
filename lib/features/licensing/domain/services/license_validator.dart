import 'dart:convert';

import '../../data/services/license_signature_verifier.dart';
import '../entities/license_entitlement.dart';

enum LicenseValidationStatus {
  valid,
  invalidSignature,
  invalidPayload,
  wrongVersion,
  wrongBusiness,
  wrongProduct,
  wrongDevice,
  wrongDeviceKey,
  invalidDates,
  notYetValid,
  expired,
}

class LicenseValidationResult {
  final LicenseValidationStatus status;
  final LicenseEntitlement? entitlement;

  const LicenseValidationResult(this.status, {this.entitlement});

  bool get isValid => status == LicenseValidationStatus.valid;
}

class LicenseValidator {
  final LicenseSignatureVerifier signatureVerifier;

  const LicenseValidator(this.signatureVerifier);

  Future<LicenseValidationResult> validate({
    required Map<String, dynamic> signedLicense,
    required String expectedBusinessId,
    required String expectedProductId,
    required String expectedDeviceId,
    required String expectedDevicePublicKeySpkiBase64,
    DateTime? nowUtc,
  }) async {
    // Step 1: Verify the server's signature FIRST.
    final signatureValid = await signatureVerifier.verify(signedLicense);

    if (!signatureValid) {
      return const LicenseValidationResult(
        LicenseValidationStatus.invalidSignature,
      );
    }

    // Step 2: Decode the authenticated payload.
    late final LicenseEntitlement entitlement;

    try {
      final payloadBase64 = signedLicense['payloadBase64'] as String;

      final payloadBytes = base64Decode(payloadBase64);

      final payload = jsonDecode(utf8.decode(payloadBytes));

      if (payload is! Map<String, dynamic>) {
        throw const FormatException('Invalid payload');
      }

      entitlement = LicenseEntitlement.fromJson(payload);
    } catch (_) {
      return const LicenseValidationResult(
        LicenseValidationStatus.invalidPayload,
      );
    }

    // Step 3: Check the supported entitlement version.
    if (entitlement.version != 1) {
      return const LicenseValidationResult(
        LicenseValidationStatus.wrongVersion,
      );
    }

    bool sameId(String a, String b) => a.toLowerCase() == b.toLowerCase();

    // Step 4: Verify the business and product.
    if (!sameId(entitlement.businessId, expectedBusinessId)) {
      return const LicenseValidationResult(
        LicenseValidationStatus.wrongBusiness,
      );
    }

    if (!sameId(entitlement.productId, expectedProductId)) {
      return const LicenseValidationResult(
        LicenseValidationStatus.wrongProduct,
      );
    }

    // Step 5: Bind the entitlement to this device.
    if (!sameId(entitlement.deviceId, expectedDeviceId)) {
      return const LicenseValidationResult(LicenseValidationStatus.wrongDevice);
    }

    if (entitlement.devicePublicKeySpkiBase64 !=
        expectedDevicePublicKeySpkiBase64) {
      return const LicenseValidationResult(
        LicenseValidationStatus.wrongDeviceKey,
      );
    }

    // Step 6: Validate the signed time window.
    final issuedAt = entitlement.issuedAtUtc;
    final validUntil = entitlement.validUntilUtc;
    final subscriptionEnd = entitlement.subscriptionEndsAtUtc;

    if (!validUntil.isAfter(issuedAt) ||
        validUntil.isAfter(issuedAt.add(const Duration(days: 7))) ||
        validUntil.isAfter(subscriptionEnd)) {
      return const LicenseValidationResult(
        LicenseValidationStatus.invalidDates,
      );
    }

    final now = (nowUtc ?? DateTime.now()).toUtc();

    if (now.isBefore(issuedAt)) {
      return const LicenseValidationResult(LicenseValidationStatus.notYetValid);
    }

    if (!now.isBefore(validUntil) || !now.isBefore(subscriptionEnd)) {
      return const LicenseValidationResult(LicenseValidationStatus.expired);
    }

    return LicenseValidationResult(
      LicenseValidationStatus.valid,
      entitlement: entitlement,
    );
  }
}
