import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/widgets/language_switcher.dart';

/// Desktop header widget with navigation menu and language switcher.
/// 
/// Features a centered navigation menu with internationalized text
/// and a language selector on the right side.
class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });

  /// Callback triggered when a navigation menu item is tapped.
  /// Provides the index of the selected navigation item.
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        // Subtle shadow for visual separation
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
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
          const SizedBox(width: 120),

          // --------------------
          // CENTER – INTERNATIONALIZED NAVIGATION MENU
          // --------------------
          Expanded(
            child: ValueListenableBuilder<String>(
              // Listens for locale changes to update text
              valueListenable: localeNotifier,
              builder: (context, lang, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < PortfolioService.data.navigation.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(
                          onPressed: () => onNavMenuTap(i),
                          child: Text(
                            PortfolioService.data.navigation[i].label[lang] ?? PortfolioService.data.navigation[i].label['en']!,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),

          // --------------------
          // RIGHT SIDE – LANGUAGE SWITCHER WITH ICON
          // --------------------
          Row(
            children: [
              Icon(Icons.language, size: 24, color: Theme.of(context).colorScheme.onSurfaceVariant),
              const SizedBox(width: 6),
              const LanguageSwitcher(),
            ],
          ),
        ],
      ),
    );
  }
}