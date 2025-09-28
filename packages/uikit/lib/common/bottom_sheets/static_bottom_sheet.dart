// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_uikit/common/bottom_sheets/scroll_indicator.dart';
import 'package:weather_uikit/common/focus_remover.dart';
import 'package:weather_uikit/common/gesture_detector.dart';
import 'package:weather_uikit/common/safe_area.dart';
import 'package:weather_uikit/gen/assets.gen.dart';
import 'package:weather_uikit/theme/app_typography_theme_data.dart';
import 'package:weather_uikit/theme/color_theme_data.dart';
import 'package:weather_uikit/utils/media_helper.dart';

class StaticBottomSheet extends StatelessWidget {
  const StaticBottomSheet({
    required this.child,
    this.title,
    this.hasIndicator = true,
    this.fixedHeight,
    super.key,
  });

  final Widget child;
  final String? title;

  final bool hasIndicator;
  final double? fixedHeight;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaHelper.keybord(context);
    final isKeyboardVisible = bottom != 0;

    return FocusRemover(
      child: Container(
        height: fixedHeight,
        decoration: BoxDecoration(
          color: context.systemColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIndicator) const ScrollIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (title != null) ...[
                  Expanded(
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: context.titleTextStyle.title2,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                CommonGestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: UikitAssets.icons32.closeCircle.svg(),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [child],
              ),
            ),
            isKeyboardVisible ? SizedBox(height: bottom) : CommonSafeArea.b24(),
          ],
        ),
      ),
    );
  }
}
