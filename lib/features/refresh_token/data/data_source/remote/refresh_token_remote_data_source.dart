// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:core/exports/network.dart';

// Project imports:
import 'package:weather_app/features/refresh_token/data/constants/urls.dart';
import 'package:weather_app/features/refresh_token/data/models/request/refresh_token_request.dart';
import 'package:weather_app/features/refresh_token/data/models/response/refresh_token_response.dart';

abstract interface class RefreshTokenRemoteDataSource {
  FutureOr<RefreshTokenResponse> refreshToken(RefreshTokenRequest request);
}

class RefreshTokenRemoteDataSourceImpl implements RefreshTokenRemoteDataSource {
  const RefreshTokenRemoteDataSourceImpl({
    required NonAuthRestClient restClientService,
  }) : _restClientService = restClientService;

  final NonAuthRestClient _restClientService;

  @override
  FutureOr<RefreshTokenResponse> refreshToken(
    RefreshTokenRequest request,
  ) async {
    final formData = {'grant_type': request.grantType};

    final credentials = '${request.clientId}:${request.clientSecret}';
    final encodedCredentials = base64Encode(utf8.encode(credentials));
    final authorizationHeader = 'Basic $encodedCredentials';

    return _restClientService.post<RefreshTokenResponse>(
      '${RefreshTokenUrls.amadeus}${RefreshTokenUrls.token}',
      body: formData,
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
        headers: {'Authorization': authorizationHeader},
      ),
      parser: ObjectParser(RefreshTokenResponse.fromJson),
    );
  }
}
