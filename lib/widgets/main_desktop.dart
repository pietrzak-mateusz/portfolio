import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ← KLUCZOWA ZMIANA
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI'm Lucynka\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              Text(
                "Jak dasz pracę to podam łapkę. \n\n"
                "Pekińczyk – jedna z ras psów należąca do grupy\n "
                "psów do towarzystwa, zaklasyfikowana do sekcji\n "
                "spanieli japońskich i pekińczyków. Typ jamnikowaty.\n "
                "Nie podlega próbom pracy.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
          Image.asset(
            "assets/Luska_transparency.webp",
            width: screenWidth / 3,
          ),
        ],
      ),
    );
  }
}
