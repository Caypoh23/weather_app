// Package imports:
import 'package:core/services/storage/language_storage/language_storage.dart';
import 'package:weather_localization/strings.g.dart';

abstract class LocaleStorage {
  String currentLanguage();

  Future<AppLocale> setLocale(AppLocale locale);

  AppLocale currentLocale();
}

class LocaleStorageImpl implements LocaleStorage {
  LocaleStorageImpl({required LanguageStorage languageStorage})
    : _languageStorage = languageStorage {
    _init();
  }

  final LanguageStorage _languageStorage;

  static final _localeSettings = LocaleSettings.instance;

  void _init() async {
    String storedLocale = await _languageStorage.readLanguage() ?? '';
    LocaleSettings.setLocaleRaw(storedLocale);
  }

  @override
  String currentLanguage() {
    final currentLocale = _localeSettings.currentLocale;
    final translations = _localeSettings.currentTranslations;

    return translations[currentLocale.languageCode] ?? translations['uz'];
  }

  @override
  Future<AppLocale> setLocale(AppLocale locale) async {
    _languageStorage.writeLanguage(locale.languageCode);
    return _localeSettings.setLocale(locale, listenToDeviceLocale: true);
  }

  @override
  AppLocale currentLocale() {
    return _localeSettings.currentLocale;
  }
}
