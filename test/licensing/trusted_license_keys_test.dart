import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:peng_cafe/features/licensing/data/services/trusted_license_keys.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Bundled key verifies real Peng license', () async {
    final temp = Platform.environment['TEMP']!;

    final licenseFile = File('$temp\\peng-signed-license.json');

    final signedLicense =
        jsonDecode(await licenseFile.readAsString()) as Map<String, dynamic>;

    // Load the public key from Flutter assets,
    // not from the developer's home directory.
    final verifier = await TrustedLicenseKeys.load();

    expect(await verifier.verify(signedLicense), isTrue);

    // An unknown server key must be rejected.
    final unknownKey = Map<String, dynamic>.from(signedLicense);

    unknownKey['keyId'] = 'unknown-key';

    expect(await verifier.verify(unknownKey), isFalse);
  });
}
