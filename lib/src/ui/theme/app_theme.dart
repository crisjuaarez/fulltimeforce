import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData themeData({required bool isDark}) {
    return (isDark)
        ? ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: _colorScheme,
            appBarTheme: _appBarTheme,
            textTheme: _textTheme(isDark),
          )
        : ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme: _colorScheme,
            appBarTheme: _appBarTheme,
            textTheme: _textTheme(isDark),
          );
  }

  static final _colorScheme =
      ColorScheme.fromSeed(seedColor: AppColors.primary);
  static const _appBarTheme = AppBarTheme(backgroundColor: AppColors.primary);

  static TextTheme _textTheme(bool isDark) {
    final color = (isDark) ? Colors.white : Colors.black;
    return TextTheme(
      titleLarge: GoogleFonts.cabin(color: color),
      titleMedium: GoogleFonts.cabin(color: color),
      titleSmall: GoogleFonts.cabin(color: color),
      bodyLarge: GoogleFonts.cabin(color: color),
      bodyMedium: GoogleFonts.cabin(color: color),
      bodySmall: GoogleFonts.cabin(color: color),
      labelLarge: GoogleFonts.cabin(color: color),
      labelMedium: GoogleFonts.cabin(color: color),
      labelSmall: GoogleFonts.cabin(color: color),
      displayLarge: GoogleFonts.cabin(color: color),
      displayMedium: GoogleFonts.cabin(color: color),
      displaySmall: GoogleFonts.cabin(color: color),
      headlineLarge: GoogleFonts.cabin(color: color),
      headlineMedium: GoogleFonts.cabin(color: color),
      headlineSmall: GoogleFonts.cabin(color: color),
    );
  }
}
