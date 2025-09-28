// Project imports:
import '../models/weather.dart';
import '../repository/check_weather_repository.dart';

class GetWeatherUseCase {
  const GetWeatherUseCase({required CheckWeatherRepository repository})
    : _repository = repository;

  final CheckWeatherRepository _repository;

  Future<Weather> invoke({required double lat, required double long}) async {
    return _repository.getWeather(lat: lat, long: long);
  }
}
