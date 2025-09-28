// Package imports:
import 'package:core/exports/json.dart';

part 'get_weather_response.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class GetWeatherResponse {
  const GetWeatherResponse({
    required this.main,
  });

  factory GetWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherResponseFromJson(json);

  final GetWeatherResponseMain main;
}

@JsonSerializable(createToJson: false)
class GetWeatherResponseMain {
  const GetWeatherResponseMain({
    required this.temp,
  });

  factory GetWeatherResponseMain.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherResponseMainFromJson(json);

  final double temp;
}
