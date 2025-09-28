// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:core/exports/alice.dart';
import 'package:core/exports/di.dart';
import 'package:core/exports/network.dart';
import 'package:core/network/network/flavor.dart';
import 'package:core/network/network/interceptors/flavor_interceptor.dart';
import 'package:core/network/network/interceptors/lang_interceptor.dart';
import 'package:core/network/network/network_config.dart';
import 'package:core/network/network/network_error_handler_impl.dart';
import 'package:core/providers.dart';
import 'package:core/services/storage/local_storage/local_storage_key.dart';

List<Override> buildNetworkDiOverrides() => [
  aliceProvider.overrideWith((ref) => Alice()),

  dioProvider.overrideWith((ref) => _initializeDioClient(ref)),
  // refreshTokenRepositoryProvider.overrideWith(
  //   (ref) => RefreshTokenRepositoryImpl(),
  // ),
  connectivityServiceProvider.overrideWith(
    (ref) => ConnectivityServiceImpl(connectivity: Connectivity()),
  ),
  nonAuthRestClientProvider.overrideWith(
    (ref) => NonAuthRestClient(
      ref.watch(dioProvider),
      connectivityService: ref.watch(connectivityServiceProvider),
      interceptors: [
        FlavorInterceptor(
          flavor: AppConfig.appFlavor,
          localStorage: ref.watch(flavorStorageProvider),
        ),
        LangInterceptor(languageStorage: ref.watch(languageStorageProvider)),
      ],
      errorHandler: const NetworkErrorHandlerImpl(),
    ),
  ),
  authRestClientProvider.overrideWith(
    (ref) => AuthRestClient(
      ref.watch(dioProvider),
      connectivityService: ref.watch(connectivityServiceProvider),
      refreshTokenRepository: ref.watch(refreshTokenRepositoryProvider),
      interceptors: [
        FlavorInterceptor(
          flavor: AppConfig.appFlavor,
          localStorage: ref.watch(flavorStorageProvider),
        ),
        LangInterceptor(languageStorage: ref.watch(languageStorageProvider)),
      ],
      errorHandler: const NetworkErrorHandlerImpl(),
    ),
  ),
];

Dio _initializeDioClient(Ref ref) {
  final testServerUrl =
      ref
          .read(localStorageProvider)
          .getString(LocalStorageKey.testServer.name) ??
      NetworkConfig.devUrl.toString();

  final String baseUrl = AppConfig.isDebug
      ? testServerUrl
      : NetworkConfig.prodUrl.toString();

  const networkTimeout = Duration(seconds: 60);

  final client = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: networkTimeout,
      receiveTimeout: networkTimeout,
    ),
  );

  client.interceptors.addAll([
    // if (AppConfig.isDebug) ref.read(aliceProvider).getDioInterceptor(),
    if (AppConfig.isDebug)
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (Object? object) {
          final pattern = RegExp('.{1,800}');

          pattern
              .allMatches(object.toString())
              .forEach((match) => debugPrint(match.group(0)));
        },
      ),
  ]);

  return client;
}
