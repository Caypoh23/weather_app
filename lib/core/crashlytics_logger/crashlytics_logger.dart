// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core/utils/logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsLogger implements Logger {
  const CrashlyticsLogger();

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
    try {
      final timestamp = DateTime.now().toIso8601String();
      final levelStr = level.name.toUpperCase().padRight(7);
      final logMessage = '[$timestamp] $levelStr $message';

      debugPrint(logMessage);

      if (error != null) {
        debugPrint('Error: $error');
      }

      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }

      // Send to Crashlytics for error and fatal levels
      if (level == LogLevel.error || level == LogLevel.fatal) {
        final crashlyticsError = error ?? message;
        final crashlyticsStackTrace = stackTrace ?? StackTrace.current;

        FirebaseCrashlytics.instance.recordError(
          crashlyticsError,
          crashlyticsStackTrace,
          fatal: level == LogLevel.fatal,
        );
      } else {
        // Log other levels as breadcrumbs
        FirebaseCrashlytics.instance.log('$levelStr: $message');
      }
    } catch (e) {
      debugPrint("CrashlyticsLogger error: $e");
    }
  }
}
