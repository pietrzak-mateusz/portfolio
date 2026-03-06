class PortfolioModel {
  final PersonalInfoModel personalInfo;
  final SocialLinksModel socialLinks;
  final List<NavigationItemModel> navigation;
  final Map<String, Map<String, String>> translations;
  final List<SkillCategoryModel> skills;
  final List<ProjectModel> projects;

  PortfolioModel({
    required this.personalInfo,
    required this.socialLinks,
    required this.navigation,
    required this.translations,
    required this.skills,
    required this.projects,
  });

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

class PersonalInfoModel {
  final String name;
  final String surname;
  final List<String> emailParts;
  final Map<String, String> greeting;
  final String profileImage;
  final Map<String, String> biography;

  PersonalInfoModel({
    required this.name,
    required this.surname,
    required this.emailParts,
    required this.greeting,
    required this.profileImage,
    required this.biography,
  });

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

class SocialLinksModel {
  final String github;
  final String githubIcon;
  final String flutterIcon;
  final String linkedin;

  SocialLinksModel({
    required this.github,
    required this.githubIcon,
    required this.flutterIcon,
    required this.linkedin,
  });

  factory SocialLinksModel.empty() {
    return SocialLinksModel(github: '', githubIcon: '', flutterIcon: '', linkedin: '');
  }

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

class NavigationItemModel {
  final String id;
  final Map<String, String> label;

  NavigationItemModel({required this.id, required this.label});

  factory NavigationItemModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NavigationItemModel(id: '', label: {});
    return NavigationItemModel(
      id: json['id'] as String? ?? '',
      label: (json['label'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
    );
  }
}

class SkillCategoryModel {
  final String id;
  final Map<String, String> title;
  final List<String> items;

  SkillCategoryModel({required this.id, required this.title, required this.items});

  factory SkillCategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SkillCategoryModel(id: '', title: {}, items: []);
    return SkillCategoryModel(
      id: json['id'] as String? ?? '',
      title: (json['title'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      items: (json['items'] as List?)?.map((e) => e as String).toList() ?? [],
    );
  }
}

class ExternalLinkModel {
  final Map<String, String> title;
  final String url;

  ExternalLinkModel({required this.title, required this.url});

  factory ExternalLinkModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ExternalLinkModel(title: {}, url: '');
    return ExternalLinkModel(
      title: (json['title'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as String)) ?? {},
      url: json['url'] as String? ?? '',
    );
  }
}

class ProjectModel {
  final String id;
  final String type; // 'my' or 'team'
  final Map<String, String> title;
  final Map<String, String> subtitle;
  final Map<String, String> description;
  final List<String> images;
  final List<Map<String, String>> imageCaptions;
  final List<String> technologies;
  final String? githubLink;
  final String? webLink;
  final List<ExternalLinkModel> externalLinks;

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
