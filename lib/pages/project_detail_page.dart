import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';
import 'package:my_portfolio/utils/project_utils.dart';

/// Detailed view page for a single project.
/// Displays project images, description, technologies, and navigation controls.
class ProjectDetailPage extends StatefulWidget {
  final ProjectUtils project;
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
      backgroundColor: CustomColor.scaffoldBg,
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
                  child: LText(
                    widget.project.titleKey,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                    textAlign: TextAlign.center,
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
                        LText(
                          'built_with',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.whiteSecondary.withAlpha((0.7 * 255).round()),
                            letterSpacing: 0.5,
                          ),
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
                                color: CustomColor.bgLight2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  color: CustomColor.whiteSecondary,
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

                        // Gallery navigation (only shown if multiple images)
                        if (widget.project.images.length > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.chevron_left, color: CustomColor.whiteSecondary),
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
                                style: const TextStyle(
                                  color: CustomColor.whiteSecondary,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.chevron_right, color: CustomColor.whiteSecondary),
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
                      builder: (_, __, ___) {
                        return RichText(
                          textAlign: TextAlign.justify,
                          textWidthBasis: TextWidthBasis.longestLine,
                          text: TextSpan(
                            text: t(widget.project.descriptionKey),
                            style: const TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              color: CustomColor.whiteSecondary,
                            ),
                          ),
                        );
                      },
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
              color: CustomColor.bgLight2,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CustomColor.whitePrimary,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: CustomColor.whitePrimary,
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