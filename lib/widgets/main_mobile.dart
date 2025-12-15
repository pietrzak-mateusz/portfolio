import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';

/// Mobile version of the main portfolio section.
/// 
/// Vertical layout optimized for small screens, with responsive image sizing.
/// Text content appears above the profile image for better mobile reading flow.
class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // Responsive image width calculation:
    // - Phones (< 700px): 75% of screen width for larger image
    // - Tablets (≥ 700px): 1/3 of screen width, matching desktop proportions
    final double imageWidth = screenWidth < 700 ? screenWidth * 0.75 : screenWidth / 3;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      // Flexible minimum height; mobile content naturally scrolls vertically
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TEXT CONTENT (text first for better mobile reading flow)
          const LText(
            'greeting',
            style: TextStyle(
              fontSize: 30, // Consistent with desktop font size
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),

          const LText(
            'biography',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 30),

          // PROFILE IMAGE with responsive sizing
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/Luska_transparency.webp",
                width: imageWidth,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}