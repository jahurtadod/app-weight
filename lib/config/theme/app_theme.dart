import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 7, 80, 59);

const primaryColor = Color(0xFFD1AD69);
const secondaryColor = Color(0xFF44CBB6);
const textColor = Color(0xFF1A1A1A);

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      // scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
    );
  }
}
