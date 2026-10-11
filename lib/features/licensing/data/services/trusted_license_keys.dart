import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'license_signature_verifier.dart';

class TrustedLicenseKeys {
  static const String developmentKeyId = 'peng-dev-win-p256-2026-10';

  static const String developmentPublicKeyAsset =
      'assets/licensing/peng-dev-win-p256-2026-10.der';

  static Future<LicenseSignatureVerifier> load({AssetBundle? bundle}) async {
    final assetBundle = bundle ?? rootBundle;

    final data = await assetBundle.load(developmentPublicKeyAsset);

    final publicKeyBytes = Uint8List.fromList(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );

    return LicenseSignatureVerifier(
      trustedPublicKeys: {developmentKeyId: publicKeyBytes},
    );
  }
}
