// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:weather_localization/strings.g.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/features/inform/presentation/view/inform_screen.dart';

// Package imports:

class ServiceUnavailableErrorCorner extends StatelessWidget {
  const ServiceUnavailableErrorCorner({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return InformScreen(
      viewModelBuilder: (context) => uikit.EmptyStateModel(
        title: context.tr.errors.somethingWentWrong,
        buttonText: context.tr.shared.retry,
        onButtonPressed: onRetry,
      ),
    );
  }
}
