import 'package:flutter/material.dart';

class ModeTheme {
  //* Lihgt Mode
  static final lightMode = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ));

  //* dark Mode
  static final darkMode = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ));
}
