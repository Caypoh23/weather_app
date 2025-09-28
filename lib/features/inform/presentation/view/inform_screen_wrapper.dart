// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/features/inform/presentation/view/inform_screen.dart';

class InformScreenWrapper extends StatelessWidget {
  const InformScreenWrapper({required this.viewModelBuilder, super.key});

  final uikit.EmptyStateModelBuilder viewModelBuilder;

  static const path = '/inform';

  @override
  Widget build(BuildContext context) {
    return InformScreen(viewModelBuilder: viewModelBuilder);
  }
}
