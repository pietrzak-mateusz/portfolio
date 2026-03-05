import 'project_data.dart';
import 'project_model.dart';

/// Factory responsible for creating [Project] instances
/// based on project IDs and static data.
///
/// This class:
/// - centralizes project creation logic
/// - generates i18n keys automatically
/// - applies safe fallbacks for missing data
class ProjectRepository {
  /// Prefix used for i18n keys:
  /// e.g. project.m1.title
  static const String _i18nPrefix = 'project';

  /// Builds a [Project] instance from a project ID.
  ///
  /// If the ID is not found in data maps,
  /// fallback values are used.
  static Project fromId(String id) {
    return Project(
      id: id,
      images: projectImages[id] ??
          const ['assets/projects/placeholder.png'],
      imageCaptionKeys: projectImageCaptions[id],
      technologies: projectTechnologies[id] ??
          const ['Flutter', 'Dart'],
      titleKey: '$_i18nPrefix.$id.title',
      subtitleKey: '$_i18nPrefix.$id.subtitle',
      descriptionKey: '$_i18nPrefix.$id.description',
    );
  }

  /// Builds a list of [Project] objects from a list of IDs.
  ///
  /// The order of the output list matches the input order.
  static List<Project> listFromIds(List<String> ids) {
    return ids.map(fromId).toList();
  }

  /// Cached list of personal projects (unmodifiable).
  static final List<Project> myProjects =
      List.unmodifiable(listFromIds(myProjectIds));

  /// Cached list of team projects (unmodifiable).
  static final List<Project> teamProjects =
      List.unmodifiable(listFromIds(teamProjectIds));
}
