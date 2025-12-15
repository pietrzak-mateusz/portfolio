import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';

/// Desktop version of the main portfolio section.
/// 
/// Displays the greeting, biography, and profile image in a responsive two-column layout.
/// Uses a maximum width constraint to maintain readability on large screens.
class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000, // Maximum width for content readability
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: screenHeight / 1.2,
          constraints: const BoxConstraints(minHeight: 350.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left column: Text content (greeting and biography)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Greeting text
                    const LText(
                      'greeting',
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Biography text with justified alignment
                    ValueListenableBuilder<String>(
                      valueListenable: localeNotifier,
                      builder: (context, _, __) {
                        return RichText(
                          textAlign: TextAlign.justify,
                          textWidthBasis: TextWidthBasis.longestLine,
                          text: TextSpan(
                            text: t('biography'),
                            style: const TextStyle(
                              fontSize: 17,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              // Right column: Profile image with responsive width
              Image.asset(
                "assets/Luska_transparency.webp",
                width: (screenWidth * 0.25).clamp(300.0, 500.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
