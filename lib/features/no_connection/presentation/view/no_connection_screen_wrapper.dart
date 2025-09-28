// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/di.dart';

// Project imports:
import 'package:weather_app/features/no_connection/di/di_overrides_builders.dart';
import 'package:weather_app/features/no_connection/presentation/providers.dart';
import 'package:weather_app/features/no_connection/presentation/router/no_connection_router.dart';
import 'package:weather_app/features/no_connection/presentation/view/no_connection_screen.dart';

class NoConnectionScreenWrapper extends StatelessWidget {
  const NoConnectionScreenWrapper({super.key});

  static const path = '/no_connection';

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: buildNoConnectionDiOverrides(),
      child: Consumer(
        builder: (_, ref, _) => NoConnectionScreen(
          bloc: ref.read(noConnectionBlocProvider),
          router: const NoConnectionRouterImpl(),
        ),
      ),
    );
  }
}
