// Package imports:
import 'package:core/network/app_failure.dart';

enum CheckWeatherError {
  serverError,
  noConnection,
  serviceUnavailable;

  static CheckWeatherError fromAppFailure(AppFailure failure) {
    if (failure is ServiceUnavailableFailure) {
      return CheckWeatherError.serviceUnavailable;
    } else if (failure is NoConnectionFailure) {
      return CheckWeatherError.noConnection;
    } else {
      return CheckWeatherError.serverError;
    }
  }
}
