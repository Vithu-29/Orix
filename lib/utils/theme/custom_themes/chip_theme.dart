import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChipsTheme {
  ChipsTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ColorsScheme.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: ColorsScheme.black),
    selectedColor: ColorsScheme.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ColorsScheme.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ColorsScheme.darkerGrey,
    labelStyle: const TextStyle(color: ColorsScheme.white),
    selectedColor: ColorsScheme.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ColorsScheme.white,
  );
}
