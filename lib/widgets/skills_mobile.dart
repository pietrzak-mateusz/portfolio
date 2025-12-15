import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';
import '../i18n/locale_controller.dart';
import '../i18n/strings.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < skillCategories.length; i++) ...[
          _buildSkillCategory(
            categoryKey: skillCategories[i]["categoryKey"],
            skills: List<String>.from(skillCategories[i]["skills"]),
          ),

          if (i < skillCategories.length - 1)
            const SizedBox(height: 20),
        ],
      ],
    );
  }

  /// Pojedyncza kategoria umiejętności (MOBILE)
  Widget _buildSkillCategory({
    required String categoryKey,
    required List<String> skills,
  }) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (_, __, ___) {
        final skillsText = skills
            .map((skillKey) => t(skillKey))
            .join(' • ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------
            // CATEGORY TITLE
            // --------------------
            Text(
              t(categoryKey),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 8),

            // --------------------
            // SKILLS LIST
            // --------------------
            Text(
              skillsText,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        );
      },
    );
  }
}

/*
// ============================================
// WARIANT Z EXPANDABLE (accordion)
// ============================================

class SkillsMobileExpandable extends StatefulWidget {
  const SkillsMobileExpandable({super.key});

  @override
  State<SkillsMobileExpandable> createState() => _SkillsMobileExpandableState();
}

class _SkillsMobileExpandableState extends State<SkillsMobileExpandable> {
  // Track które kategorie są rozwinięte
  final Set<int> _expandedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < skillCategories.length; i++)
          _buildExpandableCategory(
            index: i,
            category: skillCategories[i]["category"],
            skills: skillCategories[i]["skills"],
          ),
      ],
    );
  }

  Widget _buildExpandableCategory({
    required int index,
    required String category,
    required List<dynamic> skills,
  }) {
    final isExpanded = _expandedCategories.contains(index);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header (zawsze widoczny, klikalny)
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedCategories.remove(index);
                } else {
                  _expandedCategories.add(index);
                }
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
                  
                  // Licznik umiejętności
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: CustomColor.whitePrimary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${skills.length}',
                      style: const TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 8),
                  
                  // Ikona strzałki
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: CustomColor.whiteSecondary,
                  ),
                ],
              ),
            ),
          ),
          
          // Zawartość (rozwijana)
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                skills.join(' • '),
                style: const TextStyle(
                  color: CustomColor.whiteSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
*/