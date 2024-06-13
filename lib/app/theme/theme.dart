import 'package:dashboard/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orangeAccent,
    primary: Colors.orangeAccent,
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
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  menuButtonTheme: const MenuButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.white),
  )),
  dialogBackgroundColor: Colors.white,
  dropdownMenuTheme: const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      surfaceTintColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: Colors.white,
  ),
);
