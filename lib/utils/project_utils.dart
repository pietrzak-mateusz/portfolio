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
// HOBBY PROJECTS
// #########################################################

final List<ProjectUtils> hobbyProjectUtils = [
  const ProjectUtils(
    id: 'h1',
    images: [
      'assets/projects/1.png',
      'assets/projects/02.png',
      'assets/projects/03.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'English Learning App',
    subtitle:
        'A comprehensive English learning app for practicing and competing with each other.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.eduza',
  ),
  const ProjectUtils(
    id: 'h2',
    images: [
      'assets/projects/02.png',
      'assets/projects/03.png',
      'assets/projects/1.png',
      ], // upewnij się, że plik istnieje
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'English Dictionary App',
    subtitle:
        'A dictionary application for English learners to easily look up word definitions.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.eduza_eng_dictionary',
    iosLink:
        "https://apps.apple.com/us/app/eduza-english-dictionary/id6443770339",
  ),
  const ProjectUtils(
    id: 'h3',
    images: [
      'assets/projects/03.png',
      'assets/projects/02.png',
      'assets/projects/1.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'Pocket Dictionary',
    subtitle:
        'A word memorising app to save and play your own words as quizzes.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohruhak.eng_pocket_dictionary',
    iosLink:
        'https://apps.apple.com/tr/app/pocket-dictionary-1/id6447465115',
  ),
  const ProjectUtils(
    id: 'h4',
    images: [
      'assets/projects/04.png',
      'assets/projects/02.png',
      'assets/projects/1.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'Tasbeeh Counter',
    subtitle: 'A simple dzikr counter app with persistent storage.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.tasbeeh',
  ),
  const ProjectUtils(
    id: 'h5',
    images: [
      'assets/projects/05.png',
      'assets/projects/02.png',
      'assets/projects/1.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'Todo App',
    subtitle: 'A simple task management app with persistent storage.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.todo',
    iosLink: "https://apps.apple.com/us/app/eduza-todo/id6443970333",
  ),
  const ProjectUtils(
    id: 'h6',
    images: [
      'assets/projects/06.png',
      'assets/projects/02.png',
      'assets/projects/1.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'NotePad App',
    subtitle: 'A note-taking app for macOS and Android.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.notepad',
    iosLink: 'https://apps.apple.com/us/app/eduza-notepad/id6443973859',
  ),
];

// #########################################################
// WORK PROJECTS
// #########################################################

final List<ProjectUtils> workProjectUtils = [
  const ProjectUtils(
    id: 'w1',
    images: [
      'assets/projects/w01.png',
      'assets/projects/02.png',
      'assets/projects/1.png',
      ],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'English Brain Craft',
    subtitle:
        'English learning app for students using various learning methods.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    androidLink:
        'https://play.google.com/store/apps/details?id=kr.co.evolcano.donotstudy',
    iosLink:
        "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  ),
  const ProjectUtils(
    id: 'w2',
    images: [
      'assets/projects/w02.png',
      'assets/projects/02.png',
      'assets/projects/1.png',],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'Online Shop Web App',
    subtitle: 'Responsive online shop web app for car engine oil.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    webLink: 'https://www.elo.best',
  ),
  const ProjectUtils(
    id: 'w3',
    images: ['assets/projects/w03.jpeg'],
    technologies: ["Pole 1", "Pole 1", "Pole 1"],
    title: 'Advertisement Management System',
    subtitle:
        'System to buy, sell, and manage advertisement. Internal project.',
    description: 'To jest test. Chcę zobaczyć czy opis projektów działa.',
    webLink: null, // brak działającego linku
  ),
];
