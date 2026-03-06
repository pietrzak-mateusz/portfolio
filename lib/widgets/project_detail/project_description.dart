import 'package:flutter/material.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/models/portfolio_model.dart';
import 'package:my_portfolio/utils/text_utils.dart';

class ProjectDescription extends StatelessWidget {
  final ProjectModel project;
  final double sliderWidth;

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
    );
  }
}
