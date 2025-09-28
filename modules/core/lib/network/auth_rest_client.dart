// Dart imports:
import 'dart:async';

// Project imports:
import 'package:core/exports/network.dart';
import 'package:core/network/app_failure.dart';
import 'package:core/network/refresh_token_repository.dart';

class AuthRestClient extends RestClientService {
  AuthRestClient(
    super.client, {
    required super.connectivityService,
    required super.errorHandler,
    required RefreshTokenRepository refreshTokenRepository,
    super.interceptors = const [],
  }) : _refreshTokenRepository = refreshTokenRepository;

  final RefreshTokenRepository _refreshTokenRepository;
  Completer? _refreshCompleter;

  @override
  Future<T> request<T>(
    Future<Response> Function() call, {
    required DataParser<T>? parser,
  }) async {
    await _refreshCompleter?.future;
    return _tryRequest(
      () => super.request(call, parser: parser),
      isTryToRefreshToken: true,
    );
  }

  Future<T> _tryRequest<T>(
    Future<T> Function() call, {
    required bool isTryToRefreshToken,
  }) async {
    try {
      return await call();
    } on AppFailure catch (e) {
      if (e is InvalidTokenFailure && isTryToRefreshToken) {
        final completer = _refreshCompleter;

        if (completer != null) {
          await completer.future;
        } else {
          _refreshCompleter = Completer();
          try {
            await _refreshTokenRepository.refreshToken();
          } catch (_) {
            rethrow;
          } finally {
            _refreshCompleter?.complete(null);
            _refreshCompleter = null;
          }
        }

        return await _tryRequest(call, isTryToRefreshToken: false);
      }
      rethrow;
    }
  }
}
