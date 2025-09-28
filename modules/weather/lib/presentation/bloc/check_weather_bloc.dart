// Package imports:
import 'package:city_search/domain/models/city.dart';
import 'package:city_search/domain/use_case/search_city_use_case.dart';
import 'package:core/exports/bloc.dart';
import 'package:core/exports/rxdart.dart';

// Project imports:
import 'package:weather/domain/models/weather.dart';
import 'package:weather/domain/use_case/get_weather_use_case.dart';
import 'package:weather/presentation/models/check_weather_error.dart';

part 'check_weather_event.dart';
part 'check_weather_state.dart';
part 'check_weather_bloc.freezed.dart';

class CheckWeatherBloc extends Bloc<CheckWeatherEvent, CheckWeatherState> {
  CheckWeatherBloc({
    required SearchCityUseCase searchCityUseCase,
    required GetWeatherUseCase getWeatherUseCase,
  }) : _searchCityUseCase = searchCityUseCase,
       _getWeatherUseCase = getWeatherUseCase,
       super(const CheckWeatherState()) {
    on<SearchCityEvent>(
      (event, emit) => _onSearchCity(event, emit),
      transformer: debounce(),
    );

    on<CheckWeatherEvent>(
      (event, emit) => switch (event) {
        SearchCityEvent() => {},
        RetryEvent() => _onRetry(event, emit),
        GetWeatherEvent() => _onGetWeather(event, emit),
        ShowInfoEvent() => _onShowInfo(event, emit),
        ShowCityLocationErrorEvent() => _onShowCityLocationError(event, emit),
      },
    );
  }

  EventTransformer<Event> debounce<Event>({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }

  final SearchCityUseCase _searchCityUseCase;
  final GetWeatherUseCase _getWeatherUseCase;

  Future<void> _onSearchCity(
    SearchCityEvent event,
    Emitter<CheckWeatherState> emit,
  ) async {
    try {
      final searchText = event.searchText;
      if (searchText.length < 3) {
        emit(
          state.copyWith(
            searchText: searchText,
            citiesList: [],
            weather: null,
            error: null,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          searchText: searchText,
          citiesList: [],
          weather: null,
          isLoading: true,
          error: null,
        ),
      );

      final result = await _searchCityUseCase.invoke(searchText: searchText);
      emit(state.copyWith(citiesList: result, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: CheckWeatherError.serverError, isLoading: false),
      );
    }
  }

  Future<void> _onRetry(
    RetryEvent event,
    Emitter<CheckWeatherState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          citiesList: [],
          weather: null,
          isLoading: true,
          error: null,
        ),
      );

      final result = await _searchCityUseCase.invoke(
        searchText: state.searchText,
      );

      emit(state.copyWith(citiesList: result, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: CheckWeatherError.serverError, isLoading: false),
      );
    }
  }

  Future<void> _onGetWeather(
    GetWeatherEvent event,
    Emitter<CheckWeatherState> emit,
  ) async {
    try {
      final lat = event.lat;
      final long = event.long;
      if (lat == null || long == null) {
        return add(const ShowCityLocationErrorEvent());
      }

      emit(
        state.copyWith(
          searchText: event.cityName,
          weather: null,
          isActionLoading: true,
        ),
      );

      final result = await _getWeatherUseCase.invoke(lat: lat, long: long);

      emit(state.copyWith(weather: result, isActionLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: CheckWeatherError.serverError,
          isActionLoading: false,
        ),
      );
    }
  }

  Future<void> _onShowInfo(
    ShowInfoEvent event,
    Emitter<CheckWeatherState> emit,
  ) async {
    // Handle show info event
    // Implementation depends on requirements
  }

  Future<void> _onShowCityLocationError(
    ShowCityLocationErrorEvent event,
    Emitter<CheckWeatherState> emit,
  ) async {
    emit(
      state.copyWith(
        error: CheckWeatherError.serverError,
        isActionLoading: false,
      ),
    );
  }
}
