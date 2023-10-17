import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);

    var theme = ThemeData(
      brightness: brightness,
      useMaterial3: false,
      scaffoldBackgroundColor: colorScheme.background,
      colorScheme: colorScheme,
    );

    final textTheme = GoogleFonts.ibmPlexSansArabicTextTheme(theme.textTheme);

    return theme = theme.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: const Color(0xff16141F),
      background: const Color(0xff171421),
      surface: const Color(0xff171421),
      onSurface: const Color(0xffF6FEFF),
    );
  }

  ThemeData buildDarkTheme() => _build(Brightness.dark);
  ThemeData buildLightTheme() => _build(Brightness.light);
}
