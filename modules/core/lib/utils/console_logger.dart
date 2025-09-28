// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:core/utils/logger.dart';

class ConsoleLogger implements Logger {
  const ConsoleLogger();

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  @override
  void fatal(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.fatal, message, error, stackTrace);
  }

  void log(String tag, Object failure, StackTrace stackTrace) {
    error('$tag: $failure', failure, stackTrace);
  }

  void _log(
    LogLevel level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final timestamp = DateTime.now().toIso8601String();
    final levelStr = level.name.toUpperCase().padRight(7);

    final logMessage = '[$timestamp] $levelStr $message';

    if (kDebugMode) {
      debugPrint(logMessage);

      if (error != null) {
        debugPrint('Error: $error');
      }

      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }
}
