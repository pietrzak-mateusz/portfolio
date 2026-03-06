import 'package:flutter/material.dart';
import 'package:my_portfolio/models/portfolio_model.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/pages/project_detail_page.dart';

/// Card widget for displaying project previews in a horizontal layout.
/// 
/// Shows project image on the left and text content on the right.
/// Tapping the "View details" button navigates to the project detail page.
class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  /// The project data to display in this card
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: 200,
      width: 820, // Wider than typical cards for horizontal layout
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // ---- LEFT SIDE: PROJECT IMAGE ----
          Container(
            width: 200,
            height: 200,
            color: Theme.of(context).colorScheme.shadow, // Fallback background
            child: Image.asset(
              project.images[0], // First image as preview
              fit: BoxFit.cover,
            ),
          ),

          // ---- RIGHT SIDE: TEXT CONTENT ----
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project title (internationalized)
                  ValueListenableBuilder<String>(
                    valueListenable: localeNotifier,
                    builder: (context, lang, _) {
                      return Text(
                        project.title[lang] ?? project.title['en']!,
                        style: isMobile
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // Project description/subtitle (internationalized)
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: localeNotifier,
                      builder: (context, lang, _) {
                        final style = isMobile
                            ? Theme.of(context).textTheme.bodyMedium
                            : Theme.of(context).textTheme.bodyLarge;
                        return Text(
                          project.subtitle[lang] ?? project.subtitle['en']!,
                          style: style?.copyWith(
                            height: 1.4,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ----- "VIEW DETAILS" BUTTON -----
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // Navigate to the detailed project view
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailPage(project: project),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ValueListenableBuilder<String>(
                          valueListenable: localeNotifier,
                          builder: (context, lang, _) {
                            return Text(
                              PortfolioService.data.translations['details_button']?[lang] ?? PortfolioService.data.translations['details_button']?['en'] ?? '',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}