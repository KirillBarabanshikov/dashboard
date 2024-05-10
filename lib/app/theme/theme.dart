import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    background: AppColors.background,
    surfaceTint: Colors.transparent,
  ),
  scaffoldBackgroundColor: AppColors.background,
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
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);
