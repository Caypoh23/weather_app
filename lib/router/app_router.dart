// Package imports:
import 'package:core/exports/router.dart';
import 'package:core/network/network/flavor.dart';
import 'package:weather/presentation/view/weather_screen_wrapper.dart';

// Project imports:
import 'package:weather_app/features/debug_panel/presentation/view/debug_panel_screen_wrapper.dart';
import 'package:weather_app/features/no_connection/presentation/view/no_connection_screen_wrapper.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: AppConfig.isDebug,
    redirect: (context, state) => null,
    routes: _rootRoutes,
    initialLocation: WeatherScreenWrapper.path,
  );

  List<RouteBase> get _rootRoutes => <RouteBase>[
    GoRoute(
      path: WeatherScreenWrapper.path,
      name: WeatherScreenWrapper.path,
      builder: (_, _) => const WeatherScreenWrapper(),
    ),
    GoRoute(
      path: DebugPanelScreenWrapper.path,
      name: DebugPanelScreenWrapper.path,
      builder: (_, _) => const DebugPanelScreenWrapper(),
    ),
    GoRoute(
      path: NoConnectionScreenWrapper.path,
      name: NoConnectionScreenWrapper.path,
      builder: (_, _) => const NoConnectionScreenWrapper(),
    ),
  ];
}
