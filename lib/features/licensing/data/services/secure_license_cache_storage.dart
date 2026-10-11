import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/repositories/license_cache_storage.dart';

class SecureLicenseCacheStorage implements LicenseCacheStorage {
  static const String _key = 'peng.cafe.signed_license.v1';

  final FlutterSecureStorage _storage;

  const SecureLicenseCacheStorage(this._storage);

  @override
  Future<void> write(String value) {
    return _storage.write(key: _key, value: value);
  }

  @override
  Future<String?> read() {
    return _storage.read(key: _key);
  }

  @override
  Future<void> delete() {
    return _storage.delete(key: _key);
  }
}
