import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:peng_cafe/features/licensing/data/services/license_signature_verifier.dart';
import 'package:peng_cafe/features/licensing/domain/services/license_validator.dart';

void main() {
  test('Real Peng license validates correctly', () async {
    final temp = Platform.environment['TEMP']!;
    final home = Platform.environment['USERPROFILE']!;

    final license =
        jsonDecode(await File('$temp\\peng-signed-license.json').readAsString())
            as Map<String, dynamic>;

    final serverPublicKey = await File(
      '$home\\.peng-dev\\license-signing-public.der',
    ).readAsBytes();

    final devicePublicKey = await File(
      '$home\\.peng-dev\\device-win-public.der',
    ).readAsBytes();

    final verifier = LicenseSignatureVerifier(
      trustedPublicKeys: {
        'peng-dev-win-p256-2026-10': Uint8List.fromList(serverPublicKey),
      },
    );

    final validator = LicenseValidator(verifier);

    final payload =
        jsonDecode(
              utf8.decode(base64Decode(license['payloadBase64'] as String)),
            )
            as Map<String, dynamic>;

    final issuedAt = DateTime.parse(payload['issuedAtUtc'] as String);

    final validUntil = DateTime.parse(payload['validUntilUtc'] as String);

    Future<LicenseValidationResult> validate({
      required String deviceId,
      required DateTime now,
    }) {
      return validator.validate(
        signedLicense: license,
        expectedBusinessId: 'ef33ac67-5d3a-453a-9dbb-2d669a78de9d',
        expectedProductId: '10000000-0000-0000-0000-000000000001',
        expectedDeviceId: deviceId,
        expectedDevicePublicKeySpkiBase64: base64Encode(devicePublicKey),
        nowUtc: now,
      );
    }

    // Valid license shortly after issue.
    final valid = await validate(
      deviceId: 'b514f012-b087-4b4c-ae38-eb3e34d96d16',
      now: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(valid.status, LicenseValidationStatus.valid);
    expect(valid.isValid, isTrue);

    // A copied license must not work on another device.
    final wrongDevice = await validate(
      deviceId: '00000000-0000-0000-0000-000000000001',
      now: issuedAt.add(const Duration(minutes: 1)),
    );

    expect(wrongDevice.status, LicenseValidationStatus.wrongDevice);

    // At the exact expiration time, access is denied.
    final expired = await validate(
      deviceId: 'b514f012-b087-4b4c-ae38-eb3e34d96d16',
      now: validUntil,
    );

    expect(expired.status, LicenseValidationStatus.expired);
  });
}
