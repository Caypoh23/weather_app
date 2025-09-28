// Dart imports:
import 'dart:async';

// Project imports:
import '../../domain/models/weather.dart';
import '../../domain/repository/check_weather_repository.dart';
import '../data_source/remote/check_weather_remote_data_source.dart';
import '../mappers/weather_mapper.dart';
import '../models/request/get_weather_request.dart';

class CheckWeatherRepositoryImpl implements CheckWeatherRepository {
  const CheckWeatherRepositoryImpl({
    required CheckWeatherRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  final CheckWeatherRemoteDataSource _dataSource;

  @override
  FutureOr<Weather> getWeather({
    required double lat,
    required double long,
  }) async {
    final response = await _dataSource.checkWeather(
      GetWeatherRequest(lat: lat, lon: long, appid: 'your_api_key_here'),
    );
    return response.toDomainModel();
  }
}
