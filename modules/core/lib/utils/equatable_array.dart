// Package imports:
import 'package:equatable/equatable.dart';

class EquatableArray extends Equatable {
  const EquatableArray(this.elements);

  EquatableArray.empty() : elements = [];
  final List<Object?> elements;

  @override
  List<Object?> get props => elements;
}
