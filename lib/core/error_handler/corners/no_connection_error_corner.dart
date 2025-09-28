// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:weather_localization/strings.g.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/features/inform/presentation/view/inform_screen.dart';

class NoConnectionErrorCorner extends StatelessWidget {
  const NoConnectionErrorCorner({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return InformScreen(
      viewModelBuilder: (context) => uikit.EmptyStateModel(
        onButtonPressed: onRetry,
        buttonText: context.tr.shared.retry,
        title: context.tr.errors.noConnection,
        imagePath: uikit.UikitAssets.icons200.noConnection.path,
      ),
    );
  }
}
