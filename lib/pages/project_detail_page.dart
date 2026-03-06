import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/models/portfolio_model.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
import 'package:my_portfolio/utils/text_utils.dart';
import 'package:url_launcher/url_launcher.dart';

/// Detailed view page for a single project.
/// Displays project images, description, technologies, and navigation controls.
class ProjectDetailPage extends StatefulWidget {
  final ProjectModel project;
  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive slider sizing
    final screenWidth = MediaQuery.of(context).size.width;
    const maxSliderWidth = 860.0;
    final sliderWidth = min(screenWidth * 0.95, maxSliderWidth);
    final sliderHeight = sliderWidth * 3 / 4; // 4:3 aspect ratio

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 20), // Top padding for back button
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project title
                Center(
                  child: ValueListenableBuilder<String>(
                    valueListenable: localeNotifier,
                    builder: (context, lang, _) {
                      return Text(
                        widget.project.title[lang] ?? widget.project.title['en']!,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // Technologies section (aligned with slider width)
                Center(
                  child: SizedBox(
                    width: sliderWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<String>(
                          valueListenable: localeNotifier,
                          builder: (context, lang, _) {
                            return Text(
                              PortfolioService.data.translations['built_with']?[lang] ?? PortfolioService.data.translations['built_with']?['en'] ?? '',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha((0.7 * 255).round()),
                                letterSpacing: 0.5,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),

                        // Technology tags
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: widget.project.technologies.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tech,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Image gallery with navigation controls
                Center(
                  child: SizedBox(
                    width: sliderWidth,
                    height: sliderHeight,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: widget.project.images.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    widget.project.images[index],
                                    fit: BoxFit.cover,
                                    width: sliderWidth,
                                    height: sliderHeight,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 12),

                        if (widget.project.imageCaptions.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ValueListenableBuilder<String>(
                              valueListenable: localeNotifier,
                              builder: (context, lang, _) {
                                return Text(
                                  widget.project.imageCaptions[_currentPage][lang] ?? widget.project.imageCaptions[_currentPage]['en'] ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),

                        const SizedBox(height: 12),

                        // Gallery navigation (only shown if multiple images)
                        if (widget.project.images.length > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.chevron_left, color: Theme.of(context).colorScheme.onSurfaceVariant),
                                onPressed: _currentPage > 0
                                    ? () {
                                        _pageController.previousPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    : null,
                              ),
                              Text(
                                '${_currentPage + 1} / ${widget.project.images.length}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
                                onPressed: _currentPage < widget.project.images.length - 1
                                    ? () {
                                        _pageController.nextPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    : null,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Project description (justified text)
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: sliderWidth),
                    child: ValueListenableBuilder<String>(
                      valueListenable: localeNotifier,
                      builder: (context, lang, _) {
                        return RichText(
                          textAlign: TextAlign.justify,
                          textWidthBasis: TextWidthBasis.longestLine,
                          text: TextSpan(
                            children: parseTextWithLinks(
                              widget.project.description[lang] ?? widget.project.description['en']!,
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // 5. RESOURCES & LINKS
                if (widget.project.externalLinks.isNotEmpty)
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: sliderWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<String>(
                            valueListenable: localeNotifier,
                            builder: (context, lang, _) {
                              return Text(
                                PortfolioService.data.translations['resources_links']?[lang] ?? PortfolioService.data.translations['resources_links']?['en'] ?? '',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          ...widget.project.externalLinks.map((link) {
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

                const SizedBox(height: 40),
              ],
            ),
          ),

          // Floating back button positioned for easy navigation
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

  /// Opens the provided URL in the default browser.
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}