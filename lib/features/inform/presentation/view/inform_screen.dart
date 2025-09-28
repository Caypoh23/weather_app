// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:weather_uikit/uikit.dart' as uikit;

class InformScreen extends StatelessWidget {
  const InformScreen({required this.viewModelBuilder, super.key});

  final uikit.EmptyStateModelBuilder viewModelBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: uikit.EmptyState(viewModelBuilder: viewModelBuilder));
  }
}
