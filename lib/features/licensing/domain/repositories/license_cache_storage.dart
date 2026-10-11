abstract interface class LicenseCacheStorage {
  Future<void> write(String value);

  Future<String?> read();

  Future<void> delete();
}
