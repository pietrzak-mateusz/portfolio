import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';
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
        color: CustomColor.scaffoldBg,
        // Subtle shadow for visual separation
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
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
              builder: (_, __, ___) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < navTitleKeys.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(
                          onPressed: () => onNavMenuTap(i),
                          child: Text(
                            t(navTitleKeys[i]),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: CustomColor.whitePrimary,
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
          const Row(
            children: [
              Icon(Icons.language, size: 24, color: CustomColor.whiteSecondary),
              SizedBox(width: 6),
              LanguageSwitcher(),
            ],
          ),
        ],
      ),
    );
  }
}