import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

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
    final halfLength = (PortfolioService.data.skills.length / 2).ceil();
    final leftColumn = PortfolioService.data.skills.sublist(0, halfLength);
    final rightColumn = PortfolioService.data.skills.sublist(halfLength);

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
                    _buildSkillCategory(context, category),
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
                    _buildSkillCategory(context, category),
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
  Widget _buildSkillCategory(BuildContext context, SkillCategoryModel category) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, lang, _) {
        // Translate all skills and join them with a bullet separator
        final skillsText = category.items.join(' • ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------
            // CATEGORY TITLE
            // --------------------
            Text(
              category.title[lang] ?? category.title['en']!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            // --------------------
            // SKILLS LIST (single text with bullet separators)
            // --------------------
            Text(
              skillsText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.6,
              ),
            ),
          ],
        );
      },
    );
  }
}