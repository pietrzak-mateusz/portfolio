import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/utils/project_utils.dart';
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
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 820, // Wider than typical cards for horizontal layout
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // ---- LEFT SIDE: PROJECT IMAGE ----
          Container(
            width: 200,
            height: 200,
            color: Colors.black12, // Fallback background
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
                  LText(
                    project.titleKey,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Project description/subtitle (internationalized)
                  Expanded(
                    child: LText(
                      project.subtitleKey,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        color: CustomColor.whiteSecondary,
                      ),
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
                          color: CustomColor.bgLight1,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const LText(
                          'details_button',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
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