// Package imports:
import 'package:core/exports/json.dart';

part 'get_cities_response.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class GetCitiesResponse {
  const GetCitiesResponse({
    required this.name,
    required this.geoCode,
  });

  factory GetCitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCitiesResponseFromJson(json);

  final String name;
  final GetCitiesResponseGeoCode? geoCode;
}

@JsonSerializable(createToJson: false)
class GetCitiesResponseGeoCode {
  const GetCitiesResponseGeoCode({
    required this.latitude,
    required this.longitude,
  });

  factory GetCitiesResponseGeoCode.fromJson(Map<String, dynamic> json) =>
      _$GetCitiesResponseGeoCodeFromJson(json);

  final double? latitude;
  final double? longitude;
}
