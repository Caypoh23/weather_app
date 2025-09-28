// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core/exports/bloc.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/core/error_handler/corners/no_connection_error_corner.dart';
import 'package:weather_app/features/no_connection/presentation/bloc/no_connection_bloc.dart';
import 'package:weather_app/features/no_connection/presentation/router/no_connection_router.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({
    required this.bloc,
    required this.router,
    super.key,
  });

  final NoConnectionBloc bloc;
  final NoConnectionRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoConnectionBloc, NoConnectionState>(
      bloc: bloc,
      listener: (context, state) {
        // Handle UI commands based on state changes
        // For now, we'll handle the retry action directly in the UI
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: uikit.AppSystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: const uikit.NoAppBar.light(),
          body: NoConnectionErrorCorner(
            onRetry: () {
              bloc.add(const RetryEvent());
              router.onOpenAuthorizedFlow(context);
            },
          ),
        ),
      ),
    );
  }
}
