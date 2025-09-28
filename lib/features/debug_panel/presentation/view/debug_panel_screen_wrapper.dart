// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';

// Project imports:
import 'package:weather_app/features/debug_panel/presentation/router/debug_panel_router.dart';
import 'package:weather_app/features/debug_panel/presentation/view/debug_panel_screen.dart';

class DebugPanelScreenWrapper extends ConsumerWidget {
  const DebugPanelScreenWrapper({super.key});

  static const path = '/debug_panel';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DebugPanelScreen(
      localStorage: ref.read(localStorageProvider),
      router: DebugPanelRouterImpl(alice: ref.read(aliceProvider)),
      packageInfoService: ref.read(packageInfoServiceProvider),
    );
  }
}
