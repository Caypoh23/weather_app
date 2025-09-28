// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/exports/storage.dart';
import 'package:core/providers.dart';
import 'package:weather/di/check_weather_di_module.dart';
import 'package:weather_app/features/refresh_token/di/di_overrides_builders.dart';

// Project imports:
import 'core/di/core_di_overrides_builders.dart';
import 'core/providers.dart';

Future<ProviderContainer> buildDiContainer() async {
  final List<Override> overrides = await _buildOverrides();
  final rootContainer = ProviderContainer(overrides: overrides);

  rootContainer
      .read(aliceProvider)
      .setNavigatorKey(
        rootContainer
            .read(appRouterProvider)
            .router
            .routerDelegate
            .navigatorKey,
      );

  return rootContainer;
}

Future<List<Override>> _buildOverrides() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  return [
    ...buildStorageDiOverrides(preferences),
    ...buildNetworkDiOverrides(),
    ...buildServiceDiOverrides(),
    ...buildCoreDiOverrodes(),
    ...buildCheckWeatherDiOverrides(),
    ...buildRefreshTokenDiOverrides(),
  ];
}
