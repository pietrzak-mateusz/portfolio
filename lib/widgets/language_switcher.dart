import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';

/// Toggle switch widget for switching between Polish (PL) and English (EN) languages.
/// 
/// Features an animated slider that moves between language labels with visual feedback.
/// Tapping anywhere on the widget toggles the current language selection.
class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      // Listens to locale changes to update the visual state
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        final isPL = locale == 'pl';

        return GestureDetector(
          onTap: () {
            // Toggle between Polish and English
            localeNotifier.value = isPL ? 'en' : 'pl';
          },
          child: Container(
            width: 70,
            height: 32,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                // ---------- ANIMATED SLIDER (background layer) ----------
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  alignment: isPL ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    width: 32,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                // ---------- LANGUAGE LABELS (foreground layer, centered) ----------
                Row(
                  children: [
                    // Polish (PL) label
                    Expanded(
                      child: Center(
                        child: Text(
                          'PL',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: isPL ? FontWeight.bold : FontWeight.normal,
                            color: isPL 
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    // English (EN) label
                    Expanded(
                      child: Center(
                        child: Text(
                          'EN',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: !isPL ? FontWeight.bold : FontWeight.normal,
                            color: !isPL 
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}