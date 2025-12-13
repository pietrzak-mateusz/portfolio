import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../i18n/locale_controller.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        final isPL = locale == 'pl';

        return GestureDetector(
          onTap: () {
            localeNotifier.value = isPL ? 'en' : 'pl';
          },
          child: Container(
            width: 70,  // Zmniejszone z 90
            height: 32, // Zmniejszone z 36
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                // ---------- SLIDER (na spodzie) ----------
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  alignment: isPL ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    width: 32,  // Zmniejszone z 38
                    height: 26, // Zmniejszone z 28
                    decoration: BoxDecoration(
                      color: CustomColor.whitePrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                // ---------- LABELS (na wierzchu, wyśrodkowane) ----------
                Row(
                  children: [
                    // Label PL
                    Expanded(
                      child: Center(
                        child: Text(
                          'PL',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isPL ? FontWeight.bold : FontWeight.normal,
                            color: isPL 
                                ? CustomColor.scaffoldBg 
                                : CustomColor.whiteSecondary,
                          ),
                        ),
                      ),
                    ),
                    // Label EN
                    Expanded(
                      child: Center(
                        child: Text(
                          'EN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: !isPL ? FontWeight.bold : FontWeight.normal,
                            color: !isPL 
                                ? CustomColor.scaffoldBg 
                                : CustomColor.whiteSecondary,
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
