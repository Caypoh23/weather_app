// Dart imports:
import 'dart:async';

// Project imports:
import 'package:core/network/refresh_token_repository.dart';
import 'package:core/storage/local_storage/local_storage.dart';
import 'package:core/storage/local_storage/local_storage_key.dart';
import 'package:weather_app/features/refresh_token/data/data_source/remote/refresh_token_remote_data_source.dart';
import 'package:weather_app/features/refresh_token/data/models/request/refresh_token_request.dart';

const clientId = String.fromEnvironment('CITY_SEARCH_API_KEY');
const clientSecret = String.fromEnvironment('CITY_SEARCH_API_SECRET');

class RefreshTokenRepositoryImpl implements RefreshTokenRepository {
  const RefreshTokenRepositoryImpl({
    required RefreshTokenRemoteDataSource remoteDataSource,
    required LocalStorage localStorage,
  }) : _remoteDataSource = remoteDataSource,
       _localStorage = localStorage;

  final RefreshTokenRemoteDataSource _remoteDataSource;
  final LocalStorage _localStorage;

  @override
  FutureOr<void> refreshToken() async {
    final request = RefreshTokenRequest(
      grantType: 'client_credentials',
      clientId: clientId,
      clientSecret: clientSecret,
    );

    final response = await _remoteDataSource.refreshToken(request);

    await _localStorage.setString(
      LocalStorageKey.accessToken.name,
      response.accessToken,
    );
  }
}
