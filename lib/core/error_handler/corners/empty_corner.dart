// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:weather_uikit/uikit.dart' as uikit;

class EmptyCorner extends StatelessWidget {
  const EmptyCorner({
    required this.onRefresh,
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  final VoidCallback onRefresh;

  final Widget icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return uikit.CommonRefresher(
      onRefresh: onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 16),
            Text(title, style: context.displayTextStyle.display4),
            const SizedBox(height: 8),
            Text(
              description,
              style: context.baseTextStyle.base1.copyWith(
                color: context.textColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            uikit.CommonSafeArea.b24(),
          ],
        ),
      ),
    );
  }
}
