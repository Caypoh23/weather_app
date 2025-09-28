// Dart imports:
import 'dart:async';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  bool? getBool(String key);

  FutureOr<bool> setBool(String key, bool value);

  String? getString(String key);

  FutureOr<bool> setString(String key, String value);

  int? getInt(String key);

  FutureOr<bool> setInt(String key, int value);

  FutureOr<bool> remove(String key);

  FutureOr<bool> clear();
}

class LocalStorageImpl implements LocalStorage {
  const LocalStorageImpl({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key.toString());
  }

  @override
  FutureOr<bool> setBool(String key, bool value) async {
    return _preferences.setBool(key.toString(), value);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key.toString());
  }

  @override
  FutureOr<bool> setString(String key, String value) async {
    return _preferences.setString(key.toString(), value);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key.toString());
  }

  @override
  FutureOr<bool> setInt(String key, int value) async {
    return _preferences.setInt(key.toString(), value);
  }

  @override
  FutureOr<bool> remove(String key) async {
    return _preferences.remove(key.toString());
  }

  @override
  FutureOr<bool> clear() async {
    return _preferences.clear();
  }
}
