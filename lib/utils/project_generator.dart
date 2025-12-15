import 'package:my_portfolio/utils/project_utils.dart';

/// Mapping of project IDs to their associated image asset paths.
final Map<String, List<String>> _imagesById = {
  'm1': ['assets/projects/pekinczyk_01.jpg', 'assets/projects/pekinczyk_02.jpg'],
  'm2': ['assets/projects/pekinczyk_food_01.jpg', 'assets/projects/pekinczyk_food_02.jpg'],
  'm3': ['assets/projects/pekinczyk_training_01.jpg', 'assets/projects/pekinczyk_training_02.jpg'],
  't1': ['assets/projects/pekinczyk_social_01.jpg', 'assets/projects/pekinczyk_social_02.jpg'],
  't2': ['assets/projects/pekinczyk_health_01.jpg', 'assets/projects/pekinczyk_health_02.jpg'],
};

/// Mapping of project IDs to their technology stacks.
final Map<String, List<String>> _techById = {
  'm1': ['Flutter', 'Dart', 'Provider'],
  'm2': ['Flutter', 'Dart', 'SQLite'],
  'm3': ['Flutter', 'Dart', 'Firebase'],
  't1': ['Flutter', 'Riverpod', 'Firebase'],
  't2': ['Flutter', 'Dart', 'REST API'],
};

/// Returns the list of image assets for a given project ID.
/// Returns a placeholder image if the ID is not found.
List<String> _getImagesForId(String id) =>
    _imagesById[id] ?? const ['assets/projects/placeholder.png'];

/// Returns the list of technologies for a given project ID.
/// Returns default technologies ['Flutter', 'Dart'] if the ID is not found.
List<String> _getTechForId(String id) =>
    _techById[id] ?? const ['Flutter', 'Dart'];

/// Builds a ProjectUtils instance for the given project ID with auto-generated i18n keys.
/// 
/// Automatically generates translation keys in the format: 'project.{id}.title/subtitle/description'
ProjectUtils _buildFromId(String id) {
  const prefix = 'project';

  return ProjectUtils(
    id: id,
    images: _getImagesForId(id),
    technologies: _getTechForId(id),

    /// Auto-generated i18n keys for the project
    titleKey: '$prefix.$id.title',
    subtitleKey: '$prefix.$id.subtitle',
    descriptionKey: '$prefix.$id.description',
  );
}

/// Generates a map of project IDs to ProjectUtils instances.
/// 
/// Example: {'m1': ProjectUtils(...), 'm2': ProjectUtils(...)}
Map<String, ProjectUtils> generateProjectsMap(List<String> ids) {
  return { for (final id in ids) id : _buildFromId(id) };
}

/// Generates a list of ProjectUtils instances from the given IDs.
/// 
/// Preserves the order of the input list.
List<ProjectUtils> generateProjectsList(List<String> ids) {
  return ids.map(_buildFromId).toList();
}