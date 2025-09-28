// Package imports:
import 'package:core/exports/di.dart';

// Project imports:
import 'package:weather_app/router/app_router.dart';
import 'error_handler/error_handler_cubit.dart';
import 'storage/locale_storage/locale_storage.dart';

final localeStorageProvider = Provider<LocaleStorage>(
  (ref) => throw UnimplementedError('localeStorageProvider'),
);

final appRouterProvider = Provider<AppRouter>(
  (ref) => throw UnimplementedError('appRouterProvider'),
);

final errorHandlerCubitProvider = Provider<ErrorHandlerCubit>(
  (ref) => throw UnimplementedError('errorHandlerCubitProvider'),
);
