// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/bloc.dart';
import 'package:weather_localization/strings.g.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import '../bloc/check_weather_bloc.dart';
import '../models/check_weather_error.dart';

part 'widgets/content_state_view.dart';
part 'widgets/error_state_view.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({required this.bloc, super.key});

  final CheckWeatherBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.weather.weather),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => bloc.add(const ShowInfoEvent()),
          ),
        ],
      ),
      body: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
        bloc: bloc,
        buildWhen: (state, _) => state.isActionLoading,
        builder: (context, state) {
          return Stack(
            children: [
              _ContentStateView(),
              if (state.isActionLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
