// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/network/network/flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_localization/strings.g.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/core/error_handler/error_handler_widget.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/features/debug_panel/presentation/view/debug_panel_screen_wrapper.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: uikit.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: context.tr.applicationName,
      routerConfig: ref.read(appRouterProvider).router,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      builder: (context, child) => _builder(context, ref, child),
    );
  }

  Widget _builder(BuildContext context, WidgetRef ref, Widget? child) {
    uikit.MediaHelper.initialize(context);

    if (AppConfig.isDebug) {
      child = GestureDetector(
        onLongPress: () =>
            ref.read(appRouterProvider).router.go(DebugPanelScreenWrapper.path),
        child: child,
      );
    }

    return MediaQuery(
      data: MediaQuery.of(context),
      child: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (_) => ErrorHandlerWidget(
              bloc: ref.read(errorHandlerCubitProvider),
              router: ref.read(appRouterProvider),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
