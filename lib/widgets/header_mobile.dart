import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../i18n/locale_controller.dart';
import 'language_switcher.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    required this.onMenuTap,
  });

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Row(
        children: [
          // --------------------
          // MENU BUTTON
          // --------------------
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            color: CustomColor.bgLight2,
            child: InkWell(
              onTap: onMenuTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CustomColor.whitePrimary,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.menu,
                  color: CustomColor.whitePrimary,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
