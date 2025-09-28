// Package imports:
import 'package:city_search/domain/providers.dart';
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:weather/data/providers.dart';
import 'package:weather/domain/providers.dart';
import '../data/data_source/remote/check_weather_remote_data_source.dart';
import '../data/repository/check_weather_repository_impl.dart';
import '../domain/use_case/get_weather_use_case.dart';
import '../presentation/bloc/check_weather_bloc.dart';
import '../presentation/providers.dart';

List<Override> buildCheckWeatherDiOverrides() => [
  checkWeatherRemoteDataSourceProvider.overrideWith(
    (ref) => CheckWeatherRemoteDataSourceImpl(
      restClientService: ref.watch(nonAuthRestClientProvider),
    ),
  ),
  checkWeatherRepositoryProvider.overrideWith(
    (ref) => CheckWeatherRepositoryImpl(
      dataSource: ref.watch(checkWeatherRemoteDataSourceProvider),
    ),
  ),
  getWeatherUseCaseProvider.overrideWith(
    (ref) => GetWeatherUseCase(
      repository: ref.watch(checkWeatherRepositoryProvider),
    ),
  ),
  checkWeatherBlocProvider.overrideWith(
    (ref) => CheckWeatherBloc(
      searchCityUseCase: ref.watch(searchCityUseCaseProvider),
      getWeatherUseCase: ref.watch(getWeatherUseCaseProvider),
    ),
  ),
];
