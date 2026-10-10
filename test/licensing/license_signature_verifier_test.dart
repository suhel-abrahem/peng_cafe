import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:peng_cafe/features/licensing/data/services/license_signature_verifier.dart';

void main() {
  test('Verify real Peng SaaS signed license', () async {
    final temp = Platform.environment['TEMP']!;
    final home = Platform.environment['USERPROFILE']!;

    final licenseFile = File('$temp\\peng-signed-license.json');

    final publicKeyFile = File('$home\\.peng-dev\\license-signing-public.der');

    final license =
        jsonDecode(await licenseFile.readAsString()) as Map<String, dynamic>;

    final verifier = LicenseSignatureVerifier(
      trustedPublicKeys: {
        'peng-dev-win-p256-2026-10': Uint8List.fromList(
          await publicKeyFile.readAsBytes(),
        ),
      },
    );

    expect(await verifier.verify(license), isTrue);

    final tampered = Map<String, dynamic>.from(license);
    final bytes = base64Decode(tampered['payloadBase64'] as String);

    bytes[0] ^= 1;

    tampered['payloadBase64'] = base64Encode(bytes);

    expect(await verifier.verify(tampered), isFalse);

    final unknownKey = Map<String, dynamic>.from(license);
    unknownKey['keyId'] = 'unknown-key';

    expect(await verifier.verify(unknownKey), isFalse);
  });
}
