
const Map<String, String> projectM3StringsPl = {
  'project.m3.title': 'Komora termiczna z grzaniem indukcyjnym',
  'project.m3.subtitle': 'Komora termiczna z ogrzewaniem indukcyjnym do testowania sprzętu elektronicznego (od -30 °C do +120 °C), wyposażona w rezonansowy półmostkowy stopień mocy LLC, regulację PID i interfejs użytkownika.',
  'project.m3.image.0': '...',
  'project.m3.image.1': '...',
  'project.m3.description': '''
Laboratoryjny system do kontrolowanych testów temperaturowych elektroniki (-30 °C do +120 °C)

Kompaktowa komora termiczna umożliwiająca realizację powtarzalnych przebiegów temperaturowych od -30 °C do +120 °C z kontrolowaną szybkością zmian 0,5 °C/min.

PROBLEM
Wiele badań laboratoryjnych i testów niezawodności wymaga jednorodnego, stabilnego środowiska temperaturowego w szerokim zakresie temperatur. Motywacją projektu było stworzenie platformy testowej umożliwiającej generowanie powtarzalnych przebiegów temperaturowych dla elektroniki i precyzyjnych pomiarów.

ROZWIĄZANIE
Zaprojektowałem i zbudowałem kompletną komorę termiczną łączącą wymianę ciepła przez immersję w oleju z grzaniem indukcyjnym oraz aktywnym chłodzeniem. Badany układ umieszczany jest w stalowym, sześciennym zbiorniku (wykonanym przeze mnie), wypełnionym olejem parafinowym. Olej zapewnia bezpieczną elektrycznie pracę oraz bardzo jednorodną wymianę ciepła w całym zakresie temperatur.

Uzyskanie temperatur ujemnych zrealizowano przy użyciu przenośnej elektrycznej zamrażarki do rur. Do zbiornika dospawano dedykowane uchwyty umożliwiające bezpośrednie mocowanie uchwytów chłodzących, co zapewnia efektywne odprowadzanie ciepła przez ścianki naczynia i stabilną pracę do -30 °C.

Nagrzewanie realizowane jest indukcyjnie - stalowy zbiornik pełni rolę elementu grzejnego, w którym indukowane są prądy wirowe. Energia przekazywana jest z cewki pochodzącej z pola grzejnego kuchenki indukcyjnej i równomiernie rozprowadzana do oleju oraz badanego układu.

Cewka zasilana jest przez rezonansową przetwornicę pół-mostkową LLC z tranzystorami IGBT (FGHL40T65MQDT). Regulacja mocy odbywa się poprzez zmianę częstotliwości pracy względem punktu rezonansowego, z zachowaniem pracy w trybie ZVS. Tranzystory sterowane są przez układ FAN7382N z kontrolowanym czasem martwym.

Sterowanie systemem, generacja PWM oraz regulacja temperatury zostały zaimplementowane na mikrokontrolerze STM32F103. Pomiar temperatury realizują czujniki DS18B20, a regulator PID umożliwia realizację liniowych ramp temperaturowych. Prosty interfejs WWW uruchomiony na ESP8285 pozwala na ręczne sterowanie, a system może być również w pełni automatyzowany z użyciem skryptów Python.

Komora została wykorzystana m.in. do badań temperaturowych rezonatorów kwarcowych i analizy stabilności częstotliwości.

REZULTATY
Projektant systemu obejmował: mechanikę, elektronikę mocy, firmware, algorytmy sterowania, interfejs użytkownika, automatyzację i walidację.
- Zakres temperatur: -30 °C do +120 °C
- Szybkość zmian temperatury: 0,5 °C/min
- Pełny cykl -30 °C do +120 °C: ~5 godzin
- Maksymalne zużycie mocy: ~50 W

**Tech:** Systemy wbudowane, STM32F103, Grzanie indukcyjne, Przetwornica LLC, IGBT, FAN7382N, Regulacja PID, ESP8285, DS18B20, Automatyzacja Python, Altium Designer, PCB

  ''',
};

const Map<String, String> projectM3StringsEn = {
  'project.m3.title': 'Thermal Chamber with Induction Heating',
  'project.m3.subtitle': 'Thermal chamber with induction heating for electronic hardware testing (-30 °C to +120 °C), featuring resonant half-bridge LLC power stage, PID control, and user interface.',
  'project.m3.image.0': '...',
  'project.m3.image.1': '...',
  'project.m3.description': '''
Laboratory system for controlled temperature testing of electronic hardware (-30 °C to +120 °C)

Compact laboratory thermal chamber enabling repeatable temperature profiles from -30 °C to +120 °C with controlled ramp rate of 0.5 °C/min.

PROBLEM
Many laboratory experiments and reliability tests require controlled, homogeneous thermal environments over a wide temperature range. The motivation for this project was to build a flexible thermal test platform capable of generating repeatable temperature profiles suitable for electronic hardware and precision measurements.

SOLUTION
I designed and built a complete thermal chamber system combining immersion-based heat transfer with inductive heating and active cooling.
The device under test is placed inside a welded steel cubic vessel (fabricated by me) filled with paraffin oil. The oil provides electrically safe operation and highly uniform thermal coupling across the entire temperature range.

Low-temperature operation is achieved using a portable electric pipe-freezing unit. Dedicated mounting brackets were welded to the steel vessel, allowing direct attachment of the cooling heads and efficient heat extraction through the vessel walls. This approach enables stable operation down to -30 °C without modifying the cooling unit itself.

High-temperature operation is implemented via induction heating. The steel vessel acts as the heating element, with eddy currents induced by a coil sourced from an induction cooktop field generator. Heat is transferred uniformly from the vessel walls into the oil bath and the tested electronics.

The induction coil is driven by a resonant LLC half-bridge power stage using IGBT transistors (FGHL40T65MQDT). Power is regulated by shifting the operating frequency relative to the resonant point, enabling smooth control of induced current and thermal power. Zero-voltage switching (ZVS) operation minimizes switching losses. The IGBTs are driven by a FAN7382N half-bridge gate driver IC with controlled dead time.

System control, PWM with dead time generation, and temperature regulation are implemented on an STM32F103 microcontroller. Temperature feedback is provided by DS18B20 digital sensors, with a software PID controller executing linear temperature ramps. A lightweight web-based user interface is hosted on an ESP8285 module, enabling manual control of induced power regulation. The system can also be fully automated via external Python scripts over serial communication.

Hardware safety features include polymer overcurrent protection and a BF121 thermal fuse disconnecting power above 121 °C.

The system was successfully used for controlled temperature characterization of quartz resonators, enabling precise analysis of frequency stability and thermal behavior.

RESULTS
Full system designer and integrator - mechanical design, power electronics, firmware, control algorithms, UI, automation, and system validation.
- Temperature range: -30 °C to +120 °C
- Controlled ramp rate: 0.5 °C/min
- Full cycle (-30 °C to +120 °C): ~5 hours
- Maximum power consumption: ~50 W

**Tech:** Embedded Systems, STM32F103, Induction Heating, LLC Resonant Converter, IGBT, FAN7382N, PID Control, ESP8285, DS18B20, Python Automation, Altium Designer, PCB

  ''',
};
