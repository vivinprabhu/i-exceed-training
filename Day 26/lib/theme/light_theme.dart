import 'package:flutter/material.dart';

class AppColors {
  static const pureWhite = Color(0xFFFFFFFF);
  static const softBlueGray = Color(0xFFF1F6F8);
  static const mutedGrayPeach = Color(0xFFCDD5D6);
  static const navyBlueDark = Color(0xFF142850);
  static const navyBlue = Color(0xFF1E3C64);
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.pureWhite,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.navyBlue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.navyBlueDark),
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.navyBlue,
    surface: AppColors.softBlueGray,
    onSurface: AppColors.navyBlueDark,
  ),
  inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Color(0xFF0D47A1), fontSize: 18),
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 16),
          prefixStyle: const TextStyle(color: Color(0xFF0D47A1), fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF0D47A1), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.shade800, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.shade800, width: 1.5),
          ),
        ),
);
