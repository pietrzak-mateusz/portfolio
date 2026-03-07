import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/models/portfolio_model.dart';
import 'package:my_portfolio/utils/text_utils.dart';

/// A widget that displays the detailed description of a project.
///
/// It correctly handles parsing Markdown-like links embedded in the text
/// and respects the maximum width defined by [sliderWidth].
class ProjectDescription extends StatelessWidget {
  /// The project whose description will be displayed.
  final ProjectModel project;

  /// The maximum width the text container should occupy.
  final double sliderWidth;

  /// Creates a [ProjectDescription] widget.
  const ProjectDescription({
    super.key,
    required this.project,
    required this.sliderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: sliderWidth),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ValueListenableBuilder<String>(
            valueListenable: localeNotifier,
            builder: (context, lang, _) {
              return RichText(
                textAlign: TextAlign.justify,
                textWidthBasis: TextWidthBasis.longestLine,
                text: TextSpan(
                children: parseTextWithLinks(
                  project.description[lang] ?? project.description['en']!,
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 1.5,
                  ),
                ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
