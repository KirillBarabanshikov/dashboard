import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orangeAccent,
    background: const Color.fromRGBO(242, 242, 242, 1),
    surfaceTint: Colors.transparent,
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color.fromRGBO(100, 100, 100, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Color.fromRGBO(187, 187, 187, 1),
    thickness: 1,
    space: 0,
  ),
);
