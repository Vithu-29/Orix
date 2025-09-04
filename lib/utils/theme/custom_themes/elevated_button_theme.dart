import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ElevateButtonTheme {
  ElevateButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorsScheme.light,
      backgroundColor: ColorsScheme.primary,
      disabledForegroundColor: ColorsScheme.darkGrey,
      disabledBackgroundColor: ColorsScheme.buttonDisabled,
      side: const BorderSide(color: ColorsScheme.primary),
      padding: const EdgeInsets.symmetric(vertical: Sizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: ColorsScheme.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonRadius)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorsScheme.light,
      backgroundColor: ColorsScheme.primary,
      disabledForegroundColor: ColorsScheme.darkGrey,
      disabledBackgroundColor: ColorsScheme.darkerGrey,
      side: const BorderSide(color: ColorsScheme.primary),
      padding: const EdgeInsets.symmetric(vertical: Sizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: ColorsScheme.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.buttonRadius)),
    ),
  );
}
