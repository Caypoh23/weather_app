// Project imports:
import 'package:core/exports/alice.dart';
import 'package:core/exports/di.dart';
import 'package:core/exports/network.dart';
import 'package:core/exports/utils.dart';
import 'package:core/network/refresh_token_repository.dart';
import 'package:core/services/device_info_service.dart';
import 'package:core/services/package_info_service.dart';
import 'package:core/services/permission_service.dart';
import 'package:core/services/storage/flavor_storage/flavor_storage.dart';
import 'package:core/services/storage/language_storage/language_storage.dart';
import 'package:core/services/storage/local_storage/local_storage.dart';
import 'package:core/services/url_launcher_service.dart';

/// Networking
final aliceProvider = Provider<Alice>(
  (ref) => throw UnimplementedError('aliceProvider'),
);

final dioProvider = Provider<Dio>(
  (ref) => throw UnimplementedError('dioProvider'),
);

final refreshTokenRepositoryProvider = Provider<RefreshTokenRepository>(
  (ref) => throw UnimplementedError('refreshTokenRepositoryProvider'),
);

final connectivityServiceProvider = Provider<ConnectivityService>(
  (ref) => throw UnimplementedError('connectivityServiceProvider'),
);

final nonAuthRestClientProvider = Provider<NonAuthRestClient>(
  (ref) => throw UnimplementedError('nonAuthRestClientProvider'),
);

final authRestClientProvider = Provider<AuthRestClient>(
  (ref) => throw UnimplementedError('authRestClientProvider'),
);

/// Services

final deviceInfoServiceProvider = Provider<DeviceInfoService>(
  (ref) => throw UnimplementedError('deviceInfoServiceProvider'),
);

final packageInfoServiceProvider = Provider<PackageInfoService>(
  (ref) => throw UnimplementedError('packageInfoServiceProvider'),
);

final permissionServiceProvider = Provider<PermissionService>(
  (ref) => throw UnimplementedError('permissionServiceProvider'),
);

final urlLauncherServiceProvider = Provider<UrlLauncherService>(
  (ref) => throw UnimplementedError('urlLauncherServiceProvider'),
);

/// Storage
final localStorageProvider = Provider<LocalStorage>(
  (ref) => throw UnimplementedError('localStorageProvider'),
);

final flavorStorageProvider = Provider<FlavorStorage>(
  (ref) => throw UnimplementedError('flavorStorageProvider'),
);

final languageStorageProvider = Provider<LanguageStorage>(
  (ref) => throw UnimplementedError('languageStorageProvider'),
);

/// Logger
final loggerProvider = Provider<Logger>(
  (ref) => throw UnimplementedError('loggerProvider'),
);
