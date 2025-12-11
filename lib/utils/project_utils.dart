class ProjectUtils {
  final String id;              // unikalny identyfikator projektu
  final List<String> images;           // ścieżka do obrazów
  final List<String> technologies; // np. ["Flutter", "Dart", "Firebase"]
  final String title;           // nazwa projektu
  final String subtitle;        // krótki opis
  final String? description;    // dłuższy opis (opcjonalny)
  final String? androidLink;    // link do Google Play
  final String? iosLink;        // link do App Store
  final String? webLink;        // link do wersji web

  const ProjectUtils({
    required this.id,
    required this.images,
    required this.technologies,
    required this.title,
    required this.subtitle,
    this.description,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// #########################################################
// TEAM PROJECTS
// #########################################################

final List<ProjectUtils> teamProjectUtils = [
  const ProjectUtils(
    id: 't1',
    images: [
      'assets/projects/pekinczyk_social_01.jpg',
      'assets/projects/pekinczyk_social_02.jpg',
    ],
    technologies: ["Flutter", "Riverpod", "Firebase"],
    title: 'Pekingese Social Club',
    subtitle: 'Aplikacja społecznościowa dla właścicieli pekińczyków.',
    description:
        'Zespołowy projekt aplikacji umożliwiającej właścicielom pekińczyków dzielenie się zdjęciami, '
        'tworzenie grup spacerowych, organizowanie wydarzeń i kontaktowanie się z pobliskimi hodowcami. '
        'W projekcie wykorzystano Firebase Authentication oraz Firestore do zarządzania społecznością.',
  ),

  const ProjectUtils(
    id: 't2',
    images: [
      'assets/projects/pekinczyk_health_01.jpg',
      'assets/projects/pekinczyk_health_02.jpg',
    ],
    technologies: ["Flutter", "Dart", "REST API"],
    title: 'Pekingese Health Companion',
    subtitle: 'Platforma do monitorowania zdrowia pekińczyka.',
    description:
        'Projekt tworzony w zespole weterynarzy i programistów. Aplikacja oferuje system przypomnień o szczepieniach, '
        'wizytach kontrolnych oraz podawaniu leków. Dodatkowo integruje się z zewnętrznym API, '
        'aby pobierać informacje o typowych chorobach dla rasy pekińczyk i sugerować działania profilaktyczne.',
  ),
];

// #########################################################
// MY PROJECTS
// #########################################################

final List<ProjectUtils> myProjectUtils = [
  const ProjectUtils(
    id: 'm1',
    images: [
      'assets/projects/pekinczyk_01.jpg',
      'assets/projects/pekinczyk_02.jpg',
    ],
    technologies: ["Flutter", "Dart", "Provider"],
    title: 'Pekingese Tracker',
    subtitle: 'Aplikacja do monitorowania aktywności pekińczyka.',
    description:
        'Aplikacja umożliwia właścicielom pekińczyków śledzenie dziennej aktywności, '
        'przebytych spacerów, godzin karmienia oraz zachowań zdrowotnych. '
        'W projekcie zaimplementowano prosty system statystyk oraz możliwość eksportu danych. '
        'Zaprojektowana z myślą o małych rasach psów, które wymagają regularnej kontroli aktywności fizycznej.',
  ),

  const ProjectUtils(
    id: 'm2',
    images: [
      'assets/projects/pekinczyk_food_01.jpg',
      'assets/projects/pekinczyk_food_02.jpg',
    ],
    technologies: ["Flutter", "Dart", "SQLite"],
    title: 'Pekingese Diet Planner',
    subtitle: 'Indywidualny planer diety pekińczyka.',
    description:
        'Projekt skupia się na tworzeniu optymalnych planów żywieniowych dla pekińczyków, '
        'z uwzględnieniem wieku, wagi, alergii oraz poziomu aktywności. '
        'Aplikacja pozwala rejestrować posiłki i monitorować reakcje psa na poszczególne składniki.',
  ),

  const ProjectUtils(
    id: 'm3',
    images: [
      'assets/projects/pekinczyk_training_01.jpg',
      'assets/projects/pekinczyk_training_02.jpg',
    ],
    technologies: ["Flutter", "Dart", "Firebase"],
    title: 'Pekingese Training Hub',
    subtitle: 'Zestaw ćwiczeń i tricków specjalnie dla pekińczyków.',
    description:
        'Aplikacja oferuje bibliotekę treningów, filmów instruktażowych oraz wyzwań tygodniowych '
        'dostosowanych do pekińczyków — rasy inteligentnej, ale o bardzo specyficznym temperamencie. '
        'Projekt zawiera również prosty system ocen postępów w szkoleniu.',
  ),
];
