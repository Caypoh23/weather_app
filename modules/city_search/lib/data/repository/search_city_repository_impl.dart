// Dart imports:
import 'dart:async';

// Project imports:
import '../../domain/models/city.dart';
import '../../domain/repository/search_city_repository.dart';
import '../data_source/remote/search_city_remote_data_source.dart';
import '../mappers/city_mapper.dart';
import '../models/request/get_cities_request.dart';

class SearchCityRepositoryImpl implements SearchCityRepository {
  const SearchCityRepositoryImpl({
    required SearchCityRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  final SearchCityRemoteDataSource _dataSource;

  @override
  FutureOr<List<City>> getCities({required String searchText}) async {
    final response = await _dataSource.fetchCities(
      GetCitiesRequest(keyword: searchText),
    );
    return response.map((e) => e.toDomainModel()).toList();
  }
}
