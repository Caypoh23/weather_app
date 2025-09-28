part of 'check_weather_bloc.dart';

sealed class CheckWeatherEvent {
  const CheckWeatherEvent();
}

class SearchCityEvent extends CheckWeatherEvent {
  const SearchCityEvent(this.searchText);

  final String searchText;
}

class RetryEvent extends CheckWeatherEvent {
  const RetryEvent();
}

class GetWeatherEvent extends CheckWeatherEvent {
  const GetWeatherEvent({required this.cityName, this.lat, this.long});

  final String cityName;
  final double? lat;
  final double? long;
}

class ShowInfoEvent extends CheckWeatherEvent {
  const ShowInfoEvent();
}

class ShowCityLocationErrorEvent extends CheckWeatherEvent {
  const ShowCityLocationErrorEvent();
}
