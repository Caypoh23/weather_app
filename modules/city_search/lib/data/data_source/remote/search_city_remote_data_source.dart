// Dart imports:
import 'dart:async';

// Package imports:
import 'package:core/network/auth_rest_client.dart';
import 'package:core/network/data_parser.dart';

// Project imports:
import 'package:city_search/data/constants/urls.dart';
import '../../models/request/get_cities_request.dart';
import '../../models/response/get_cities_response.dart';

abstract interface class SearchCityRemoteDataSource {
  FutureOr<List<GetCitiesResponse>> getCities(GetCitiesRequest request);
}

class SearchCityRemoteDataSourceImpl implements SearchCityRemoteDataSource {
  const SearchCityRemoteDataSourceImpl({
    required AuthRestClient restClientService,
  }) : _restClientService = restClientService;

  final AuthRestClient _restClientService;

  @override
  FutureOr<List<GetCitiesResponse>> getCities(GetCitiesRequest request) async {
    return _restClientService.get<List<GetCitiesResponse>>(
      '${CitySearchUrls.amadeus}${CitySearchUrls.cities}',
      params: request.toJson(),
      parser: ListParser(GetCitiesResponse.fromJson, forKey: 'data'),
    );
  }
}
