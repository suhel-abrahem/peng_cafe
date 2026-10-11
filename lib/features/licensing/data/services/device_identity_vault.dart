import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:webcrypto/webcrypto.dart';

import '../../domain/entities/licensed_device_identity.dart';

class DeviceIdentityVault {
  static const _storageKey = 'peng.cafe.device_identity.v1';

  final FlutterSecureStorage _storage;

  const DeviceIdentityVault(this._storage);

  Future<void> importActivatedDevice({
    required LicensedDeviceIdentity identity,
    required Uint8List privateKeyPkcs8,
  }) async {
    // Confirm the private key belongs to the registered public key.
    final privateKey = await EcdsaPrivateKey.importPkcs8Key(
      privateKeyPkcs8,
      EllipticCurve.p256,
    );

    final publicKey = await EcdsaPublicKey.importSpkiKey(
      base64Decode(identity.publicKeySpkiBase64),
      EllipticCurve.p256,
    );

    final message = utf8.encode('PENG-DEVICE-IMPORT-V1');

    final signature = await privateKey.signBytes(message, Hash.sha256);

    if (!await publicKey.verifyBytes(signature, message, Hash.sha256)) {
      throw StateError('Device private/public keys do not match.');
    }

    final encoded = jsonEncode({
      'businessId': identity.businessId,
      'productId': identity.productId,
      'deviceId': identity.deviceId,
      'publicKeySpkiBase64': identity.publicKeySpkiBase64,
      'privateKeyPkcs8Base64': base64Encode(privateKeyPkcs8),
    });

    final existing = await _storage.read(key: _storageKey);

    if (existing != null) {
      if (existing == encoded) return;

      throw StateError('A different device identity is already installed.');
    }

    await _storage.write(key: _storageKey, value: encoded);
  }

  Future<Map<String, dynamic>?> _loadRecord() async {
    final raw = await _storage.read(key: _storageKey);

    if (raw == null) return null;

    final decoded = jsonDecode(raw);

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid stored device identity.');
    }

    return decoded;
  }

  Future<LicensedDeviceIdentity?> loadIdentity() async {
    final data = await _loadRecord();

    if (data == null) return null;

    String requiredField(String key) {
      final value = data[key];

      if (value is! String || value.isEmpty) {
        throw FormatException('Invalid device identity field: $key');
      }

      return value;
    }

    return LicensedDeviceIdentity(
      businessId: requiredField('businessId'),
      productId: requiredField('productId'),
      deviceId: requiredField('deviceId'),
      publicKeySpkiBase64: requiredField('publicKeySpkiBase64'),
    );
  }

  Future<String> signRenewalChallenge({
    required String challengeId,
    required String nonceBase64,
  }) async {
    final data = await _loadRecord();

    if (data == null) {
      throw StateError('Device is not activated.');
    }

    final identity = await loadIdentity();

    if (identity == null) {
      throw StateError('Device identity unavailable.');
    }

    final nonce = base64Decode(nonceBase64);

    if (nonce.length != 32) {
      throw const FormatException('Invalid renewal challenge nonce.');
    }

    final privateKeyBase64 = data['privateKeyPkcs8Base64'] as String;

    final privateKey = await EcdsaPrivateKey.importPkcs8Key(
      base64Decode(privateKeyBase64),
      EllipticCurve.p256,
    );

    // EXACTLY matches RenewLicenseUseCase in ASP.NET Core.
    final message = utf8.encode(
      'PENG-LICENSE-RENEW-V1\n'
      '${challengeId.toLowerCase()}\n'
      '${identity.deviceId.toLowerCase()}\n'
      '$nonceBase64',
    );

    final signature = await privateKey.signBytes(message, Hash.sha256);

    return base64Encode(signature);
  }
}
