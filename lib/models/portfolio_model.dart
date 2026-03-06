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

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      personalInfo: PersonalInfoModel.fromJson(json['personalInfo']),
      socialLinks: SocialLinksModel.fromJson(json['socialLinks']),
      navigation: (json['navigation'] as List)
          .map((item) => NavigationItemModel.fromJson(item))
          .toList(),
      translations: (json['translations'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Map<String, String>.from(value)),
      ),
      skills: (json['skills'] as List)
          .map((item) => SkillCategoryModel.fromJson(item))
          .toList(),
      projects: (json['projects'] as List)
          .map((item) => ProjectModel.fromJson(item))
          .toList(),
    );
  }
}

class PersonalInfoModel {
  final String name;
  final String surname;
  final List<String> emailParts;
  final Map<String, String> greeting;
  final Map<String, String> biography;

  PersonalInfoModel({
    required this.name,
    required this.surname,
    required this.emailParts,
    required this.greeting,
    required this.biography,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      name: json['name'],
      surname: json['surname'],
      emailParts: List<String>.from(json['emailParts']),
      greeting: Map<String, String>.from(json['greeting']),
      biography: Map<String, String>.from(json['biography']),
    );
  }
}

class SocialLinksModel {
  final String github;
  final String linkedin;

  SocialLinksModel({required this.github, required this.linkedin});

  factory SocialLinksModel.fromJson(Map<String, dynamic> json) {
    return SocialLinksModel(
      github: json['github'],
      linkedin: json['linkedin'],
    );
  }
}

class NavigationItemModel {
  final String id;
  final Map<String, String> label;

  NavigationItemModel({required this.id, required this.label});

  factory NavigationItemModel.fromJson(Map<String, dynamic> json) {
    return NavigationItemModel(
      id: json['id'],
      label: Map<String, String>.from(json['label']),
    );
  }
}

class SkillCategoryModel {
  final String id;
  final Map<String, String> title;
  final List<String> items;

  SkillCategoryModel({required this.id, required this.title, required this.items});

  factory SkillCategoryModel.fromJson(Map<String, dynamic> json) {
    return SkillCategoryModel(
      id: json['id'],
      title: Map<String, String>.from(json['title']),
      items: List<String>.from(json['items']),
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
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      type: json['type'],
      title: Map<String, String>.from(json['title']),
      subtitle: Map<String, String>.from(json['subtitle']),
      description: Map<String, String>.from(json['description']),
      images: List<String>.from(json['images']),
      imageCaptions: (json['imageCaptions'] as List)
          .map((item) => Map<String, String>.from(item))
          .toList(),
      technologies: List<String>.from(json['technologies']),
      githubLink: json['githubLink'],
      webLink: json['webLink'],
    );
  }
}
