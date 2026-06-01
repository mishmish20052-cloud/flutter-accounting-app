import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light(ColorScheme? lightDynamic) {
    return ThemeData(
      colorScheme: lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    );
  }

  static ThemeData dark(ColorScheme? darkDynamic) {
    return ThemeData(
      colorScheme: darkDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    );
  }
}
