import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';
import 'language_switcher.dart';



class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });

  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: CustomColor.scaffoldBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          // --------------------
          // LEWA STRONA (pusta – balans)
          // --------------------
          const SizedBox(width: 120),

          // --------------------
          // ŚRODEK – MENU
          // --------------------
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () => onNavMenuTap(i),
                      child: Text(
                        navTitles[i],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // --------------------
          // PRAWA STRONA – LANGUAGE SWITCHER
          // --------------------
          const Row(
            children: [
              Icon(Icons.language, size: 24, color: CustomColor.whiteSecondary),
              SizedBox(width: 6),
              // Twój obecny przełącznik
              LanguageSwitcher(),
            ],
          )
        ],
      ),
    );
  }
}
