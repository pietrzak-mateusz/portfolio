
const Map<String, String> projectM2StringsPl = {
  'project.m2.title': 'Anemometr Ultradźwiękowy',
  'project.m2.subtitle': 'Dwuosiowy ultradźwiękowy czujnik prędkości i kierunku wiatru z pomiarem przesunięcia fazowego oraz rejestracją danych.',
  'project.m2.image.0': 'Kalibracja w tunelu aerodynamicznym - porównanie z anemometrem mechanicznym stacji pogodowej',
  'project.m2.image.1': 'Dwuosiowa konfiguracja przetworników ultradźwiękowych (40 kHz) do pomiaru kierunku i prędkości wiatru',
  'project.m2.image.2': 'Testy terenowe - pomiar prędkości wiatru pozornego z samochodu (weryfikacja zakresu większych prędkości wiatru)',
  'project.m2.description': '''
Dwuosiowy anemometr ultradźwiękowy wykorzystujący pomiar przesunięcia fazowego.

Urządzenie mierzy prędkość wiatru w\u00A0zakresie 0-20\u00A0m/s z\u00A0rozdzielczością 0,1\u00A0m/s oraz dokładnością kierunku\u00A0±1°.

PROBLEM
Mechaniczne anemometry charakteryzują się dużą bezwładnością, niską czułością na nagłe podmuchy oraz podatnością na zużycie mechaniczne. Wymaga to długiego czasu uśredniania i\u00A0prowadzi do błędów pomiarowych. Komercyjne ultradźwiękowe czujniki wiatru są kosztowne, co ogranicza ich dostępność. Potrzebne było tanie i\u00A0wydajne rozwiązanie.

ROZWIĄZANIE
Zaprojektowałem dwuosiowy anemometr ultradźwiękowy oparty na pomiarze przesunięcia fazowego sygnałów 40\u00A0kHz pomiędzy nadajnikiem a\u00A0odbiornikiem piezoelektrycznym. Zaimplementowałem enkoder kwadraturowy w\u00A0celu rozszerzenia zakresu pomiarowego oraz system zdarzeń sterowany przez DMA w\u00A0mikrokontrolerze ATxmega do próbkowania w\u00A0czasie rzeczywistym. 
Część analogowa obejmuje wzmacniacz transimpedancyjny, filtry pasmowe oraz detektor przejścia przez zero. Pomiar przesunięcia fazowego realizowany jest przez porównanie różnicy faz sygnału nadajnika i odbiornika, mierzony przy pomocy licznika mikrokontrolera w trybie Input Capture. Oprogramowanie realizuje korekcję pomiarów i\u00A0zapis danych; wyniki są ciągle zapisywane na kartę SD (FatFs - Generic FAT Filesystem Module).
System zapewnia szybką reakcję na podmuchy oraz dokładny pomiar kierunku przy użyciu tanich przetworników piezoelektrycznych.

REZULTATY
Osiągnięto zakres pomiarowy 0-20\u00A0m/s z\u00A0błędem <8%\u00A0względem referencyjnej stacji pogodowej, rozdzielczość kierunku 1°\u00A0oraz możliwość ciągłego zapisu danych na kartę SD.
Czas reakcji i\u00A0czułość na podmuchy znacząco przewyższają typowe anemometry mechaniczne.

Moja rola: pełna realizacja projektu w\u00A0zakresie hardware i\u00A0software.

Link:
https://apd.usos.pw.edu.pl/diplomas/22611/?_s=1

  ''',
};

const Map<String, String> projectM2StringsEn = {
  'project.m2.title': 'Ultrasonic Anemometer',
  'project.m2.subtitle': 'Two-axis ultrasonic wind speed and direction sensor with phase-shift measurement and data logging.',
  'project.m2.image.0': 'Calibration in wind tunnel setup - comparison with reference mechanical anemometer',
  'project.m2.image.1': 'Dual-axis configuration of ultrasonic transducers (40 kHz) for wind direction and velocity measurement',
  'project.m2.image.2': 'Field tests - measurement of apparent wind speed from a moving car (verification of higher wind speed range)',
  'project.m2.description': '''
Two-axis ultrasonic anemometer using phase-shift measurement.

Device measures wind speed up to 0-20\u00A0m/s with 0.1\u00A0m/s resolution and ±1°\u00A0direction accuracy.

PROBLEM
Mechanical anemometers suffer from high inertia, insensitivity to sudden gusts, and mechanical wear.
This requires long averaging times and introduces measurement errors. Commercial ultrasonic wind sensors are expensive, limiting their accessibility. A low-cost, high-performance solution was needed.

SOLUTION
I designed a two-axis ultrasonic anemometer based on phase-shift measurement of 40\u00A0kHz signals between piezoelectric transmitter and receiver. Implemented a\u00A0quadrature encoder to extend measurement range and used a DMA-driven event system on an ATxmega microcontroller for real-time sampling.
The electronics include a\u00A0transimpedance amplifier, bandpass filters and a\u00A0zero-crossing detector. Phase-shift measurement is performed by comparing the phase difference between transmitter and receiver signals using the microcontroller's timer in Input Capture mode. The software performs measurement correction and data logging. Results are continuously written to an SD card (FatFs - Generic FAT Filesystem Module).
The system provides fast response to gusts and accurate directional measurement using low-cost piezoelectric transducers.

RESULTS
Achieved 0-20\u00A0m/s measurement range with <8% error compared to a\u00A0reference weather station, 1°\u00A0direction resolution, and continuous SD logging capability.
Response time and gust sensitivity significantly outperform typical mechanical anemometers.

My role: complete hardware and software implementation.

Link:
https://apd.usos.pw.edu.pl/diplomas/22611/?_s=1
  ''',
};
