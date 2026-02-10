import 'package:flutter/material.dart';

class ColorManager {
  /// =========================
  /// Cafe Theme (Brown + Yellow)
  /// =========================

  // Primary Swatch (Coffee Brown)
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF6F4E37,
    <int, Color>{
      50: Color(0xFFF3ECE7),
      100: Color(0xFFE0D0C2),
      200: Color(0xFFCBB29A),
      300: Color(0xFFFFD54F),
      400: Color(0xFFFFC107),
      500: Color(0xFF6F4E37), // main
      600: Color(0xFF644531),
      700: Color(0xFF573B2A),
      800: Color(0xFF4A3123),
      900: Color(0xFF362118),
    },
  );

  // Primary Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color secondaryColor = Color.fromARGB(
    255,
    48,
    23,
    17,
  ); // Dark Coffee Brown
  static const Color primaryColorDark = Color.fromARGB(
    255,
    13,
    12,
    14,
  ); // Espresso
  static const Color primaryColorLight = Color.fromARGB(
    255,
    215,
    196,
    179,
  ); // Light Coffee Brown

  // Accent Colors
  static const Color accentColor = Color(0xFFFFC107); // Warm Yellow
  static const Color secondaryAccentColor = Color(0xFFFFB300); // Darker Yellow
  static const Color highlightColor = Color(0xFFFFD54F);

  // Background & Surface
  static const Color backgroundColor = Color(0xFFF7F3EF); // Latte
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFDF8F4);

  // Borders & Shadows
  static const Color borderColor = Color(0xFFD6CCC2);
  static const Color shadowColor = Color(0xFFBCAAA4);
  static const Color lightShadowColor = Color(0xFFE0D0C2);

  // Text
  static const Color textColor = Color.fromARGB(255, 27, 27, 27); // Espresso
  static const Color secondaryTextColor = Color(0xFF6D4C41);

  // Functional
  static const Color successColor = Color(0xFF689F38); // Olive green
  static const Color warningColor = Color(0xFFFFA000); // Amber
  static const Color error = Color(0xFFC62828); // Brick red
  static const Color disabledColor = Color(0xFF9E9E9E);
  static const Color disabledTextColor = Color(0xFFBDBDBD);
  static const Color primaryContainerColor = Color.fromARGB(255, 126, 85, 78);
  // =========================
  // Dark Mode (Espresso)
  // =========================

  static const Color darkBackground = Color(0xFF1B1B1B);
  static const Color darkCardColor = Color(0xFF262626);
  static const Color darkSurfaceColor = Color(0xFF2F2F2F);

  static const Color darkTextColor = Color(0xFFF5F5F5);
  static const Color darkSecondaryTextColor = Color(0xFFBCAAA4);

  static const Color darkPrimaryContainerColor = Color(0xFF3E2723);
  static const Color darkShadowColor = Color(0xFF000000);

  // Focus / Selection
  static const Color focusColor = Colors.blueAccent;
}
