// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_uikit/theme/app_typography_theme_data.dart';
import 'package:weather_uikit/theme/color_theme_data.dart';
import 'package:weather_uikit/theme/shadows/shadows.dart';

const _defaultHeight = 40.0;

class CommonTabBar extends StatelessWidget {
  const CommonTabBar({
    required this.tabLabels,
    required this.tabController,
    this.margin = EdgeInsets.zero,
    this.onTap,
    super.key,
  });

  final List<String> tabLabels;
  final TabController tabController;
  final EdgeInsets margin;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(color: context.surfaceColors.primary, borderRadius: BorderRadius.circular(10)),
      child: TabBar(
        onTap: onTap,
        padding: EdgeInsets.zero,
        controller: tabController,
        labelPadding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: context.textColors.primary,
        indicatorPadding: const EdgeInsets.all(2),
        splashBorderRadius: BorderRadius.circular(8),
        labelStyle: context.baseTextStyle.base3,
        indicatorColor: context.surfaceColors.primary,
        unselectedLabelColor: context.textColors.primary,
        dividerColor: context.systemColors.transparent,
        unselectedLabelStyle: context.baseTextStyle.base3,
        indicator: BoxDecoration(
          color: context.surfaceColors.tertiary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: CommonShadows.compactShadow,
        ),
        tabs: tabLabels.map((item) => Tab(text: item, height: _defaultHeight)).toList(),
        overlayColor: WidgetStateProperty.all(context.systemColors.transparent),
      ),
    );
  }
}
