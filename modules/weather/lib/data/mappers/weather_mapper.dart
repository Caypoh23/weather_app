// Project imports:

// Project imports:
import '../../domain/models/weather.dart';
import '../models/response/get_weather_response.dart';

extension WeatherMapper on GetWeatherResponse {
  Weather toDomainModel() {
    return Weather(temp: main.temp);
  }
}
