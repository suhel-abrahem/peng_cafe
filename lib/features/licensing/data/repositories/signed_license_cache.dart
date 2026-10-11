import 'dart:convert';

import '../../domain/repositories/license_cache_storage.dart';

class SignedLicenseCache {
  final LicenseCacheStorage storage;

  const SignedLicenseCache(this.storage);

  Future<void> save(Map<String, dynamic> signedLicense) async {
    for (final field in [
      'payloadBase64',
      'signatureBase64',
      'keyId',
      'algorithm',
    ]) {
      final value = signedLicense[field];

      if (value is! String || value.isEmpty) {
        throw FormatException('Missing or invalid $field');
      }
    }

    await storage.write(jsonEncode(signedLicense));
  }

  Future<Map<String, dynamic>?> load() async {
    final raw = await storage.read();

    if (raw == null) return null;

    final decoded = jsonDecode(raw);

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid cached license');
    }

    return decoded;
  }

  Future<void> clear() => storage.delete();
}
