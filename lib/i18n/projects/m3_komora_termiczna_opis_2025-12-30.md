
# Komora termiczna z grzaniem indukcyjnym do testów układów elektronicznych (–30 °C … +120 °C)

**Co powstało:**
Kompaktowa komora termiczna przeznaczona do testów układów elektronicznych w szerokim zakresie temperatur: –30 °C … +120 °C. System umożliwia realizację powtarzalnych, liniowych przebiegów temperaturowych z kontrolowaną szybkością zmian temperatury 0.5 °C/min, co czyni go przydatnym narzędziem do badań charakterystyk temperaturowych i testów niezawodności elektroniki.

---

## Motywacja
Motywacją do zaprojektowania komory termicznej była potrzeba prowadzenia badań naukowych nad charakterystykami rezonatorów kwarcowych, których parametry — w szczególności częstotliwość rezonansowa — wykazują silną zależność od temperatury. Rezonatory te są powszechnie stosowane jako źródła częstotliwości w systemach pomiarowych i układach akwizycji danych, gdzie stabilność czasowa ma kluczowe znaczenie. W celu wiarygodnej analizy wpływu temperatury na ich zachowanie konieczne było narzędzie umożliwiające jednorodne i powtarzalne wymuszenie kontrolowanych przebiegów temperaturowych w szerokim zakresie, co bezpośrednio doprowadziło do powstania opisywanej komory.

---

## Architektura systemu i koncepcja cieplna

- **Obiekt badań i medium cieplne:** badany układ elektroniczny umieszczany jest w stalowym sześciennym naczyniu (wyspawanym przeze mnie) i zanurzany w oleju parafinowym. Zastosowanie oleju zapewnia wysoką i jednorodną wymianę ciepła, izolację elektryczną próbki oraz bezpieczny kontakt termiczny w całym zakresie temperatur.

- **Chłodzenie niskotemperaturowe:** uzyskanie temperatur ujemnych zrealizowałem przy użyciu przenośnej **elektrycznej zamrażarki do rur**, wykorzystującej zamknięty obieg czynnika chłodniczego. Do stalowego naczynia dospawane zostały dedykowane uchwyty montażowe umożliwiające bezpośrednie zamocowanie głowic chłodzących zamrażarki. Rozwiązanie to zapewnia efektywne odprowadzanie ciepła przez ścianki naczynia i pozwala osiągnąć temperatury rzędu **–30 °C** wewnątrz oleju, bez ingerencji w konstrukcję samej komory.

- **Źródło ciepła (grzanie wysokotemperaturowe):** nagrzewanie realizowane jest indukcyjnie — stalowe naczynie pełni rolę elementu grzejnego, w którym indukują się prądy wirowe (eddy currents). Energia przekazywana jest bezdotykowo z cewki pochodzącej z pola grzejnego kuchenki indukcyjnej, a następnie równomiernie rozprowadzana do oleju i badanej próbki.

---

## Elektronika mocy i sterowanie

- **Zasilanie / przetwornica rezonansowa:** sterowanie prądem cewki indukcyjnej zrealizowałem w topologii **pół-mostka rezonansowego (LLC)** z tranzystorami **IGBT FGHL40T65MQDT**. Regulacja mocy odbywa się przez zmianę częstotliwości pracy względem punktu rezonansowego: w rezonansie uzyskiwane jest maksimum transferu energii, natomiast praca powyżej rezonansu ogranicza prąd indukowany w naczyniu. Topologia umożliwia pracę w trybie **ZVS (Zero Voltage Switching)**, co minimalizuje straty przełączania i poprawia sprawność układu.

- **Sterowanie tranzystorami:** bramki IGBT sterowane są przez układ **FAN7382N**, przeznaczony do aplikacji pół-mostkowych; sygnały HIN/LIN generowane są z zachowaniem czasu martwego.

- **Kontroler systemu:** generację sygnałów PWM, logikę sterowania oraz obsługę regulatora temperatury zrealizowałem na mikrokontrolerze **STM32F103C6T6A**. Komunikacja z warstwą interfejsu użytkownika odbywa się przez UART.

- **Interfejs użytkownika i automatyzacja:** interfejs sterowania udostępnia prosty serwer WWW (HTML) uruchomiony na **ESP8285**, umożliwiający ręczną regulację parametrów pracy oraz uruchamianie zaprogramowanych przebiegów temperaturowych. Dodatkowo system może być sterowany zewnętrznie przez skrypt Python, co pozwala na pełną automatyzację pomiarów.

- **Pomiary i kontrola temperatury:** temperatura wewnątrz komory monitorowana jest przez czujniki **DS18B20**; regulator PID zaimplementowany w oprogramowaniu sterownika realizuje zadane przebiegi temperaturowe, w szczególności liniowe rampy temperatury.

---

## Bezpieczeństwo

Zastosowano polimerowe bezpieczniki nadprądowe oraz bezpiecznik termiczny **BF121**, który odcina zasilanie w przypadku przekroczenia temperatury 121 °C, zapewniając ochronę zarówno elektroniki mocy, jak i badanego obiektu.

---

## Results / Impact — konkretne rezultaty

- Zakres temperaturowy: **–30 °C … +120 °C**
- Kontrolowana szybkość zmian temperatury: **0.5 °C/min**
- Czas pełnego cyklu –30 °C → 120 °C: **~5 godzin**
- Zużycie energii przy maksymalnym obciążeniu: **50 W**

---

**Szybka odpowiedź na kluczowe pytania**

1. **Co to jest?** — Komora termiczna z indukcyjnym ogrzewaniem i immersją w oleju parafinowym przeznaczona do testów elektorniki/PCB.
2. **Jaki problem rozwiązuje / dlaczego to ważne?** — Umożliwia powtarzalne i jednorodne wymuszenie przebiegów temperaturowych, co jest kluczowe do badań niezawodności i charakterystyk temperaturowych komponentów elektronicznych.
3. **Jakie rozwiązanie wdrożyłeś?** — Stalowy sześcienny zbiornik wypełniony olejem parafinowym + indukcyjny grzejnik napędzany przetwornicą rezonansową (IGBT + FAN7382N + PWM na STM32) + web UI na ESP8285 + automatyzacja w Pythonie + DS18B20 + PID.
4. **Jaka była Twoja rola?** — Projektant i integrator całego systemu (mechanika, hardware, firmware, UI), autor skryptów automatyzacji i wykonawca testów wstępnych.
