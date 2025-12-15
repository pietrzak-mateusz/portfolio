import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';
import '../i18n/locale_controller.dart';
import '../i18n/strings.dart';

/*
class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Iterujemy przez wszystkie kategorie
            for (int i = 0; i < skillCategories.length; i++) ...[
              _buildSkillCategory(
                category: skillCategories[i]["category"],
                skills: skillCategories[i]["skills"],
              ),
              
              // Odstęp między kategoriami
              if (i < skillCategories.length - 1)
                const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  /// Widget dla pojedynczej kategorii umiejętności
  Widget _buildSkillCategory({
    required String category,
    required List<dynamic> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nagłówek kategorii
        Text(
          category,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
            letterSpacing: 0.5,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Lista umiejętności w tej kategorii
        Wrap(
          spacing: 12, // odstęp poziomy między elementami
          runSpacing: 6, // odstęp pionowy gdy zawijają się do nowej linii
          children: skills.map((skill) {
            return Text(
              skill,
              style: const TextStyle(
                color: CustomColor.whiteSecondary,
                fontSize: 15,
                height: 1.4,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
*/

/*
// ============================================
// WARIANT Z BULLETAMI (jeśli wolisz kropki)
// ============================================

class SkillsDesktopWithBullets extends StatelessWidget {
  const SkillsDesktopWithBullets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < skillCategories.length; i++) ...[
              _buildSkillCategory(
                category: skillCategories[i]["category"],
                skills: skillCategories[i]["skills"],
              ),
              if (i < skillCategories.length - 1)
                const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory({
    required String category,
    required List<dynamic> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        
        // Umiejętności rozdzielone średnikami lub kropkami
        Text(
          skills.join(' • '), // użyj • jako separator
          style: const TextStyle(
            color: CustomColor.whiteSecondary,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
*/

// ============================================
// WARIANT Z DWOMA KOLUMNAMI (dla szerszych ekranów)
// ============================================

class SkillsDesktopTwoColumns extends StatelessWidget {
  const SkillsDesktopTwoColumns({super.key});

  @override
  Widget build(BuildContext context) {
    // Podziel kategorie na dwie kolumny
    final halfLength = (skillCategories.length / 2).ceil();
    final leftColumn = skillCategories.sublist(0, halfLength);
    final rightColumn = skillCategories.sublist(halfLength);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lewa kolumna
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in leftColumn) ...[
                    _buildSkillCategory(
                      categoryKey: category["categoryKey"],
                      skills: List<String>.from(category["skills"]),
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
            
            const SizedBox(width: 60), // odstęp między kolumnami
            
            // Prawa kolumna
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in rightColumn) ...[
                    _buildSkillCategory(
                      categoryKey: category["categoryKey"],
                      skills: category["skills"],
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory({
    required String categoryKey,
    required List<String> skills,
  }) {
    return ValueListenableBuilder<String>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        // Tłumaczymy wszystkie umiejętności i łączymy je separatorem
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
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),

            const SizedBox(height: 12),

            // --------------------
            // SKILLS LIST (jeden tekst z separatorem)
            // --------------------
            Text(
              skillsText,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.whiteSecondary,
                height: 1.6,
              ),
            ),
          ],
        );
      },
    );
  }
}
