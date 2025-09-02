import 'package:ecommerce_flutter/utils/theme/theme.dart';
import 'package:flutter/material.dart';

//To setup themes , initial bindings
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}