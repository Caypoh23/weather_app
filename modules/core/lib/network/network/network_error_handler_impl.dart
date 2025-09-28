// Project imports:
import 'package:core/exports/network.dart';
import 'package:core/exports/utils.dart';
import 'package:core/network/app_failure.dart';
import 'package:core/network/network/models/server_error.dart';

class NetworkErrorHandlerImpl implements NetworkErrorHandler {
  const NetworkErrorHandlerImpl({Logger? exceptionLogger})
    : _logger = exceptionLogger;

  final Logger? _logger;

  @override
  Future<T> tryCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on ExtendedError catch (e) {
      return switch (e) {
        NoConnectionError() => throw const NoConnectionFailure(),
        ParseError() => throw const ParseFailure(),
      };
    } on DioException catch (exception, s) {
      _logger?.error("DioException occurred", exception, s);
      final statusCode = exception.response?.statusCode ?? -1;
      if (statusCode == -1) throw const NoConnectionFailure();
      if (statusCode == 401) throw const InvalidTokenFailure();
      if (statusCode >= 500) {
        throw ServiceUnavailableFailure(statusCode: statusCode);
      }

      final model = _tryParseServerFailure(exception.response);

      throw ServerFailure<ServerError>(model: model, statusCode: statusCode);
    } catch (e, s) {
      _logger?.error("Unhandled network error", e, s);
      throw UnhandledFailure(e, s);
    }
  }

  ServerError _tryParseServerFailure(Response? response) {
    try {
      return ServerError.fromJson(response?.data);
    } catch (e) {
      throw NetworkInfraFailure(statusCode: response?.statusCode ?? -1);
    }
  }
}
