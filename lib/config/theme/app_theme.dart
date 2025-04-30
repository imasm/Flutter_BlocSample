import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const Color seedColor = Colors.deepPurple;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: seedColor,
      appBarTheme: const AppBarTheme(backgroundColor: seedColor, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
    );
  }
}
