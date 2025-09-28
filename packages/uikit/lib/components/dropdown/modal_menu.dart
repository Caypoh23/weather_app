// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_uikit/components/dropdown/base_dropdown.dart';
import 'package:weather_uikit/theme/app_typography_theme_data.dart';

class ModalMenu extends StatelessWidget {
  const ModalMenu({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.isEnabled = true,
    this.maxHeight,
    super.key,
  });

  final Widget child;
  final List<String> items;
  final void Function(String)? onValueChanged;

  final bool isEnabled;

  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return BaseDropdown(
      targetChild: child,
      isEnabled: isEnabled,
      maxHeight: maxHeight,
      itemCount: items.length,
      menuPadding: const EdgeInsets.symmetric(vertical: 8.0),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      onSelected: (index) {
        onValueChanged?.call(items[index]);
      },
      itemBuilder: (context, index) {
        final item = items[index];

        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [Expanded(child: Text(item, style: context.baseTextStyle.base3))],
          ),
        );
      },
    );
  }
}
