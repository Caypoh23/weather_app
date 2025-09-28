// Package imports:
import 'package:core/exports/di.dart';

// Project imports:
import 'package:weather_app/features/no_connection/presentation/bloc/no_connection_bloc.dart';
import 'package:weather_app/features/no_connection/presentation/providers.dart';

List<Override> buildNoConnectionDiOverrides() => [
  noConnectionBlocProvider.overrideWith((ref) => NoConnectionBloc()),
];
