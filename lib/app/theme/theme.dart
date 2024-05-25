import 'package:dashboard/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orangeAccent,
    primary: Colors.orangeAccent,
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
  badgeTheme: BadgeThemeData(
    backgroundColor: Colors.orange.shade900,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orangeAccent,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
  ),
  dialogTheme: DialogTheme(),
);

class StyleText {
  static const px14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
