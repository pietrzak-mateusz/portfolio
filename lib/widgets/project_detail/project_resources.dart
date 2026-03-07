import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

/// A widget that displays a list of external resources and links
/// associated with a specific project.
class ProjectResources extends StatelessWidget {
  /// The project containing the external links.
  final ProjectModel project;

  /// The maximum width the resources container should occupy.
  final double sliderWidth;

  /// Creates a [ProjectResources] widget.
  const ProjectResources({
    super.key,
    required this.project,
    required this.sliderWidth,
  });

  /// Opens the provided URL in the default browser.
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (project.externalLinks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: sliderWidth),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String>(
              valueListenable: localeNotifier,
                builder: (context, lang, _) {
                  return Text(
                    PortfolioService.data.translations['resources_links']?[lang] ?? PortfolioService.data.translations['resources_links']?['en'] ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
              ),
              const SizedBox(height: 12),
              ...project.externalLinks.map((link) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                    onTap: () => _launchURL(link.url),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.link, size: 20, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 8),
                        Flexible(
                          child: ValueListenableBuilder<String>(
                            valueListenable: localeNotifier,
                            builder: (context, lang, _) {
                              return Text(
                                link.title[lang] ?? link.title['en']!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
