// Package imports:
import 'package:core/exports/json.dart';

part 'get_weather_request.g.dart';

@JsonSerializable(createFactory: false)
class GetWeatherRequest {
  const GetWeatherRequest({
    required this.lat,
    required this.lon,
    required this.appid,
  });

  Map<String, dynamic> toJson() => _$GetWeatherRequestToJson(this);

  final double lat;
  final double lon;

  final String appid;
}
