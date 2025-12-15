import 'package:my_portfolio/utils/project_generator.dart';

/// Represents a project in the portfolio with its data and translation keys.
/// 
/// This class stores all information needed to display a project:
/// - Project identifier (id)
/// - List of image asset paths
/// - List of technologies used
/// - Translation keys for title, subtitle, and description
class ProjectUtils {
  final String id;
  final List<String> images;
  final List<String> technologies;

  /// TRANSLATION KEYS for internationalized text
  final String titleKey;
  final String subtitleKey;
  final String descriptionKey;

  const ProjectUtils({
    required this.id,
    required this.images,
    required this.technologies,
    required this.titleKey,
    required this.subtitleKey,
    required this.descriptionKey,
  });
}

// Project ID lists for categorization
final myProjectIds = ['m1', 'm2', 'm3'];      // Personal projects
final teamProjectIds = ['t1', 't2'];          // Team projects

// Generated project lists using the project generator
final List<ProjectUtils> myProjectUtils = generateProjectsList(myProjectIds);
final List<ProjectUtils> teamProjectUtils = generateProjectsList(teamProjectIds);
