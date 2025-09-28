// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:city_search/data/providers.dart';
import 'package:city_search/domain/providers.dart';
import '../data/data_source/remote/search_city_remote_data_source.dart';
import '../data/repository/search_city_repository_impl.dart';
import '../domain/use_case/search_city_use_case.dart';

List<Override> buildSearchCityDiOverrides() => [
  searchCityRemoteDataSourceProvider.overrideWith(
    (ref) => SearchCityRemoteDataSourceImpl(
      restClientService: ref.watch(authRestClientProvider),
    ),
  ),
  searchCityRepositoryProvider.overrideWith(
    (ref) => SearchCityRepositoryImpl(
      dataSource: ref.watch(searchCityRemoteDataSourceProvider),
    ),
  ),
  searchCityUseCaseProvider.overrideWith(
    (ref) =>
        SearchCityUseCase(repository: ref.watch(searchCityRepositoryProvider)),
  ),
];
