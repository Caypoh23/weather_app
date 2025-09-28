// Package imports:
import 'package:core/exports/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.temp,
  });

  final double temp;

  @override
  List<Object?> get props => <Object?>[
        temp,
      ];
}
