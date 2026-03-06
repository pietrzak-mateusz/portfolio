import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

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
        for (int i = 0; i < PortfolioService.data.skills.length; i++) ...[
          _buildSkillCategory(context, PortfolioService.data.skills[i]),

          // Add spacing between categories, but not after the last one
          if (i < PortfolioService.data.skills.length - 1)
            const SizedBox(height: 20),
        ],
      ],
    );
  }

  /// Builds a single skill category widget for mobile.
  /// 
  /// Displays the category title and a list of skills as a single string
  /// with bullet separators. The content is automatically translated.
  Widget _buildSkillCategory(BuildContext context, SkillCategoryModel category) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, lang, _) {
        // Combine all translated skills with bullet separators
        final skillsText = category.items.join(' • ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------
            // CATEGORY TITLE
            // --------------------
            Text(
              category.title[lang] ?? category.title['en']!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 8),

            // --------------------
            // SKILLS LIST (as a single string with bullets)
            // --------------------
            Text(
              skillsText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.5,
              ),
            ),
          ],
        );
      },
    );
  }
}