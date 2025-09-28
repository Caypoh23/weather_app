part of 'check_weather_bloc.dart';

@freezed
abstract class CheckWeatherState with _$CheckWeatherState {
  const factory CheckWeatherState({
    @Default('') String searchText,
    @Default([]) List<City> citiesList,
    Weather? weather,
    @Default(false) bool isLoading,
    @Default(false) bool isActionLoading,
    CheckWeatherError? error,
  }) = _CheckWeatherState;

  const CheckWeatherState._();
}
