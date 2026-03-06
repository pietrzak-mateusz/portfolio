import 'package:flutter/material.dart';

// Moved from constants/colors.dart directly into the theme
class CustomColor {
  static const Color scaffoldBg = Color(0xff252734);
  static const Color bgLight1 = Color(0xff333646);
  static const Color bgLight2 = Color(0xff424657);
  static const Color textFieldBg = Color(0xffC8C9CE);
  static const Color hintDark = Color(0xff666874);
  static const Color yellowSecondary = Color(0xffFFC25C);
  static const Color yellowPrimary = Color(0xffFFAF29);
  static const Color whitePrimary = Color(0xffEAEAEB);
  static const Color whiteSecondary = Color(0xffC8C9CE);
}

/// Custom dark theme for the portfolio application.
/// 
/// Extends the built-in dark theme with custom styling for icons and buttons
/// to maintain visual consistency throughout the app.
ThemeData kCustomTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: CustomColor.scaffoldBg,
  colorScheme: const ColorScheme.dark(
    primary: CustomColor.yellowPrimary,
    secondary: CustomColor.yellowSecondary,
    surface: CustomColor.bgLight1,
    surfaceContainerHighest: CustomColor.bgLight2,
    onPrimary: CustomColor.whitePrimary,
    onSecondary: CustomColor.whitePrimary,
    onSurface: CustomColor.whitePrimary,
    onSurfaceVariant: CustomColor.hintDark,
    outline: CustomColor.textFieldBg,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: CustomColor.whitePrimary),
    bodyMedium: TextStyle(color: CustomColor.whitePrimary),
    bodySmall: TextStyle(color: CustomColor.whiteSecondary),
  ),
  // Sets the default color for all icons
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  
  // Defines the default style for all ElevatedButton widgets
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.yellowPrimary,
      foregroundColor: CustomColor.whitePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100), // Fully rounded corners
      ),
      fixedSize: const Size.fromHeight(45), // Consistent button height
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);