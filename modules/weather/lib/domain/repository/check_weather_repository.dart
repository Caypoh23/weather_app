// Dart imports:
import 'dart:async';

// Project imports:
import '../models/weather.dart';

abstract interface class CheckWeatherRepository {
  FutureOr<Weather> getWeather({required double lat, required double long});
}
