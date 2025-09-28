// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:weather_app/core/crashlytics_logger/crashlytics_logger.dart';
import 'package:weather_app/core/error_handler/error_handler_cubit.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/core/storage/locale_storage/locale_storage.dart';
import 'package:weather_app/router/app_router.dart';

List<Override> buildCoreDiOverrodes() => [
  loggerProvider.overrideWith((ref) => const CrashlyticsLogger()),
  appRouterProvider.overrideWith((ref) => AppRouter()),
  localeStorageProvider.overrideWith(
    (ref) =>
        LocaleStorageImpl(languageStorage: ref.watch(languageStorageProvider)),
  ),
  errorHandlerCubitProvider.overrideWith((ref) {
    final errorHandler = ErrorHandlerCubit();
    return errorHandler;
  }),
];
