import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    required this.onMenuTap,
  });

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,

      // ZERO dekoracji — jak w desktop
      decoration: const BoxDecoration(),

      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),

      child: Row(
        children: [
          // placeholder po lewej, aby menu nie przylegało do lewej krawędzi
          const SizedBox(width: 10),

          // PRZYCISK MENU (hamburger)
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(
              Icons.menu,
              color: CustomColor.whitePrimary,
              size: 28,
            ),
          ),

          // Reszta przestrzeni — pusty obszar
          const Spacer(),
        ],
      ),
    );
  }
}
