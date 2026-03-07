import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

/// A section widget that displays the user's technical skills.
///
/// It acts as a responsive wrapper, rendering either [SkillsDesktopTwoColumns]
/// or [SkillsMobile] depending on the current [maxWidth].
class SkillsSection extends StatelessWidget {
  /// Creates a [SkillsSection] widget.
  const SkillsSection({
    super.key,
    required this.screenWidth,
    required this.maxWidth,
  });

  /// The current width of the screen.
  final double screenWidth;

  /// The maximum allowed width, used to determine the responsive layout.
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
