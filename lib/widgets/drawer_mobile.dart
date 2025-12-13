import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';
import 'language_switcher.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.5, // ⬅️ 3/5 szerokości ekranu
      child: Drawer(
        backgroundColor: CustomColor.scaffoldBg,
        child: ListView(
          children: [
            // --------------------
            // CLOSE BUTTON
            // --------------------
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),

            // --------------------
            // NAV ITEMS
            // --------------------
            for (int i = 0; i < navIcons.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                titleTextStyle: const TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onNavItemTap(i);
                },
                leading: Icon(
                  navIcons[i],
                  color: CustomColor.whiteSecondary,
                ),
                title: Text(navTitles[i]),
              ),

            const SizedBox(height: 24),
            const Divider(color: CustomColor.whiteSecondary, thickness: 0.3),
            const SizedBox(height: 16),

            // --------------------
            // LANGUAGE SWITCHER
            // --------------------
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.language,
                    size: 22, color: CustomColor.whiteSecondary),
                SizedBox(width: 10),
                LanguageSwitcher(),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
