// Package imports:
import 'package:core/exports/equatable.dart';

class City extends Equatable {
  const City({required this.name, required this.lat, required this.long});

  final String name;
  final double? lat;
  final double? long;

  @override
  List<Object?> get props => <Object?>[name, lat, long];
}
