import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color.fromRGBO(100, 100, 100, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    elevation: 0,
  ),
);
