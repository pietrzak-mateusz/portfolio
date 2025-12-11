import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    // jeśli ekran jest szeroki (tablet/duży fon), trzymaj proporcję z desktopem,
    // inaczej daj większy obrazek dla telefonów
    final double imageWidth = screenWidth < 700 ? screenWidth * 0.75 : screenWidth / 3;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      // wysokość trzymamy elastyczną; nie "na siłę" identyczna z desktop
      // (mobilny content naturalnie przewija się w pionie)
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
              fontSize: 30, // dopasowane do desktop (desktop miał 30)
              height: 1.5,
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

          // OBRAZEK — dopasowany szerokością do ekranu (spójny z desktop)
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
