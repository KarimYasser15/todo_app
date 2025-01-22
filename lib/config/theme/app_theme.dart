import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.primaryBlue,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      selectedItemColor: ColorsManager.primaryBlue,
      unselectedItemColor: ColorsManager.grey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    scaffoldBackgroundColor: ColorsManager.backgroundLight,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primaryBlue,
        shape: CircleBorder(side: BorderSide(width: 3, color: Colors.white))),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManager.primaryBlue,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blackDark,
      selectedItemColor: ColorsManager.primaryBlue,
      unselectedItemColor: ColorsManager.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
  );
}
