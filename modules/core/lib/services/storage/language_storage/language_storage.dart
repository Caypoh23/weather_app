// Dart imports:
import 'dart:async';

// Project imports:
import 'package:core/services/storage/local_storage/local_storage.dart';

const String _languageKey = 'language';

abstract class LanguageStorage {
  FutureOr<String?> readLanguage();

  FutureOr<void> writeLanguage(String value);
}

class LanguageStorageImpl implements LanguageStorage {
  LanguageStorageImpl({required LocalStorage localStorage})
    : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  FutureOr<String?> readLanguage() {
    return _localStorage.getString(_languageKey);
  }

  @override
  FutureOr<void> writeLanguage(String value) async {
    await _localStorage.setString(_languageKey, value);
  }
}
