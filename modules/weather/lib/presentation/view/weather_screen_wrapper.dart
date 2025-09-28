// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:city_search/di/search_city_providers.dart';
import 'package:core/exports/di.dart';

// Project imports:
import 'package:weather/presentation/providers.dart';
import '../../di/check_weather_di_module.dart';
import 'weather_screen.dart';

class WeatherScreenWrapper extends ConsumerWidget {
  const WeatherScreenWrapper({super.key});

  static const path = '/check_weather';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        ...buildCheckWeatherDiOverrides(),
        ...buildSearchCityDiOverrides(),
      ],
      child: Consumer(
        builder: (_, ref, _) =>
            WeatherScreen(bloc: ref.read(checkWeatherBlocProvider)),
      ),
    );
  }
}
