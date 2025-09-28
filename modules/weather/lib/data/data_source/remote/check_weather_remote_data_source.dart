// Dart imports:
import 'dart:async';

// Package imports:
import 'package:core/network/data_parser.dart';
import 'package:core/network/non_auth_rest_client.dart';

// Project imports:
import 'package:weather/data/constants/urls.dart';
import '../../models/request/get_weather_request.dart';
import '../../models/response/get_weather_response.dart';

abstract interface class CheckWeatherRemoteDataSource {
  FutureOr<GetWeatherResponse> checkWeather(GetWeatherRequest request);
}

class CheckWeatherRemoteDataSourceImpl implements CheckWeatherRemoteDataSource {
  const CheckWeatherRemoteDataSourceImpl({
    required NonAuthRestClient restClientService,
  }) : _restClientService = restClientService;

  final NonAuthRestClient _restClientService;

  @override
  FutureOr<GetWeatherResponse> checkWeather(GetWeatherRequest request) async {
    return _restClientService.get<GetWeatherResponse>(
      '${WeatherUrls.openWeather}${WeatherUrls.weather}',
      params: request.toJson(),
      parser: ObjectParser(GetWeatherResponse.fromJson),
    );
  }
}
