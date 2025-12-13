import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:my_portfolio/constants/personal_info.dart';
import '../i18n/l_text.dart';


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
          maxWidth: 1000, // <<< NAJWAŻNIEJSZE!
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: screenHeight / 1.2,
          constraints: const BoxConstraints(minHeight: 350.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    RichText(
                      textAlign: TextAlign.justify,
                      textWidthBasis: TextWidthBasis.longestLine,
                      text: const TextSpan(
                        text: PersonalInfo.biography,
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(width: 30),
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
