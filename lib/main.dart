import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/styles/theme.dart';

/// Main entry point of the portfolio application.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
/// 
/// Configures the MaterialApp with custom theme and sets the homepage.
/// The debug banner is hidden for a cleaner presentation.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme, // Applies the custom dark theme
      home: const HomePage(), // Sets the homepage of the app
    );
  }
}
