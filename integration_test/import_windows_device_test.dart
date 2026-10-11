import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:webcrypto/webcrypto.dart';

import 'package:peng_cafe/features/licensing/data/services/device_identity_vault.dart';
import 'package:peng_cafe/features/licensing/domain/entities/licensed_device_identity.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Import existing Windows Tank device', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Peng device import test'))),
      ),
    );

    final home = Platform.environment['USERPROFILE']!;

    final privatePem = await File(
      '$home\\.peng-dev\\device-win-key.pem',
    ).readAsString();

    final publicDer = await File(
      '$home\\.peng-dev\\device-win-public.der',
    ).readAsBytes();

    // Our .NET-generated key is PKCS#8 PEM.
    final privateBase64 = privatePem
        .replaceAll('-----BEGIN PRIVATE KEY-----', '')
        .replaceAll('-----END PRIVATE KEY-----', '')
        .replaceAll(RegExp(r'\s'), '');

    final privateDer = Uint8List.fromList(base64Decode(privateBase64));

    final identity = LicensedDeviceIdentity(
      businessId: 'ef33ac67-5d3a-453a-9dbb-2d669a78de9d',
      productId: '10000000-0000-0000-0000-000000000001',
      deviceId: 'b514f012-b087-4b4c-ae38-eb3e34d96d16',
      publicKeySpkiBase64: base64Encode(publicDer),
    );

    final vault = DeviceIdentityVault(const FlutterSecureStorage());

    // Persist the previously activated device.
    await vault.importActivatedDevice(
      identity: identity,
      privateKeyPkcs8: privateDer,
    );

    // Load from a new vault instance.
    final reopenedVault = DeviceIdentityVault(const FlutterSecureStorage());

    final restored = await reopenedVault.loadIdentity();

    expect(restored, isNotNull);
    expect(restored!.deviceId, identity.deviceId);
    expect(restored.businessId, identity.businessId);

    // Sign a renewal-format message with the restored key.
    const challengeId = '11111111-2222-3333-4444-555555555555';

    final nonceBase64 = base64Encode(List<int>.generate(32, (index) => index));

    final signatureBase64 = await reopenedVault.signRenewalChallenge(
      challengeId: challengeId,
      nonceBase64: nonceBase64,
    );

    final publicKey = await EcdsaPublicKey.importSpkiKey(
      publicDer,
      EllipticCurve.p256,
    );

    final message = utf8.encode(
      'PENG-LICENSE-RENEW-V1\n'
      '$challengeId\n'
      '${identity.deviceId}\n'
      '$nonceBase64',
    );

    expect(
      await publicKey.verifyBytes(
        base64Decode(signatureBase64),
        message,
        Hash.sha256,
      ),
      isTrue,
    );
  });
}
