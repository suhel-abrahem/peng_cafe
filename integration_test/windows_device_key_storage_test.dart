import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webcrypto/webcrypto.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Windows protects and restores a device signing key', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Peng Windows key test'))),
      ),
    );

    const storage = FlutterSecureStorage();

    final testStorageKey =
        'peng.cafe.test.device_key.${DateTime.now().microsecondsSinceEpoch}';

    try {
      // Generate a disposable P-256 key pair.
      final keyPair = await EcdsaPrivateKey.generateKey(EllipticCurve.p256);

      final privateKeyBytes = await keyPair.privateKey.exportPkcs8Key();

      final publicKeyBytes = await keyPair.publicKey.exportSpkiKey();

      // Save the private key through Windows protected storage.
      await storage.write(
        key: testStorageKey,
        value: base64Encode(privateKeyBytes),
      );

      // Reload from a separate storage instance.
      const reopenedStorage = FlutterSecureStorage();

      final restoredBase64 = await reopenedStorage.read(key: testStorageKey);

      expect(restoredBase64, isNotNull);

      final restoredPrivateKey = await EcdsaPrivateKey.importPkcs8Key(
        base64Decode(restoredBase64!),
        EllipticCurve.p256,
      );

      final publicKey = await EcdsaPublicKey.importSpkiKey(
        publicKeyBytes,
        EllipticCurve.p256,
      );

      // The restored key must still sign correctly.
      final message = utf8.encode('PENG-WINDOWS-KEY-STORAGE-TEST');

      final signature = await restoredPrivateKey.signBytes(
        message,
        Hash.sha256,
      );

      expect(signature.length, 64);

      final valid = await publicKey.verifyBytes(
        signature,
        message,
        Hash.sha256,
      );

      expect(valid, isTrue);
    } finally {
      // Only delete our disposable test key.
      await storage.delete(key: testStorageKey);
    }
  });
}
