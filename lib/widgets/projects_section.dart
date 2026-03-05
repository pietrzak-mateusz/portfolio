import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/projects/project_repository.dart';
import 'package:my_portfolio/widgets/project_card.dart';

/// Projects section widget displaying personal and team projects.
///
/// This widget is responsible for:
/// - Creating project lists via ProjectFactory
/// - Rendering project cards
/// - Providing a "Back to top" button for better UX
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  /// Creates a styled button that scrolls back to the top of the page.
  ///
  /// Uses the nearest Scrollable ancestor and animates to the
  /// minimum scroll extent (top of the page).
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
          final scrollable = Scrollable.of(context);

          scrollable.position.animateTo(
            scrollable.position.minScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
              SizedBox(width: 12),
              LText(
                'return', // "Back to top"
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
    // Build project lists using the factory (single source of truth)
    final myProjects = ProjectRepository.myProjects;
    final teamProjects = ProjectRepository.teamProjects;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // --------------------
          // MY PROJECTS
          // --------------------
          const LText(
            'projects_my',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (final project in myProjects)
                  ProjectCardWidget(project: project),
              ],
            ),
          ),

          const SizedBox(height: 80),

          // --------------------
          // TEAM PROJECTS
          // --------------------
          const LText(
            'projects_team',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (final project in teamProjects)
                  ProjectCardWidget(project: project),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // --------------------
          // BACK TO TOP
          // --------------------
          Center(child: _backToTopButton(context)),
        ],
      ),
    );
  }
}
