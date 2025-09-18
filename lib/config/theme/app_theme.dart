import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: const Color(0xFF0F0F0F),

    listTileTheme: const ListTileThemeData(iconColor: seedColor),
  );
}
