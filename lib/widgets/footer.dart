import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // EMAIL (wyraźny, wyróżniony)
          Text(
            "lucy_klusi@gmail.com",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 16),

          // INFORMACJE
          Text(
            "Made by Lucynka — based on a template by Shohruh AK\n"
            "Significantly modified and rebuilt with Flutter 3.38.4\n"
            "© 2024 Lucynka. All rights reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
