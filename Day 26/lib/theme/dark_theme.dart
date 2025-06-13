import 'package:flutter/material.dart';

class AppColorsDark {
  static const darkBackground = Color(0xFF0F172A);
  static const darkCard = Color(0xFF1E293B);
  static const darkText = Color(0xFFF1F5F9);
  static const navyBlue = Color(0xFF1E3C64);
}

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColorsDark.darkBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorsDark.navyBlue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColorsDark.darkText),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColorsDark.navyBlue,
    surface: AppColorsDark.darkCard,
    onSurface: AppColorsDark.darkText,
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
