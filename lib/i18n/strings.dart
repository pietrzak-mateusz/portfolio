import 'package:my_portfolio/data/personal_info.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/biography.dart';
import 'package:my_portfolio/i18n/skills.dart';
import 'package:my_portfolio/i18n/projects/project_m1.dart';
import 'package:my_portfolio/i18n/projects/project_m2.dart';
import 'package:my_portfolio/i18n/projects/project_m3.dart';
import 'package:my_portfolio/i18n/projects/project_t1.dart';

/// Internationalization strings for the portfolio application.
/// 
/// Structure: {'language-code': {'key': 'translated_text', ...}}
/// 
/// Supported languages: English ('en') and Polish ('pl').
/// Use the `t(String key)` function to retrieve translations.
/// 
/// Keys follow a hierarchical naming convention:
/// - Navigation: 'nav.*'
/// - Skills categories: 'skills.*'
/// - Individual skills: 'skill.*'
/// - Projects: 'project.{id}.title/subtitle/description'
/// - UI elements: descriptive names (e.g., 'greeting', 'built_with')
const Map<String, Map<String, String>> strings = {
    'pl': {
    'nav.home': 'Strona główna',
    'nav.skills': 'Umiejętności',
    'nav.projects': 'Projekty',
    'greeting': "Cześć,\nJestem Lucynka\nFlutter Developer",
    // Biography
    ...biographyStringsPl,
    'about_short': "Pekińczyk — pies do towarzystwa...",
    'skills_section': "Umiejętności",
    'projects_my': "Moje projekty",
    'details_button' :"Zobacz szczegóły",
    'projects_team': "Projekty zespołowe",
    'built_with': "Wykorzystane technologie: ",
    'contact': "✉ Napisz do mnie",
    'return': "Powrót",
    'copy_email': "Kopiuj e-mail",
    'email_copied': "Adres e-mail został skopiowany!",
    'github_source': "Zobacz kod na GitHubie",
    'made_by_p1': "Stworzone przez: ${PersonalInfo.name} — zbudowane z ",
    'made_by_p2': " Flutter 3.38.4\n© 2025 • Projekt open-source (MIT)",

    // Skills
    ...skillsStringsPl,

    // ============================================
    // MY PROJECTS
    // ============================================
    // Projekt m1
    ...projectM1StringsPl,
    // Projekt m2
    ...projectM2StringsPl,
    // Projekt m3
    ...projectM3StringsPl,

    // ============================================
    // TEAM PROJECTS
    // ============================================
    // Projekt t1
    ...projectT1StringsPl,
  },
  'en': {
    'nav.home': 'Home',
    'nav.skills': 'Skills',
    'nav.projects': 'Projects',
    'greeting': "Hi,\nI'm Lucynka\nA Flutter Developer",
    // Biography
    ...biographyStringsEn,
    'skills_section': "Technical Skills",
    'projects_my': "My projects",
    'projects_team': "Team Projects",
    'built_with': "Built with: ",
    'details_button' :"View details",
    'contact': "✉ Mail me",
    'return': "   Top",
    'copy_email': "Copy e-mail",
    'email_copied': "E-mail address copied!",
    'github_source': "View source on GitHub",
    'made_by_p1': "Made by: ${PersonalInfo.name} — built with ",
    'made_by_p2': " Flutter 3.38.4\n© 2025 • This project is open-source (MIT)",
    
    // Skills
    ...skillsStringsEn,

    // ============================================
    // MY PROJECTS
    // ============================================
    // Projekt m1
    ...projectM1StringsEn,
    // Projekt m2
    ...projectM2StringsEn,
    // Projekt m3
    ...projectM3StringsEn,

    // ============================================
    // TEAM PROJECTS
    // ============================================
    // Projekt t1
    ...projectT1StringsEn,
  },
};

/// Retrieves a translated string for the current locale.
/// 
/// Returns the translation for the given key in the current language.
/// If the key is not found, returns a placeholder string with the key.
String t(String key) {
  final lang = localeNotifier.value;
  return strings[lang]?[key] ?? '⛔ $key';
}
