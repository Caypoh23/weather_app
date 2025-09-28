// Package imports:
import 'package:core/exports/json.dart';

part 'get_cities_request.g.dart';

@JsonSerializable(createFactory: false)
class GetCitiesRequest {
  const GetCitiesRequest({
    required this.keyword,
    this.max = 20,
  });

  Map<String, dynamic> toJson() => _$GetCitiesRequestToJson(this);

  final String keyword;
  final int max;
}
