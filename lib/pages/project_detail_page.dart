import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/portfolio_model.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/widgets/project_detail/project_image_gallery.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/widgets/project_detail/project_description.dart';
import 'package:my_portfolio/widgets/project_detail/project_resources.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final ScrollController _scrollController = ScrollController();

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    const double maxSliderWidth = 900.0;
    final double sliderWidth = min(screenWidth - 40, maxSliderWidth);
    final double sliderHeight = sliderWidth * 0.6;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // 1. TITLE
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: sliderWidth),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder<String>(
                        valueListenable: localeNotifier,
                        builder: (context, lang, _) {
                          return Text(
                            widget.project.title[lang] ?? widget.project.title['en']!,
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 2. TECH STACK CHIPS & LABEL
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: sliderWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<String>(
                          valueListenable: localeNotifier,
                          builder: (context, lang, _) {
                            final text = PortfolioService.data.translations['built_with']?[lang] ??
                                         PortfolioService.data.translations['built_with']?['en'] ??
                                         (lang == 'pl' ? 'Wykorzystane technologie' : 'Built with');
                            return Text(
                              text,
                              style: Theme.of(context).textTheme.titleLarge,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.project.technologies.map((tech) {
                            return Chip(
                              label: Text(tech),
                              backgroundColor: Theme.of(context).colorScheme.surface,
                              labelStyle: Theme.of(context).textTheme.labelMedium,
                              side: BorderSide.none,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 3. GITHUB & WEB LINKS
                if (widget.project.githubLink != null || widget.project.webLink != null)
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: sliderWidth),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: WrapAlignment.start,
                          children: [
                        if (widget.project.githubLink != null)
                          ElevatedButton.icon(
                            onPressed: () => _launchURL(widget.project.githubLink!),
                            icon: const Icon(Icons.code),
                            label: const Text("GitHub"),
                          ),
                        if (widget.project.webLink != null)
                          ElevatedButton.icon(
                            onPressed: () => _launchURL(widget.project.webLink!),
                            icon: const Icon(Icons.open_in_new),
                            label: const Text("Live Demo"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (widget.project.githubLink != null || widget.project.webLink != null)
                  const SizedBox(height: 40),

                // 4. IMAGE GALLERY
                if (widget.project.images.isNotEmpty)
                  ProjectImageGallery(
                    project: widget.project,
                    sliderWidth: sliderWidth,
                    sliderHeight: sliderHeight,
                  ),

                const SizedBox(height: 30),

                // 5. DESCRIPTION
                ProjectDescription(
                  project: widget.project,
                  sliderWidth: sliderWidth,
                ),

                const SizedBox(height: 40),

                // 6. RESOURCES & LINKS
                if (widget.project.externalLinks.isNotEmpty)
                  ProjectResources(
                    project: widget.project,
                    sliderWidth: sliderWidth,
                  ),

                const SizedBox(height: 40),
              ],
            ),
          ),

          // Floating back button
          Positioned(
            top: 20,
            left: max(20, (screenWidth - maxSliderWidth) / 2 - 200),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
