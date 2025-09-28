// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:weather_app/core/error_handler/error_handler_cubit.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/core/storage/locale_storage/locale_storage.dart';
import 'package:weather_app/router/app_router.dart';

List<Override> buildCoreDiOverrodes() => [
  appRouterProvider.overrideWith((ref) => AppRouter()),
  localeStorageProvider.overrideWith(
    (ref) =>
        LocaleStorageImpl(languageStorage: ref.watch(languageStorageProvider)),
  ),
  errorHandlerCubitProvider.overrideWith((ref) {
    final errorHandler = ErrorHandlerCubit();
    // final logger = ref.watch(loggerProvider);

    // BlocErrorDelegate.instance.startListen((error, stackTrace) {
    //   final handledError = error is AppFailure
    //       ? error
    //       : UnhandledFailure(error, stackTrace);

    //   logger.error("BlocErrorDelegate error", error, stackTrace);
    //   errorHandler.handle(handledError);
    // });

    return errorHandler;
  }),
];
