// Dart imports:
import 'dart:async';

// Package imports:
import 'package:core/exports/network.dart';

// Project imports:
import '../../constants/urls.dart';
import '../../models/request/refresh_token_request.dart';
import '../../models/response/refresh_token_response.dart';

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
    return _restClientService.post<RefreshTokenResponse>(
      '${AuthorizationUrls.amadeus}${AuthorizationUrls.token}',
      body: request.toJson(),
      options: Options(contentType: 'application/x-www-form-urlencoded'),
      parser: ObjectParser(RefreshTokenResponse.fromJson),
    );
  }
}
