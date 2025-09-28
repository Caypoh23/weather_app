// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_uikit/theme/colors/brand/super_app/super_app_brand_colors.dart';

final lightSuperAppBrandColors = _generatePaletteFromBrightness(Brightness.light);
final darkSuperAppBrandColors = _generatePaletteFromBrightness(Brightness.dark);

SuperAppBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return SuperAppBrandColors(
      primary: const Color(0xFF222222),
      secondary: const Color(0xFF4D4d4D),
      tertiary: const Color(0xFF6C6C6C),
      transparent: Color(0x1A222222),
    );
  } else {
    return SuperAppBrandColors(
      primary: const Color(0xFF222222),
      secondary: const Color(0xFF4D4d4D),
      tertiary: const Color(0xFF6C6C6C),
      transparent: Color(0x1A222222),
    );
  }
}
