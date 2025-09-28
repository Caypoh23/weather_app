// Project imports:
import 'package:city_search/domain/models/city.dart';
import 'package:city_search/domain/repository/search_city_repository.dart';

class SearchCityUseCase {
  const SearchCityUseCase({required SearchCityRepository repository})
    : _repository = repository;

  final SearchCityRepository _repository;

  Future<List<City>> invoke({required String searchText}) async {
    return _repository.getCities(searchText: searchText);
  }
}
