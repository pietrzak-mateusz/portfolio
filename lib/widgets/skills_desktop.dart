import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ----------------------------------
        // PLATFORM ITEMS — BEZ TŁA, BEZ RAMKI
        // ----------------------------------
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                SizedBox(
                  width: 200,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 6.0,
                    ),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: 26.0,
                    ),
                    title: Text(
                      platformItems[i]["title"],
                      style: const TextStyle(color: CustomColor.whitePrimary),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(width: 50),

        // ----------------------------------
        // SKILL ITEMS — BEZ TŁA I BEZ CHIP
        // ----------------------------------
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        skillItems[i]["img"],
                        width: 26.0,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skillItems[i]["title"],
                        style: const TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
