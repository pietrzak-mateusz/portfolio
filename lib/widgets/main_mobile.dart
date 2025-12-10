import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TEKST (najpierw tekst, potem zdjęcie)
          const Text(
            "Hi,\nI'm Lucynka\nA Flutter Developer",
            style: TextStyle(
              fontSize: 28,
              height: 1.4,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Jak dasz pracę to podam łapkę. \n\n"
            "Pekińczyk – jedna z ras psów należąca do grupy\n"
            "psów do towarzystwa, zaklasyfikowana do sekcji\n"
            "spanieli japońskich i pekińczyków. Typ jamnikowaty.\n"
            "Nie podlega próbom pracy.",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 30),

          // OBRAZEK
          Center(
            child: Image.asset(
              "assets/Luska_transparency.webp",
              width: screenWidth * 0.75, // proporcje dopasowane do telefonu
            ),
          ),
        ],
      ),
    );
  }
}
