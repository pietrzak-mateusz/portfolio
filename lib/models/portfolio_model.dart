/// Represents the root data model for the entire portfolio.
///
/// Contains personal information, social links, navigation items,
/// localizations, skills, and projects loaded from the data source.
class PortfolioModel {
  /// Personal details including name, biography, and profile image.
  final PersonalInfoModel personalInfo;

  /// Links and icons for social media profiles.
  final SocialLinksModel socialLinks;

  /// List of navigation menu items.
  final List<NavigationItemModel> navigation;

  /// Global translations for UI elements, mapped by key then language code.
  final Map<String, Map<String, String>> translations;

  /// Categories of technical skills.
  final List<SkillCategoryModel> skills;

  /// List of projects to display in the portfolio.
  final List<ProjectModel> projects;

  /// Creates a [PortfolioModel] instance.
  PortfolioModel({
    required this.personalInfo,
    required this.socialLinks,
    required this.navigation,
    required this.translations,
    required this.skills,
    required this.projects,
  });

  /// Factory constructor to create a [PortfolioModel] from a JSON map.
  ///
  /// Returns an empty model with safe defaults if [json] is null.
  factory PortfolioModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PortfolioModel(
        personalInfo: PersonalInfoModel.empty(),
        socialLinks: SocialLinksModel.empty(),
        navigation: [],
        translations: {},
        skills: [],
        projects: [],
      );
    }
    return PortfolioModel(
      personalInfo: PersonalInfoModel.fromJson(json['personalInfo'] as Map<String, dynamic>?),
      socialLinks: SocialLinksModel.fromJson(json['socialLinks'] as Map<String, dynamic>?),
      navigation: (json['navigation'] as List?)?.map((item) => NavigationItemModel.fromJson(item as Map<String, dynamic>?)).toList() ?? [],
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, Map<String, String>.from(value as Map)),
      ) ?? {},
      skills: (json['skills'] as List?)?.map((item) => SkillCategoryModel.fromJson(item as Map<String, dynamic>?)).toList() ?? [],
      projects: (json['projects'] as List?)?.map((item) => ProjectModel.fromJson(item as Map<String, dynamic>?)).toList() ?? [],
    );
  }
}

/// Represents the personal information section of the portfolio.
class PersonalInfoModel {
  /// The user's first name.
  final String name;

  /// The user's last name.
  final String surname;

  /// Obfuscated email segments to prevent scraping.
  final List<String> emailParts;

  /// Localized greeting message.
  final Map<String, String> greeting;

  /// Path to the profile image asset.
  final String profileImage;

  /// Localized biographical text.
  final Map<String, String> biography;

  /// Creates a [PersonalInfoModel] instance.
  PersonalInfoModel({
    required this.name,
    required this.surname,
    required this.emailParts,
    required this.greeting,
    required this.profileImage,
    required this.biography,
  });

  /// Creates an empty [PersonalInfoModel] with default values.
  factory PersonalInfoModel.empty() {
    return PersonalInfoModel(
      name: '',
      surname: '',
      emailParts: [],
      greeting: {},
      profileImage: '',
      biography: {},
    );
  }

  /// Factory constructor to create a [PersonalInfoModel] from a JSON map.
  ///
  /// Returns [PersonalInfoModel.empty()] if [json] is null.
  factory PersonalInfoModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PersonalInfoModel.empty();
    return PersonalInfoModel(
      name: json['name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      emailParts: (json['emailParts'] as List?)?.map((e) => e as String).toList() ?? [],
      greeting: (json['greeting'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      profileImage: json['profileImage'] as String? ?? '',
      biography: (json['biography'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
    );
  }
}

/// Represents the user's social media and professional links.
class SocialLinksModel {
  /// URL to the GitHub profile.
  final String github;

  /// Path to the GitHub icon asset.
  final String githubIcon;

  /// Path to the Flutter icon asset.
  final String flutterIcon;

  /// URL to the LinkedIn profile.
  final String linkedin;

  /// Creates a [SocialLinksModel] instance.
  SocialLinksModel({
    required this.github,
    required this.githubIcon,
    required this.flutterIcon,
    required this.linkedin,
  });

  /// Creates an empty [SocialLinksModel] with default values.
  factory SocialLinksModel.empty() {
    return SocialLinksModel(github: '', githubIcon: '', flutterIcon: '', linkedin: '');
  }

  /// Factory constructor to create a [SocialLinksModel] from a JSON map.
  ///
  /// Returns [SocialLinksModel.empty()] if [json] is null.
  factory SocialLinksModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SocialLinksModel.empty();
    return SocialLinksModel(
      github: json['github'] as String? ?? '',
      githubIcon: json['githubIcon'] as String? ?? '',
      flutterIcon: json['flutterIcon'] as String? ?? '',
      linkedin: json['linkedin'] as String? ?? '',
    );
  }
}

/// Represents a single item in the navigation menu.
class NavigationItemModel {
  /// Unique identifier for the navigation item (often used for anchoring).
  final String id;

  /// Localized label for the navigation item.
  final Map<String, String> label;

  /// Creates a [NavigationItemModel] instance.
  NavigationItemModel({required this.id, required this.label});

  /// Factory constructor to create a [NavigationItemModel] from a JSON map.
  ///
  /// Returns an empty model if [json] is null.
  factory NavigationItemModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NavigationItemModel(id: '', label: {});
    return NavigationItemModel(
      id: json['id'] as String? ?? '',
      label: (json['label'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
    );
  }
}

/// Represents a category of skills (e.g., Languages, Frameworks).
class SkillCategoryModel {
  /// Unique identifier for the skill category.
  final String id;

  /// Localized title of the category.
  final Map<String, String> title;

  /// List of individual skills within this category.
  final List<String> items;

  /// Creates a [SkillCategoryModel] instance.
  SkillCategoryModel({required this.id, required this.title, required this.items});

  /// Factory constructor to create a [SkillCategoryModel] from a JSON map.
  ///
  /// Returns an empty model if [json] is null.
  factory SkillCategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SkillCategoryModel(id: '', title: {}, items: []);
    return SkillCategoryModel(
      id: json['id'] as String? ?? '',
      title: (json['title'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      items: (json['items'] as List?)?.map((e) => e as String).toList() ?? [],
    );
  }
}

/// Represents an external resource link associated with a project.
class ExternalLinkModel {
  /// Localized title of the external link.
  final Map<String, String> title;

  /// URL of the external resource.
  final String url;

  /// Creates an [ExternalLinkModel] instance.
  ExternalLinkModel({required this.title, required this.url});

  /// Factory constructor to create an [ExternalLinkModel] from a JSON map.
  ///
  /// Returns an empty model if [json] is null.
  factory ExternalLinkModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ExternalLinkModel(title: {}, url: '');
    return ExternalLinkModel(
      title: (json['title'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      url: json['url'] as String? ?? '',
    );
  }
}

/// Represents a portfolio project.
class ProjectModel {
  /// Unique identifier for the project.
  final String id;

  /// The type of project (e.g., 'my' or 'team').
  final String type;

  /// Localized title of the project.
  final Map<String, String> title;

  /// Localized short subtitle or summary.
  final Map<String, String> subtitle;

  /// Localized full description of the project.
  final Map<String, String> description;

  /// List of asset paths for project images.
  final List<String> images;

  /// Localized captions corresponding to each image.
  final List<Map<String, String>> imageCaptions;

  /// List of technologies or frameworks used in the project.
  final List<String> technologies;

  /// Optional URL to the project's GitHub repository.
  final String? githubLink;

  /// Optional URL to the live project or website.
  final String? webLink;

  /// Additional external resources or links related to the project.
  final List<ExternalLinkModel> externalLinks;

  /// Creates a [ProjectModel] instance.
  ProjectModel({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.images,
    required this.imageCaptions,
    required this.technologies,
    this.githubLink,
    this.webLink,
    this.externalLinks = const [],
  });

  /// Factory constructor to create a [ProjectModel] from a JSON map.
  ///
  /// Returns an empty model if [json] is null.
  factory ProjectModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProjectModel(id: '', type: '', title: {}, subtitle: {}, description: {}, images: [], imageCaptions: [], technologies: []);
    return ProjectModel(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: (json['title'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      subtitle: (json['subtitle'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      description: (json['description'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      images: (json['images'] as List?)?.map((e) => e as String).toList() ?? [],
      imageCaptions: (json['imageCaptions'] as List?)?.map((item) => (item as Map<String, dynamic>).map((k, v) => MapEntry(k, v as String))).toList() ?? [],
      technologies: (json['technologies'] as List?)?.map((e) => e as String).toList() ?? [],
      githubLink: json['githubLink'] as String?,
      webLink: json['webLink'] as String?,
      externalLinks: (json['externalLinks'] as List?)?.map((item) => ExternalLinkModel.fromJson(item as Map<String, dynamic>?)).toList() ?? [],
    );
  }
}
