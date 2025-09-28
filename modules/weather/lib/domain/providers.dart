// Package imports:
import 'package:core/exports/di.dart';

// Project imports:
import 'package:weather/domain/repository/check_weather_repository.dart';
import 'package:weather/domain/use_case/get_weather_use_case.dart';

///
/// Repository Providers
///
final checkWeatherRepositoryProvider = Provider<CheckWeatherRepository>(
  (ref) => throw UnimplementedError('checkWeatherRepositoryProvider'),
);

///
/// Use Case Providers
///
final getWeatherUseCaseProvider = Provider<GetWeatherUseCase>(
  (ref) => throw UnimplementedError('getWeatherUseCaseProvider'),
);
