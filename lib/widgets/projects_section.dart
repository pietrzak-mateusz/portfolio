import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/project_card.dart';

/// Projects section widget that displays both personal and team projects.
/// 
/// Includes a scroll-to-top button for easy navigation back to the page top.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  /// Creates a styled button that scrolls back to the top of the page.
  /// 
  /// Uses the nearest Scrollable ancestor to find the scroll position
  /// and animates to the minimum scroll extent (top of the page).
  Widget _backToTopButton(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          // Get the current scrollable widget and animate to top
          final scrollableState = Scrollable.of(context);
          final position = scrollableState.position;
          position.animateTo(
            position.minScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
              SizedBox(width: 12),
              LText(
                'return', // "Back to top" text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Personal projects section title
          const LText(
            'projects_my',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          // Personal projects displayed in a wrapped layout
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < myProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: myProjectUtils[i],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 80),

          // Team projects section title
          const LText(
            'projects_team',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          // Team projects displayed in a wrapped layout
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < teamProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: teamProjectUtils[i],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          // Scroll to top button centered at the bottom
          Center(child: _backToTopButton(context)),
        ],
      ),
    );
  }
}