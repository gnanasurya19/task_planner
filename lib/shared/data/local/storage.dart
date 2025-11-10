abstract class Storage {
  bool get inizialized;

  init();

  Future<String?> getString(String key);

  Future<bool> setString(String key, String value);

  Future<bool> has(String key);

  Future<bool> clear();
}
