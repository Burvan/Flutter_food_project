import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.brightPink,
      canvasColor: AppColors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.gentlyPink,
      ),
      cardColor: AppColors.lightPink,
      secondaryHeaderColor: AppColors.pinkSherbet,
      tabBarTheme: const TabBarTheme(
        indicatorColor: AppColors.brightPink,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.brightPink),
        ),
      ),
      switchTheme: const SwitchThemeData(
        trackColor: MaterialStatePropertyAll(AppColors.lightPink),
        thumbColor: MaterialStatePropertyAll(AppColors.grey),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          unselectedItemColor: AppColors.lightGrey,
          selectedItemColor: AppColors.gentlyPink),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.white,
      brightness: Brightness.dark,
      canvasColor: AppColors.black,
      secondaryHeaderColor: AppColors.lightGrey,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.indigo),
      tabBarTheme: const TabBarTheme(
        indicatorColor: AppColors.indigo,
      ),
      cardColor: AppColors.darkGrey,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.white),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.indigo),
        ),
      ),
      switchTheme: const SwitchThemeData(
        trackColor: MaterialStatePropertyAll(AppColors.lightGrey),
        thumbColor: MaterialStatePropertyAll(AppColors.indigo),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkGrey,
          unselectedItemColor: AppColors.white,
          selectedItemColor: AppColors.skyBlue),
    );
  }
}
