import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/config/theme/app_styles.dart';
import 'package:todo/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
        headlineLarge: AppStyles.titleStyle,
        bodyLarge: AppStyles.taskTitle,
        bodyMedium: AppStyles.taskDescription,
        headlineMedium: AppStyles.unSelectedDateStyle,
        displayMedium: AppStyles.settingsBody),
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
        shape: CircleBorder(side: BorderSide(width: 3.w, color: Colors.white))),
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
        headlineLarge:
            AppStyles.titleStyle.copyWith(color: ColorsManager.blackDark),
        bodyLarge: AppStyles.taskTitle,
        bodyMedium:
            AppStyles.taskDescription.copyWith(color: ColorsManager.white),
        headlineMedium: AppStyles.unSelectedDateStyle.copyWith(color: ColorsManager.white),
        displayMedium: AppStyles.settingsBody
          .copyWith(color: ColorsManager.white)),
    brightness: Brightness.dark,
    primaryColor: ColorsManager.primaryBlue,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blackDark,
      selectedItemColor: ColorsManager.primaryBlue,
      unselectedItemColor: ColorsManager.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primaryBlue,
        shape: CircleBorder(
            side: BorderSide(width: 3.w, color: ColorsManager.blackDark))),
  );
}
