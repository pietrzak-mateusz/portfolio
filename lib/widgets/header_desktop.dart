import 'package:flutter/material.dart';
// import 'package:my_portfolio/widgets/site_logo.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';
// import '../styles/style.dart';

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

      // ZERO dekoracji:
      decoration: const BoxDecoration(),

      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      // width: double.maxFinite,
      // decoration: kHederDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // ← Tutaj zmiana
        children: [
          // Usuń Spacer()
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
    );
  }
}
