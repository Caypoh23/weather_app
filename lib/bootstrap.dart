// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core/exports/di.dart';
import 'package:core/network/network/flavor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_localization/strings.g.dart';

// Project imports:
import 'package:weather_app/app/app.dart';
import 'di_container_builder.dart';

Future<void> initializeApp({required Flavor flavor}) async {
  AppConfig.appFlavor = flavor;

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();

  final ProviderContainer diContainer = await buildDiContainer();

  runApp(
    UncontrolledProviderScope(
      container: diContainer,
      child: TranslationProvider(child: const App()),
    ),
  );

  FlutterNativeSplash.remove();
}
