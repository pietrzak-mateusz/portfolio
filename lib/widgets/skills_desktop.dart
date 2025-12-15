import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';

// ============================================
// TWO-COLUMN VARIANT (for wider screens)
// ============================================

/// Desktop skills section with two-column layout for better readability.
/// 
/// Splits skill categories into two columns and displays each category
/// with its associated skills as a single text string separated by bullets.
class SkillsDesktopTwoColumns extends StatelessWidget {
  const SkillsDesktopTwoColumns({super.key});

  @override
  Widget build(BuildContext context) {
    // Split categories into two columns
    final halfLength = (skillCategories.length / 2).ceil();
    final leftColumn = skillCategories.sublist(0, halfLength);
    final rightColumn = skillCategories.sublist(halfLength);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in leftColumn) ...[
                    _buildSkillCategory(
                      categoryKey: category["categoryKey"],
                      skills: List<String>.from(category["skills"]),
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
            
            const SizedBox(width: 60), // Spacing between columns
            
            // Right column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in rightColumn) ...[
                    _buildSkillCategory(
                      categoryKey: category["categoryKey"],
                      skills: category["skills"],
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single skill category widget with translated content.
  /// 
  /// Displays the category title and a list of skills separated by bullet points.
  Widget _buildSkillCategory({
    required String categoryKey,
    required List<String> skills,
  }) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        // Translate all skills and join them with a bullet separator
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
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),

            const SizedBox(height: 12),

            // --------------------
            // SKILLS LIST (single text with bullet separators)
            // --------------------
            Text(
              skillsText,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.whiteSecondary,
                height: 1.6,
              ),
            ),
          ],
        );
      },
    );
  }
}