import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TextFieldTheme {
  TextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorsScheme.darkGrey,
    suffixIconColor: ColorsScheme.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeMd, color: ColorsScheme.black),
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeSm, color: ColorsScheme.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: ColorsScheme.black.withValues(alpha: 0.8),),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.grey,)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.grey,)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.dark,)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.warning,)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2,color: ColorsScheme.warning,)
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ColorsScheme.darkGrey,
    suffixIconColor: ColorsScheme.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeMd, color: ColorsScheme.white),
    hintStyle: const TextStyle().copyWith(fontSize: Sizes.fontSizeSm, color: ColorsScheme.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: ColorsScheme.white.withValues(alpha: 0.8),),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.darkGrey,)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.darkGrey,)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.white,)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1,color: ColorsScheme.warning,)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2,color: ColorsScheme.warning,)
    ),
  );
}