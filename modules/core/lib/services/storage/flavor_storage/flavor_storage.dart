// Dart imports:
import 'dart:async';

// Project imports:
import 'package:core/services/storage/local_storage/local_storage.dart';

const String _isDemoKey = 'isDemo';

abstract class FlavorStorage {
  FutureOr<bool> getIsDemo();
  FutureOr<void> setIsDemo(bool value);

  FutureOr<void> clear();
}

class FlavorStorageImpl implements FlavorStorage {
  FlavorStorageImpl({required LocalStorage localStorage})
    : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  FutureOr<bool> getIsDemo() {
    return _localStorage.getBool(_isDemoKey) ?? false;
  }

  @override
  FutureOr<void> setIsDemo(bool value) async {
    await _localStorage.setBool(_isDemoKey, value);
  }

  @override
  FutureOr<void> clear() async {
    await _localStorage.remove(_isDemoKey);
  }
}
