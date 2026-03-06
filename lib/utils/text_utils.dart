import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<InlineSpan> parseTextWithLinks(String text, TextStyle baseStyle) {
  // Regex do wykrywania linków
  final RegExp linkRegExp = RegExp(r'(https?://[^\s]+)');
  final List<InlineSpan> spans = [];

  // Szukamy wszystkich dopasowań linków w tekście
  text.splitMapJoin(
    linkRegExp,
    onMatch: (Match match) {
      final String url = match.group(0)!;
      spans.add(
        TextSpan(
          text: url,
          style: baseStyle.copyWith(
            color: Colors.blue, // Kolor linku
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final Uri uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
        ),
      );
      return '';
    },
    onNonMatch: (String text) {
      spans.add(TextSpan(text: text, style: baseStyle));
      return '';
    },
  );

  return spans;
}