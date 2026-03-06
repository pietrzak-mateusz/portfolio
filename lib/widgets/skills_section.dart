import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.screenWidth,
    required this.maxWidth,
  });

  final double screenWidth;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    const double kMedDesktopWidth = 800.0;
    final theme = Theme.of(context);

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: theme.colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section title
          LText(
            'skills_section',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 50),

          // Skills content - responsive layout
          if (maxWidth >= kMedDesktopWidth)
            const SkillsDesktopTwoColumns()
          else
            const SkillsMobile(),
        ],
      ),
    );
  }
}
