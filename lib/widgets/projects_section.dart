import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // --- Przyciski w stylu kafelków ---
  Widget _backToTopButton(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          final scrollableState = Scrollable.of(context);
          final position = scrollableState.position;
          position.animateTo(
            position.minScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
                },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
              SizedBox(width: 12),
              Text(
                "Powrót",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // My projects title
          const Text(
            "Moje projekty",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          // My projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < myProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: myProjectUtils[i],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 80),

          // Team projects title
          const Text(
            "Projekty, w których brałem udział",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          // Team projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < teamProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: teamProjectUtils[i],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          Center(child: _backToTopButton(context)),
        ],
      ),
    );
  }
}
