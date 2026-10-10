import 'dart:convert';
import 'dart:typed_data';

import 'package:webcrypto/webcrypto.dart';

class LicenseSignatureVerifier {
  final Map<String, Uint8List> trustedPublicKeys;

  const LicenseSignatureVerifier({required this.trustedPublicKeys});

  Future<bool> verify(Map<String, dynamic> license) async {
    try {
      final algorithm = license['algorithm'];
      final keyId = license['keyId'];
      final payloadBase64 = license['payloadBase64'];
      final signatureBase64 = license['signatureBase64'];

      if (algorithm != 'ES256' ||
          keyId is! String ||
          payloadBase64 is! String ||
          signatureBase64 is! String) {
        return false;
      }

      // Accept only trusted, explicitly configured signing keys.
      final publicKeyBytes = trustedPublicKeys[keyId];

      if (publicKeyBytes == null) {
        return false;
      }

      // Important: verify the ORIGINAL signed JSON bytes.
      // Never decode and re-encode the JSON before verification.
      final payloadBytes = base64Decode(payloadBase64);
      final signatureBytes = base64Decode(signatureBase64);

      if (signatureBytes.length != 64) {
        return false;
      }

      final publicKey = await EcdsaPublicKey.importSpkiKey(
        publicKeyBytes,
        EllipticCurve.p256,
      );

      return await publicKey.verifyBytes(
        signatureBytes,
        payloadBytes,
        Hash.sha256,
      );
    } catch (_) {
      return false;
    }
  }
}
