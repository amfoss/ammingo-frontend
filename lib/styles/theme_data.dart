import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFF4F5F7),
      primary: Color(0xFFFFB300), // Deep Yellow / Amber
      primaryContainer: Color(0xFFFFECB3),
      tertiary: Color(0xFFB78103),
      onPrimary: Colors.black,
      secondary: Color(0xFF111111),
      onSurface: Color(0xFF111111),
      surfaceContainer: Color(0xFFFFFFFF),
      surfaceContainerHighest: Color(0xFFE4E7EB),
      onSurfaceVariant: Color(0xFF5A6065),
      outline: Color(0xFFCBD5E1),
      outlineVariant: Color(0xFFE2E8F0),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Colors.black, // True Black
      primary: Color(0xFFFFC107), // Deep Yellow / Amber
      primaryContainer: Color(0xFF332701),
      tertiary: Color(0xFFFFD54F),
      onPrimary: Colors.black,
      secondary: Color(0xFFFAFAFA),
      onSurface: Color(0xFFF1F5F9),
      surfaceContainer: Color(0xFF141414), // Dark Charcoal / Near Black
      surfaceContainerHighest: Color(0xFF222222),
      onSurfaceVariant: Color(0xFF94A3B8),
      outline: Color(0xFF334155),
      outlineVariant: Color(0xFF1E293B),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Color(0xFF141414),
    ),
  );
}
