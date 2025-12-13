import 'package:flutter/material.dart';
import 'strings.dart';
import 'locale_controller.dart';

class LText extends StatelessWidget {
  final String keyName;
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
