import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
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
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_upward, color: Theme.of(context).colorScheme.onSurface, size: 20),
              const SizedBox(width: 12),
              ValueListenableBuilder<String>(
                valueListenable: localeNotifier,
                builder: (context, lang, _) {
                  return Text(
                    PortfolioService.data.translations['return']?[lang] ?? PortfolioService.data.translations['return']?['en'] ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myProjects = PortfolioService.data.projects.where((p) => p.type == 'my').toList();
    final teamProjects = PortfolioService.data.projects.where((p) => p.type == 'team').toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // --------------------
          // MY PROJECTS
          // --------------------
          ValueListenableBuilder<String>(
            valueListenable: localeNotifier,
            builder: (context, lang, _) {
              return Text(
                PortfolioService.data.translations['projects_my']?[lang] ?? PortfolioService.data.translations['projects_my']?['en'] ?? '',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
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
          ValueListenableBuilder<String>(
            valueListenable: localeNotifier,
            builder: (context, lang, _) {
              return Text(
                PortfolioService.data.translations['projects_team']?[lang] ?? PortfolioService.data.translations['projects_team']?['en'] ?? '',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
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
