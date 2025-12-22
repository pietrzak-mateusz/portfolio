
const Map<String, String> projectM1StringsPl = {
  'project.m1.title': 'Wielowiązkowy Radar Ultradźwiękowy',
  'project.m1.subtitle': 'Ultradźwiękowy system lokalizacji obiektów wykorzystujący technikę monoimpulsową.',
  'project.m1.description': '''
  ## HOOK
  Radar wykrywa obiekty w zakresie 0,5–15 m z rozdzielczością kątową 1–8° i dokładnością odległości ~1 cm.

  ## PROBLEM
  Autonomiczne pojazdy i systemy bezpieczeństwa wymagają tanich, dokładnych czujników do wykrywania przeszkód. Tradycyjne sonary ultradźwiękowe nie określają kierunku obiektu, a radary elektromagnetyczne są drogie. Potrzebne było rozwiązanie łączące niski koszt z możliwością lokalizacji (odległość + kierunek).

  ## SOLUTION
  Zaprojektowałem radar wykorzystujący trzy przetworniki piezoelektryczne (40 kHz) w konfiguracji monoimpulsowej. Zbudowałem kompletny tor analogowy: nadajnik z mostkiem H (40V), demodulatory IQ z mieszaczami AD633, filtry Sallen-Key oraz system cyfrowy na STM32F411. Synchronizacja przez sprzężone liczniki zapewniła stabilność fazy. Opracowałem algorytm wyznaczania pozycji na podstawie sygnału Δ/Σ z funkcją pelengacyjną. Projekt umożliwia jednoczesne oszacowanie odległości i kierunku przy użyciu niedrogiego sprzętu ultradźwiękowego.

  ## RESULTS
  Osiągnięto zasięg 15 m dla obiektów sferycznych (balon o śr. 80 cm), rozdzielczość azymutalną 1° (obiekty bliskie) i 8° (dalekie), próbkowanie 200 kHz. Opracowano prototyp systemu gotowy do integracji z pojazdami autonomicznymi.

  **Moja rola:** Autor projektu — projektowanie hardware (PCB, tor analogowy), implementacja firmware (STM32, synchronizacja, demodulacja IQ), testy terenowe, analiza charakterystyk  
  **Tech:** Systemy wbudowane, STM32F411RE, Układy analogowo-cyfrowe, Demodulacja IQ, Technika monoimpulsowa, C/C++, MATLAB, Altium Designer, PCB, UART, DMA.
  **Linki:** [GitHub] [Dokumentacja] [Raport PDF]
  ''',
};

const Map<String, String> projectM1StringsEn = {
  'project.m1.title': 'Ultrasonic Monopulse Radar',
  'project.m1.subtitle': 'Ultrasonic object localization system using monopulse technique.',
  'project.m1.description': '''
  ## HOOK
  Radar detects objects at 0.5-15 m range with 1-8° angular resolution and 1 cm distance accuracy.

  ## PROBLEM
  Autonomous vehicles and safety systems require affordable, accurate sensors for obstacle detection. Traditional ultrasonic sonars lack directional information, while electromagnetic radars are costly. A solution combining low cost with accurate localization (distance + direction) was needed.

  ## SOLUTION
  I designed a radar using three piezoelectric transducers (40 kHz) in monopulse configuration. Built complete analog chain: H-bridge transmitter (40V), IQ demodulators with AD633 mixers, Sallen-Key filters, and STM32F411 digital system. Synchronization via coupled timers achieved phase stability. Developed position algorithm based on Δ/Σ signal with bearing function. This project enabled simultaneous distance and direction estimation using low-cost ultrasonic hardware.

  ## RESULTS
  Achieved 15 m range for spherical objects (80 cm dia. balloon), 1° azimuth resolution (near objects) and 8° (far), 200 kHz sampling. A system prototype ready for integration into autonomous vehicles has been developed.

  **My role:** Project author — hardware design (PCB, analog chain), firmware implementation (STM32, synchronization, IQ demodulation), field testing, characteristic analysis  
  **Tech:** Embedded Systems, STM32F411RE, Analog-digital systems, IQ Demodulation, Monopulse Technique, C/C++, MATLAB, Altium Designer, PCB, UART, DMA.
  **Links:** [GitHub] [Documentation] [PDF Report]
''',
};
