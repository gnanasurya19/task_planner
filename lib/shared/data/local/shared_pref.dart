import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_planner/shared/data/local/storage.dart';

class SharedPref implements Storage {
  SharedPreferences? _prefs;
  final Completer<SharedPreferences> _initCompleter = Completer();

  @override
  void init() async {
    if (_prefs != null) return; // prevent re-init
    final prefs = await SharedPreferences.getInstance();
    _prefs = prefs;
    _initCompleter.complete(prefs);
  }

  Future<SharedPreferences> get _ready async =>
      _prefs ?? await _initCompleter.future;

  @override
  bool get inizialized => _prefs != null;

  @override
  Future<String?> getString(String key) async {
    final prefs = await _ready;
    return prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final prefs = await _ready;
    return prefs.setString(key, value);
  }

  @override
  Future<bool> has(String key) async {
    final prefs = await _ready;
    return prefs.containsKey(key);
  }

  @override
  Future<bool> clear() async {
    final prefs = await _ready;
    return prefs.clear();
  }
}
