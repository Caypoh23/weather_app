// Project imports:

// Project imports:
import '../../domain/models/weather.dart';
import '../models/response/get_weather_response.dart';

const _kelvinToCelsius = 273.15;

extension WeatherMapper on GetWeatherResponse {
  Weather toDomainModel() {
    final celsiusTemp = main.temp - _kelvinToCelsius;
    return Weather(temp: double.parse(celsiusTemp.toStringAsFixed(2)));
  }
}
