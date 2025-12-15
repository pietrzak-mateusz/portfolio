import 'locale_controller.dart';
import '../constants/personal_info.dart';

const Map<String, Map<String, String>> strings = {
  'en': {
    'greeting': "Hi,\nI'm Lucynka\nA Flutter Developer",
    'about_short': "Pekingese — a companion dog breed...",
    'skills_section': "Technical Skills",
    'projects_my': "My projects",
    'projects_team': "Team Projects",
    'built_with': "Built with: ",
    'details_button' :"View details",
    'contact': "✉ Mail me",
    'return': "   Top",
    'copy_email': "Copy e-mail",
    'github_source': "View source on GitHub",
    'made_by_p1': "Made by: ${PersonalInfo.name} — built with ",
    'made_by_p2': " Flutter 3.38.4\n© 2025 • This project is open-source (MIT)",

    // Kategorie
    'skills.software': 'Software Development',
    'skills.embedded': 'Microcontrollers & Embedded Systems',
    'skills.tools': 'Development Tools & IDEs',
    'skills.protocols': 'Communication Protocols & Interfaces',
    'skills.sbc': 'Single-Board Computers',
    'skills.pcb': 'PCB Design & Circuit Simulation',
    'skills.proto': 'Prototyping & Assembly',
    'skills.test': 'Test & Measurement Equipment',
    'skills.docs': 'Documentation & Graphics',

    // Umiejętności software
    'skill.c': 'C',
    'skill.cpp': 'C++',
    'skill.python': 'Python',
    'skill.matlab': 'MATLAB',
    'skill.labview': 'LabVIEW',
    'skill.bash': 'bash',
    'skill.vhdl': 'VHDL',

    // Umiejętności embedded
    'skill.stm32_hal_cubemx': 'STM32 (HAL/CubeMX)',
    'skill.avr': 'AVR',
    'skill.esp32': 'ESP32',
    'skill.freertos_basics': 'FreeRTOS basics',

    // Umiejętności tools
    'skill.stm32cubeide': 'STM32CubeIDE',
    'skill.keil_uvision': 'Keil µVision',
    'skill.visual_studio_code': 'Visual Studio Code',
    'skill.git': 'Git',

    // Umiejętności protocols
    'skill.can': 'CAN',
    'skill.spi': 'SPI',
    'skill.i2c': 'I2C',
    'skill.uart': 'UART',
    'skill.ethernet': 'Ethernet',
    'skill.ble': 'BLE',
    'skill.wifi': 'WiFi',
    'skill.nfc': 'NFC',
    'skill.gnss': 'GNSS',
    'skill.gprs_lte': 'GPRS/LTE',

    // Umiejętności sbc
    'skill.raspberry_pi': 'Raspberry Pi',

    // Umiejętności pcb
    'skill.altium_designer': 'Altium Designer',
    'skill.circuitstudio': 'CircuitStudio',
    'skill.pads': 'PADS',
    'skill.ltspice': 'LTspice',

    // Umiejętności proto
    'skill.pcb_assembly': 'PCB assembly',
    'skill.smd_tht_soldering': 'SMD/THT soldering',
    'skill.3d_printing': '3D printing',

    // Umiejętności test
    'skill.oscilloscope': 'Oscilloscope',
    'skill.multimeter': 'Multimeter',
    'skill.power_supplies': 'Power supplies',
    'skill.logic_analyzers': 'Logic analyzers',
    'skill.frequency_counters': 'Frequency counters',
    'skill.debuggers_st_link_swd': 'Debuggers: ST-Link/SWD',

    // Umiejętności docs
    'skill.latex': 'LaTeX',
    'skill.inkscape': 'Inkscape',
    'skill.gimp': 'GIMP',
    'skill.microsoft_office': 'Microsoft Office',

    // #########################################################
    // MY PROJECTS
    // #########################################################

    // Project m1
    'project.m1.title': 'Pekingese Tracker',
    'project.m1.subtitle': 'App for monitoring Pekingese activity.',
    'project.m1.description': 'The app allows Pekingese owners to track daily activity, walked distances, feeding times, and health behaviors. The project implements a simple statistics system and data export functionality. Designed with small dog breeds in mind, which require regular monitoring of physical activity.',

    // Project m2
    'project.m2.title': 'Pekingese Diet Planner',
    'project.m2.subtitle': 'Individual diet planner for Pekingese.',
    'project.m2.description': 'The project focuses on creating optimal nutrition plans for Pekingese, considering age, weight, allergies, and activity level. The app allows recording meals and monitoring the dog\'s reactions to specific ingredients.',

    // Project m3
    'project.m3.title': 'Pekingese Training Hub',
    'project.m3.subtitle': 'Set of exercises and tricks specifically for Pekingese.',
    'project.m3.description': 'The app offers a library of trainings, instructional videos, and weekly challenges tailored to Pekingese - an intelligent breed with a very specific temperament. The project also includes a simple system for assessing training progress.',

    // #########################################################
    // TEAM PROJECTS
    // #########################################################

    // Project t1
    'project.t1.title': 'Pekingese Social Club',
    'project.t1.subtitle': 'Social app for Pekingese owners.',
    'project.t1.description': 'Team project of an application that allows Pekingese owners to share photos, create walking groups, organize events, and contact nearby breeders. The project uses Firebase Authentication and Firestore for community management.',

    // Project t2
    'project.t2.title': 'Pekingese Health Companion',
    'project.t2.subtitle': 'Platform for monitoring Pekingese health.',
    'project.t2.description': 'Project created by a team of veterinarians and developers. The app offers a system for reminders about vaccinations, check-up visits, and medication administration. Additionally, it integrates with an external API to fetch information about common diseases for the Pekingese breed and suggest preventive actions.',

  },
  'pl': {
    'greeting': "Cześć,\nJestem Lucynka\nFlutter Developer",
    'about_short': "Pekińczyk — pies do towarzystwa...",
    'skills_section': "Umiejętności",
    'projects_my': "Moje projekty",
    'details_button' :"Zobacz szczegóły",
    'projects_team': "Projekty zespołowe",
    'built_with': "Wykorzystane technologie: ",
    'contact': "✉ Napisz do mnie",
    'return': "Powrót",
    'copy_email': "Kopiuj e-mail",
    'github_source': "Zobacz kod na GitHubie",
    'made_by_p1': "Stworzone przez: ${PersonalInfo.name} — zbudowane z ",
    'made_by_p2': " Flutter 3.38.4\n© 2025 • Projekt open-source (MIT)",

    'skills.software': 'Programowanie',
    'skills.embedded': 'Mikrokontrolery i systemy wbudowane',
    'skills.tools': 'Narzędzia programistyczne i IDE',
    'skills.protocols': 'Protokoły komunikacyjne i interfejsy',
    'skills.sbc': 'Komputery jednopłytkowe',
    'skills.pcb': 'Projektowanie PCB i symulacja obwodów',
    'skills.proto': 'Prototypowanie i montaż',
    'skills.test': 'Sprzęt pomiarowy i diagnostyczny',
    'skills.docs': 'Dokumentacja i grafika',

    // Umiejętności software
    'skill.c': 'C',
    'skill.cpp': 'C++',
    'skill.python': 'Python',
    'skill.matlab': 'MATLAB',
    'skill.labview': 'LabVIEW',
    'skill.bash': 'bash',
    'skill.vhdl': 'VHDL',

    // Umiejętności embedded
    'skill.stm32_hal_cubemx': 'STM32 (HAL/CubeMX)',
    'skill.avr': 'AVR',
    'skill.esp32': 'ESP32',
    'skill.freertos_basics': 'Podstawy FreeRTOS',

    // Umiejętności tools
    'skill.stm32cubeide': 'STM32CubeIDE',
    'skill.keil_uvision': 'Keil µVision',
    'skill.visual_studio_code': 'Visual Studio Code',
    'skill.git': 'Git',

    // Umiejętności protocols
    'skill.can': 'CAN',
    'skill.spi': 'SPI',
    'skill.i2c': 'I2C',
    'skill.uart': 'UART',
    'skill.ethernet': 'Ethernet',
    'skill.ble': 'BLE',
    'skill.wifi': 'WiFi',
    'skill.nfc': 'NFC',
    'skill.gnss': 'GNSS',
    'skill.gprs_lte': 'GPRS/LTE',

    // Umiejętności sbc
    'skill.raspberry_pi': 'Raspberry Pi',

    // Umiejętności pcb
    'skill.altium_designer': 'Altium Designer',
    'skill.circuitstudio': 'CircuitStudio',
    'skill.pads': 'PADS',
    'skill.ltspice': 'LTspice',

    // Umiejętności proto
    'skill.pcb_assembly': 'Montaż PCB',
    'skill.smd_tht_soldering': 'Lutowanie SMD/THT',
    'skill.3d_printing': 'Drukowanie 3D',

    // Umiejętności test
    'skill.oscilloscope': 'Oscyloskop',
    'skill.multimeter': 'Multimetr',
    'skill.power_supplies': 'Zasilacze',
    'skill.logic_analyzers': 'Analizatory logiczne',
    'skill.frequency_counters': 'Liczniki częstotliwości',
    'skill.debuggers_st_link_swd': 'Debugery: ST-Link/SWD',

    // Umiejętności docs
    'skill.latex': 'LaTeX',
    'skill.inkscape': 'Inkscape',
    'skill.gimp': 'GIMP',
    'skill.microsoft_office': 'Microsoft Office',

    // #########################################################
    // MY PROJECTS - MOJE PROJEKTY
    // #########################################################

    // Projekt m1
    'project.m1.title': 'Pekińczyk Tracker',
    'project.m1.subtitle': 'Aplikacja do monitorowania aktywności pekińczyka.',
    'project.m1.description': 'Aplikacja umożliwia właścicielom pekińczyków śledzenie dziennej aktywności, przebytych spacerów, godzin karmienia oraz zachowań zdrowotnych. W projekcie zaimplementowano prosty system statystyk oraz możliwość eksportu danych. Zaprojektowana z myślą o małych rasach psów, które wymagają regularnej kontroli aktywności fizycznej.',

    // Projekt m2
    'project.m2.title': 'Pekińczyk Diet Planner',
    'project.m2.subtitle': 'Indywidualny planer diety pekińczyka.',
    'project.m2.description': 'Projekt skupia się na tworzeniu optymalnych planów żywieniowych dla pekińczyków, z uwzględnieniem wieku, wagi, alergii oraz poziomu aktywności. Aplikacja pozwala rejestrować posiłki i monitorować reakcje psa na poszczególne składniki.',

    // Projekt m3
    'project.m3.title': 'Pekińczyk Training Hub',
    'project.m3.subtitle': 'Zestaw ćwiczeń i tricków specjalnie dla pekińczyków.',
    'project.m3.description': 'Aplikacja oferuje bibliotekę treningów, filmów instruktażowych oraz wyzwań tygodniowych dostosowanych do pekińczyków — rasy inteligentnej, ale o bardzo specyficznym temperamencie. Projekt zawiera również prosty system ocen postępów w szkoleniu.',

    // #########################################################
    // TEAM PROJECTS - PROJEKTY ZESPOŁOWE
    // #########################################################

    // Projekt t1
    'project.t1.title': 'Pekińczyk Social Club',
    'project.t1.subtitle': 'Aplikacja społecznościowa dla właścicieli pekińczyków.',
    'project.t1.description': 'Zespołowy projekt aplikacji umożliwiającej właścicielom pekińczyków dzielenie się zdjęciami, tworzenie grup spacerowych, organizowanie wydarzeń i kontaktowanie się z pobliskimi hodowcami. W projekcie wykorzystano Firebase Authentication oraz Firestore do zarządzania społecznością.',

    // Projekt t2
    'project.t2.title': 'Pekińczyk Health Companion',
    'project.t2.subtitle': 'Platforma do monitorowania zdrowia pekińczyka.',
    'project.t2.description': 'Projekt tworzony w zespole weterynarzy i programistów. Aplikacja oferuje system przypomnień o szczepieniach, wizytach kontrolnych oraz podawaniu leków. Dodatkowo integruje się z zewnętrznym API, aby pobierać informacje o typowych chorobach dla rasy pekińczyk i sugerować działania profilaktyczne.',

  },
};

String t(String key) {
  final lang = localeNotifier.value;
  return strings[lang]?[key] ?? '⛔ $key';
}
