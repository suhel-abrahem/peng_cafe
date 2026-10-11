import 'package:flutter_test/flutter_test.dart';
import 'package:peng_cafe/features/licensing/data/repositories/signed_license_cache.dart';
import 'package:peng_cafe/features/licensing/domain/repositories/license_cache_storage.dart';

class FakeLicenseStorage implements LicenseCacheStorage {
  String? value;

  @override
  Future<void> write(String newValue) async {
    value = newValue;
  }

  @override
  Future<String?> read() async => value;

  @override
  Future<void> delete() async {
    value = null;
  }
}

void main() {
  test('Save, read and delete signed license', () async {
    final storage = FakeLicenseStorage();
    final cache = SignedLicenseCache(storage);

    expect(await cache.load(), isNull);

    final license = <String, dynamic>{
      'payloadBase64': 'cGF5bG9hZA==',
      'signatureBase64': 'c2lnbmF0dXJl',
      'keyId': 'peng-dev-win-p256-2026-10',
      'algorithm': 'ES256',
    };

    await cache.save(license);

    final loaded = await cache.load();

    expect(loaded, equals(license));

    await cache.clear();

    expect(await cache.load(), isNull);
  });

  test('Reject incomplete signed license', () async {
    final cache = SignedLicenseCache(FakeLicenseStorage());

    await expectLater(
      cache.save({'algorithm': 'ES256'}),
      throwsFormatException,
    );
  });

  test('Reject malformed cached data', () async {
    final storage = FakeLicenseStorage();
    storage.value = 'not valid json';

    final cache = SignedLicenseCache(storage);

    await expectLater(cache.load(), throwsFormatException);
  });
}
