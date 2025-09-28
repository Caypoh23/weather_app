sealed class AppFailure implements Exception {
  const AppFailure({required this.message});

  final String message;

  @override
  String toString() => 'message: $message';
}

class NoConnectionFailure extends AppFailure {
  const NoConnectionFailure({super.message = 'No Connection'});
}

class ParseFailure extends AppFailure {
  const ParseFailure({super.message = 'Response parse failure'});
}

class CustomFailure extends AppFailure {
  const CustomFailure({required super.message});
}

class InvalidTokenFailure extends AppFailure {
  const InvalidTokenFailure({super.message = 'Token expired or invalid'});
}

abstract class NetworkFailure extends AppFailure {
  const NetworkFailure({
    super.message = 'Network error',
    required this.statusCode,
  });

  final int statusCode;

  @override
  String toString() {
    return "code: $statusCode message: $message";
  }
}

class ServerFailure<ErrorJsonT> extends NetworkFailure {
  const ServerFailure({
    super.message = 'Server error',
    required this.model,
    required super.statusCode,
  });

  final ErrorJsonT model;

  @override
  String toString() {
    return "${super.toString()} \nmodel:\n${model.toString()}";
  }
}

class ServiceUnavailableFailure extends NetworkFailure {
  const ServiceUnavailableFailure({
    super.message = 'Service unavailable',
    required super.statusCode,
  });
}

class NetworkInfraFailure extends NetworkFailure {
  const NetworkInfraFailure({
    super.message = 'Network infra error',
    required super.statusCode,
  });
}

class UnhandledFailure implements Exception {
  const UnhandledFailure(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;

  @override
  String toString() => 'error: $error, stackTrace: $stackTrace';
}
