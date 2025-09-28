// Project imports:
import 'package:core/exports/di.dart';
import 'package:core/exports/storage.dart';
import 'package:core/providers.dart';
import 'package:core/storage/flavor_storage/flavor_storage.dart';
import 'package:core/storage/language_storage/language_storage.dart';
import 'package:core/storage/local_storage/local_storage.dart';

List<Override> buildStorageDiOverrides(SharedPreferences sharedPreferences) => [
  flavorStorageProvider.overrideWith(
    (ref) => FlavorStorageImpl(localStorage: ref.watch(localStorageProvider)),
  ),
  languageStorageProvider.overrideWith(
    (ref) => LanguageStorageImpl(localStorage: ref.watch(localStorageProvider)),
  ),
  localStorageProvider.overrideWith(
    (ref) => LocalStorageImpl(preferences: sharedPreferences),
  ),
];
