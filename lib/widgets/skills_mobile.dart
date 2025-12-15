import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';

/// Mobile version of the skills section.
/// 
/// Displays skill categories in a single column for better readability on small screens.
/// Each category shows a title and a list of skills separated by bullet points.
class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Iterate through each skill category and build its widget
        for (int i = 0; i < skillCategories.length; i++) ...[
          _buildSkillCategory(
            categoryKey: skillCategories[i]["categoryKey"],
            skills: List<String>.from(skillCategories[i]["skills"]),
          ),

          // Add spacing between categories, but not after the last one
          if (i < skillCategories.length - 1)
            const SizedBox(height: 20),
        ],
      ],
    );
  }

  /// Builds a single skill category widget for mobile.
  /// 
  /// Displays the category title and a list of skills as a single string
  /// with bullet separators. The content is automatically translated.
  Widget _buildSkillCategory({
    required String categoryKey,
    required List<String> skills,
  }) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (_, __, ___) {
        // Combine all translated skills with bullet separators
        final skillsText = skills
            .map((skillKey) => t(skillKey))
            .join(' • ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------
            // CATEGORY TITLE
            // --------------------
            Text(
              t(categoryKey),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 8),

            // --------------------
            // SKILLS LIST (as a single string with bullets)
            // --------------------
            Text(
              skillsText,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        );
      },
    );
  }
}