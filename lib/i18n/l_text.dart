import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';

/// Classes responsible for language changes
/// Internationalized text widgets that automatically update when the locale changes.
/// These widgets listen to `localeNotifier` and use the PortfolioService translations.

class LText extends StatelessWidget {
  final String keyName; // Translation key
  final TextStyle? style;
  final TextAlign? textAlign;

  const LText(
    this.keyName, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, lang, _) {
        return Text(
          PortfolioService.data.translations[keyName]?[lang] ?? PortfolioService.data.translations[keyName]?['en'] ?? keyName,
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }
}

/// Rich text with an embedded icon between two translated text segments.
class LRichText extends StatelessWidget {
  final String leftKey;      // Translation key for text left of the icon
  final String rightKey;     // Translation key for text right of the icon
  final String iconAsset;    // Path to the icon image asset
  final double iconHeight;
  final TextStyle? style;

  const LRichText({
    super.key,
    required this.leftKey,
    required this.rightKey,
    required this.iconAsset,
    this.iconHeight = 16,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, lang, _) {
        final left = PortfolioService.data.translations[leftKey]?[lang] ?? PortfolioService.data.translations[leftKey]?['en'] ?? leftKey;
        final right = PortfolioService.data.translations[rightKey]?[lang] ?? PortfolioService.data.translations[rightKey]?['en'] ?? rightKey;

        final baseStyle = style ?? Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 14,
        );

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: baseStyle,
            children: [
              TextSpan(text: left),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Image.asset(
                    iconAsset,
                    height: iconHeight,
                  ),
                ),
              ),
              TextSpan(text: right),
            ],
          ),
        );
      },
    );
  }
}

/// TextSpan wrapper for internationalized text within RichText widgets.
class LSpan extends StatelessWidget {
  final String keyName; // Translation key
  final TextStyle? style;

  const LSpan(
    this.keyName, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, lang, _) {
        return Text.rich(
          TextSpan(
            text: PortfolioService.data.translations[keyName]?[lang] ?? PortfolioService.data.translations[keyName]?['en'] ?? keyName,
            style: style,
          ),
        );
      },
    );
  }
}