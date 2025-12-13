import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/styles/theme.dart';
import 'i18n/strings.dart'; // import mapy
import 'i18n/locale_controller.dart';

// widget LText — używaj zamiast Text(...)
class LText extends StatelessWidget {
  final String keyName;
  final TextStyle? style;
  final TextAlign? textAlign;
  const LText(this.keyName, {super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (_, __, ___) {
        return Text(t(keyName), style: style, textAlign: textAlign);
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme,
      // title: 'Test title',
      home: const HomePage(),
    );
  }
}
