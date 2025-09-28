// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:weather_app/features/refresh_token/data/data_source/remote/refresh_token_remote_data_source.dart';
import 'package:weather_app/features/refresh_token/data/providers.dart';
import 'package:weather_app/features/refresh_token/data/repository/refresh_token_repository_impl.dart';

List<Override> buildRefreshTokenDiOverrides() => [
  refreshTokenRemoteDataSourceProvider.overrideWith(
    (ref) => RefreshTokenRemoteDataSourceImpl(
      restClientService: ref.watch(nonAuthRestClientProvider),
    ),
  ),
  refreshTokenRepositoryProvider.overrideWith(
    (ref) => RefreshTokenRepositoryImpl(
      remoteDataSource: ref.watch(refreshTokenRemoteDataSourceProvider),
      localStorage: ref.watch(localStorageProvider),
    ),
  ),
];
