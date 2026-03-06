import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

class ProjectImageGallery extends StatefulWidget {
  final ProjectModel project;
  final double sliderWidth;
  final double sliderHeight;

  const ProjectImageGallery({
    super.key,
    required this.project,
    required this.sliderWidth,
    required this.sliderHeight,
  });

  @override
  State<ProjectImageGallery> createState() => _ProjectImageGalleryState();
}

class _ProjectImageGalleryState extends State<ProjectImageGallery> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image Slider
        SizedBox(
          width: widget.sliderWidth,
          height: widget.sliderHeight,
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
                    width: widget.sliderWidth,
                    height: widget.sliderHeight,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Caption
        if (widget.project.imageCaptions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ValueListenableBuilder<String>(
              valueListenable: localeNotifier,
              builder: (context, lang, _) {
                return Text(
                  widget.project.imageCaptions[_currentPage][lang] ?? widget.project.imageCaptions[_currentPage]['en'] ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),

        const SizedBox(height: 12),

        // Gallery navigation
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
    );
  }
}
