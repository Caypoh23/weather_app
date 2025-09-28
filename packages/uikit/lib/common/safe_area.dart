// Flutter imports:
import 'package:flutter/material.dart';

class CommonSafeArea extends StatelessWidget {
  const CommonSafeArea._({
    required this.top,
    required this.bottom,
    required this.height,
  });

  factory CommonSafeArea.b8() =>
      const CommonSafeArea._(top: false, bottom: true, height: 8);

  factory CommonSafeArea.b12() =>
      const CommonSafeArea._(top: false, bottom: true, height: 12);

  factory CommonSafeArea.b16() =>
      const CommonSafeArea._(top: false, bottom: true, height: 16);

  factory CommonSafeArea.b24() =>
      const CommonSafeArea._(top: false, bottom: true, height: 24);

  final bool top;
  final bool bottom;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: top,
      bottom: bottom,
      child: SizedBox(height: height),
    );
  }
}
