import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ValueListenableBuilder<String>(
          // Listens to locale changes for dynamic text updates
          valueListenable: localeNotifier,
          builder: (context, lang, _) {
            final navIcons = [Icons.home, Icons.build, Icons.apps]; // Assuming standard icons since data/nav_items.dart is gone
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
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),

                // --------------------
                // INTERNATIONALIZED NAVIGATION ITEMS
                // --------------------
                for (int i = 0; i < PortfolioService.data.navigation.length; i++)
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30),
                    titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      onNavItemTap(i);
                    },
                    leading: Icon(
                      navIcons[i],
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(PortfolioService.data.navigation[i].label[lang] ?? PortfolioService.data.navigation[i].label['en']!),
                  ),

                const SizedBox(height: 24),
                Divider(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  thickness: 0.3,
                ),
                const SizedBox(height: 16),

                // --------------------
                // LANGUAGE SWITCHER WITH ICON
                // --------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.language,
                      size: 22,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 10),
                    const LanguageSwitcher(),
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
