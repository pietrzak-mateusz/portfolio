import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 820, // szersze, bo layout poziomy
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // ---- LEWA STRONA: ZDJĘCIE ----
          Container(
            width: 200,
            height: 200,
            color: Colors.black12,
            child: Image.asset(
              project.image,
              fit: BoxFit.cover,
            ),
          ),

          // ---- PRAWA STRONA ----
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tytuł projektu
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Opis projektu
                  Expanded(
                    child: Text(
                      project.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ----- PRZYCISK "Zobacz szczegóły" -----
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // TODO: Otworzyć stronę projektu
                        // np. Navigator.push(context, ...)
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
                        child: const Text(
                          "Zobacz szczegóły",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
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
