import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

import 'package:peng_cafe/features/licensing/data/repositories/signed_license_cache.dart';
import 'package:peng_cafe/features/licensing/data/services/license_signature_verifier.dart';
import 'package:peng_cafe/features/licensing/domain/entities/licensed_device_identity.dart';
import 'package:peng_cafe/features/licensing/domain/repositories/license_cache_storage.dart';
import 'package:peng_cafe/features/licensing/domain/services/license_startup_service.dart';
import 'package:peng_cafe/features/licensing/domain/services/license_validator.dart';

class FakeStorage implements LicenseCacheStorage {
  String? value;

  @override
  Future<String?> read() async => value;

  @override
  Future<void> write(String newValue) async {
    value = newValue;
  }

  @override
  Future<void> delete() async {
    value = null;
  }
}

void main() {
  test('Peng startup license decisions', () async {
    final home = Platform.environment['USERPROFILE']!;
    final temp = Platform.environment['TEMP']!;

    final signedLicense =
        jsonDecode(await File('$temp\\peng-signed-license.json').readAsString())
            as Map<String, dynamic>;

    final serverPublicKey = await File(
      '$home\\.peng-dev\\license-signing-public.der',
    ).readAsBytes();

    final devicePublicKey = await File(
      '$home\\.peng-dev\\device-win-public.der',
    ).readAsBytes();

    final payload =
        jsonDecode(
              utf8.decode(
                base64Decode(signedLicense['payloadBase64'] as String),
              ),
            )
            as Map<String, dynamic>;

    final issuedAt = DateTime.parse(payload['issuedAtUtc'] as String);

    final validUntil = DateTime.parse(payload['validUntilUtc'] as String);

    final identity = LicensedDeviceIdentity(
      businessId: 'ef33ac67-5d3a-453a-9dbb-2d669a78de9d',
      productId: '10000000-0000-0000-0000-000000000001',
      deviceId: 'b514f012-b087-4b4c-ae38-eb3e34d96d16',
      publicKeySpkiBase64: base64Encode(devicePublicKey),
    );

    final storage = FakeStorage();
    final cache = SignedLicenseCache(storage);

    final verifier = LicenseSignatureVerifier(
      trustedPublicKeys: {
        'peng-dev-win-p256-2026-10': Uint8List.fromList(serverPublicKey),
      },
    );

    final service = LicenseStartupService(
      cache: cache,
      validator: LicenseValidator(verifier),
    );

    // No license installed.
    var result = await service.check(
      device: identity,
      nowUtc: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(result.status, LicenseStartupStatus.activationRequired);

    // Install the real signed license.
    await cache.save(signedLicense);

    result = await service.check(
      device: identity,
      nowUtc: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(result.canOpenCashier, isTrue);

    // A different device must be blocked.
    result = await service.check(
      device: LicensedDeviceIdentity(
        businessId: identity.businessId,
        productId: identity.productId,
        deviceId: '00000000-0000-0000-0000-000000000001',
        publicKeySpkiBase64: identity.publicKeySpkiBase64,
      ),
      nowUtc: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(result.canOpenCashier, isFalse);

    // Exact expiration must block access.
    result = await service.check(device: identity, nowUtc: validUntil);

    expect(result.status, LicenseStartupStatus.blocked);
    expect(result.canOpenCashier, isFalse);

    // Malformed local cache must also block access.
    storage.value = 'invalid JSON';

    result = await service.check(
      device: identity,
      nowUtc: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(result.status, LicenseStartupStatus.blocked);
  });
}
