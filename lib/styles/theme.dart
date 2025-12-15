import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

/// Custom dark theme for the portfolio application.
/// 
/// Extends the built-in dark theme with custom styling for icons and buttons
/// to maintain visual consistency throughout the app.
ThemeData kCustomTheme = ThemeData.dark().copyWith(
  // Sets the default color for all icons
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  
  // Defines the default style for all ElevatedButton widgets
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.yellowPrimary,
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