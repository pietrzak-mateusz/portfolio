import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';

/// Classes responsible for language changes
/// Internationalized text widgets that automatically update when the locale changes.
/// These widgets listen to `localeNotifier` and use the `t()` function for translation.

class LText extends StatelessWidget {
  final String keyName; // Translation key from strings.dart
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
      builder: (_, __, ___) {
        return Text(
          t(keyName),
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
      builder: (_, __, ___) {
        final left = t(leftKey);
        final right = t(rightKey);

        final baseStyle = style ??
            const TextStyle(
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: CustomColor.whiteSecondary,
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
  final String keyName; // Translation key from strings.dart
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
      builder: (_, __, ___) {
        return Text.rich(
          TextSpan(
            text: t(keyName),
            style: style,
          ),
        );
      },
    );
  }
}