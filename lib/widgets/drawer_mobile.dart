import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';
import 'package:my_portfolio/widgets/language_switcher.dart';

/// Mobile navigation drawer for the portfolio app.
/// 
/// Provides a slide-in menu for navigation on small screen devices.
/// Includes: navigation items, language switcher, and close button.
class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });

  /// Callback function triggered when a navigation item is tapped.
  /// Passes the index of the tapped item.
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      // Drawer width is 50% of screen width
      width: screenWidth * 0.5,
      child: Drawer(
        backgroundColor: CustomColor.scaffoldBg,
        child: ValueListenableBuilder<String>(
          // Listens to locale changes for dynamic text updates
          valueListenable: localeNotifier,
          builder: (_, __, ___) {
            return ListView(
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
                // INTERNATIONALIZED NAVIGATION ITEMS
                // --------------------
                for (int i = 0; i < navIcons.length; i++)
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30),
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
                    title: Text(t(navTitleKeys[i])),
                  ),

                const SizedBox(height: 24),
                const Divider(
                  color: CustomColor.whiteSecondary,
                  thickness: 0.3,
                ),
                const SizedBox(height: 16),

                // --------------------
                // LANGUAGE SWITCHER WITH ICON
                // --------------------
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.language,
                      size: 22,
                      color: CustomColor.whiteSecondary,
                    ),
                    SizedBox(width: 10),
                    LanguageSwitcher(),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
