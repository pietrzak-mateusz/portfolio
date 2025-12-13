import 'locale_controller.dart';

const Map<String, Map<String, String>> strings = {
  'en': {
    'greeting': "Hi,\nI'm Lucynka\nA Flutter Developer",
    'about_short': "Pekingese — a companion dog breed...",
    'projects': "Projects",
    'contact': "Mail me",
    'copy_email': "Copy e-mail",
    // dodaj wszystkie klucze, których używasz w UI...
  },
  'pl': {
    'greeting': "Cześć,\nJestem Lucynka\nFlutter Developer",
    'about_short': "Pekińczyk — pies do towarzystwa...",
    'projects': "Projekty",
    'contact': "Napisz",
    'copy_email': "Kopiuj e-mail",
    // ...
  },
};

String t(String key) {
  final lang = localeNotifier.value;
  return strings[lang]?[key] ?? key;
}
