import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFF5F5F5),
      primary: Color(0xFFE8AD00),
      onPrimary: Color(0xFF1C1C1C),
      secondary: Color(0xFF1E1E1E),
      onSurface: Colors.black,
      onSurfaceVariant: Color(0xFF6B6B6B),
      outline: Color(0xFFD0D5DD),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Colors.black,
      primary: Color(0xFFFFD900),
      onPrimary: Color(0xFF1C1C1C),
      secondary: Color(0xFFEDEDED),
      onSurface: Color(0xFFEDEDED),
      onSurfaceVariant: Color(0xFFB3B3B3),
      outline: Color(0xFF3A3A3A),
    ),
  );
}
