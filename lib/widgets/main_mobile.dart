import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';

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
          ValueListenableBuilder<String>(
            valueListenable: localeNotifier,
            builder: (context, lang, _) {
              return Text(
                PortfolioService.data.personalInfo.greeting[lang] ?? PortfolioService.data.personalInfo.greeting['en']!,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  height: 1.5,
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          ValueListenableBuilder<String>(
            valueListenable: localeNotifier,
            builder: (context, lang, _) {
              return Text(
                PortfolioService.data.personalInfo.biography[lang] ?? PortfolioService.data.personalInfo.biography['en']!,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  height: 1.5,
                ),
              );
            },
          ),

          const SizedBox(height: 30),

          // PROFILE IMAGE with responsive sizing
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                PortfolioService.data.personalInfo.profileImage,
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