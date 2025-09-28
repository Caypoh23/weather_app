// Package imports:
import 'package:core/exports/di.dart';

// Project imports:
import 'package:city_search/data/repository/search_city_repository_impl.dart';
import 'package:city_search/domain/repository/search_city_repository.dart';
import 'package:city_search/domain/use_case/search_city_use_case.dart';
import '../data/providers.dart';

final searchCityRepositoryProvider = Provider<SearchCityRepository>(
  (ref) => SearchCityRepositoryImpl(
    dataSource: ref.watch(searchCityRemoteDataSourceProvider),
  ),
);

final searchCityUseCaseProvider = Provider<SearchCityUseCase>(
  (ref) =>
      SearchCityUseCase(repository: ref.watch(searchCityRepositoryProvider)),
);
