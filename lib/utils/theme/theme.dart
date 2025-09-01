import 'package:ecommerce_flutter/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ecommerce_flutter/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // Make it as private container

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TxtTheme.lightTextTheme,
    elevatedButtonTheme: ElevateButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    bottomSheetTheme: BottomsheetTheme.lightBottomSheetTheme,
    checkboxTheme: CheckBoxTheme.lightCheckboxTheme,
    chipTheme: ChipsTheme.lightChipTheme,
    inputDecorationTheme: TextFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: OutlineButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TxtTheme.darkTextTheme,
    elevatedButtonTheme: ElevateButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppbarTheme.darkAppBarTheme,
    bottomSheetTheme: BottomsheetTheme.darkBottomSheetTheme,
    checkboxTheme: CheckBoxTheme.darkCheckboxTheme,
    chipTheme: ChipsTheme.darkChipTheme,
    inputDecorationTheme: TextFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: OutlineButtonTheme.darkOutlinedButtonTheme,
  );
}