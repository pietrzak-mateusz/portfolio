import 'package:flutter/material.dart';

class CustomColor {
  static const Color scaffoldBg = Color(0xff252734);
  static const Color bgLight1 = Color(0xff333646);
  static const Color bgLight2 = Color(0xff424657);
  static const Color textFieldBg = Color(0xffC8C9CE);
  static const Color hintDark = Color(0xffC8C9CE);
  static const Color yellowSecondary = Color(0xffFFC25C);
  static const Color yellowPrimary = Color(0xffFFAF29);
  static const Color whitePrimary = Color(0xffEAEAEB);
  static const Color whiteSecondary = Color(0xffC8C9CE);
}

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
    shadow: Color(0x1A000000), // Colors.black.withAlpha((0.1 * 255).round()) equivalent
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 57),
    displayMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 45),
    displaySmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 36),
    headlineLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 32),
    headlineMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 28),
    headlineSmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 24),
    titleLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 20),
    titleMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.w600, fontSize: 18),
    titleSmall: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.w500, fontSize: 16),
    bodyLarge: TextStyle(color: CustomColor.whitePrimary, fontSize: 16),
    bodyMedium: TextStyle(color: CustomColor.whitePrimary, fontSize: 14),
    bodySmall: TextStyle(color: CustomColor.whiteSecondary, fontSize: 12),
    labelLarge: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 14),
    labelMedium: TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.bold, fontSize: 12),
    labelSmall: TextStyle(color: CustomColor.whiteSecondary, fontWeight: FontWeight.bold, fontSize: 11),
  ),
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.yellowPrimary,
      foregroundColor: CustomColor.whitePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      fixedSize: const Size.fromHeight(45),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);
