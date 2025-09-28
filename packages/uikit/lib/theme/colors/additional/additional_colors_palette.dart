// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather_uikit/theme/colors/additional/additional_colors.dart';
import 'package:weather_uikit/theme/palette.dart';

final lightAdditionalColors = _generatePaletteFromBrightness(Brightness.light);
final darkAdditionalColors = _generatePaletteFromBrightness(Brightness.dark);

AdditionalColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return AdditionalColors(
      additional1: Palette.cyan[40]!,
      additional2: Palette.red[40]!,
      additional3: Palette.yellow[30]!,
      additional4: Palette.green[40]!,
    );
  } else {
    return AdditionalColors(
      additional1: Palette.cyan[40]!,
      additional2: Palette.red[40]!,
      additional3: Palette.yellow[30]!,
      additional4: Palette.green[40]!,
    );
  }
}
