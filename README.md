# Analiza-sprzeda-y
To repozytorium zawiera kompletny projekt analizy sprzedaży wykonany przy użyciu SQL, Power BI i Excel. Celem projektu jest pokazanie procesu od ETL i zapytań analitycznych, przez modelowanie danych, aż do wizualizacji i raportowania.


# 📊 Projekt: Analiza sprzedaży — SQL, Power BI i Excel

## 🎯 Cel projektu
Celem projektu była kompleksowa analiza danych sprzedażowych w celu lepszego zrozumienia zachowań klientów, wyników produktów oraz trendów przychodów. Projekt został zrealizowany w trzech etapach:
1. **SQL** — przygotowanie zapytań i metryk (KPI, analizy klientów, produktów, czasowe).
2. **Power BI** — budowa interaktywnego dashboardu prezentującego wyniki.
3. **Excel** — stworzenie dodatkowego raportu opartego na tabelach przestawnych i Power Query.

---

## 🗂️ Dane
Źródło: https://www.kaggle.com/datasets/ruchi798/shopping-cart-database?select=sales.csv  
Struktura danych:
- **Customers** — informacje o klientach (ID, imię, nazwisko, lokalizacja),
- **Orders** — dane o zamówieniach (ID, data zamówienia, data dostawy, forma płatności),
- **Products** — lista produktów (ID, kategoria, nazwa, cena, opis),
- **Sales** — szczegóły sprzedaży (ID, cena jednostkowa, ilość, wartość sprzedaży).

---

## ⚙️ Proces analizy

### 1. SQL
- Przygotowanie KPI: przychód całkowity, liczba zamówień, średnia wartość zamówienia (AOV), liczba klientów, średnia cena jednostkowa.
- Analiza klientów:
  - nowi vs powracający klienci (miesięcznie),
  - top 10 klientów wg wartości zakupów,
  - analiza RFM (recency, frequency, monetary).
- Analiza produktów:
  - top 10 produktów wg przychodów i liczby sprzedanych sztuk,
  - przychód wg kategorii produktowych,
  - średnia cena za kategorię.
- Analiza czasowa:
  - miesięczne przychody,
  - średni czas dostawy.
- Geografia:
  - przychód wg stanów.

### 2. Power BI
- Stworzenie modelu danych z 4 tabel,
- Implementacja miar w DAX,
- Budowa dashboardu z KPI i interaktywnymi wizualizacjami:
  - karty KPI (Total Revenue, Orders, AOV, Units Sold, Avg Price/Unit),
  - trend przychodów miesięcznych,
  - mapa przychodów wg regionu,
  - top 10 klientów i produktów,
  - przychody wg kategorii,
  - nowi vs powracający klienci.

### 3. Excel
- Wczytanie danych do Power Query i zbudowanie jednej tabeli `SalesAll`,
- Przygotowanie tabel przestawnych i raportów:
  - KPI,
  - przychody wg miesięcy,
  - top produkty i klienci,
  - mapa przychodów wg regionu,
- Mini-dashboard w Excelu z KPI i wykresami.

---

## 📌 Najważniejsze wnioski (na podstawie dashboardu)

1. **Kluczowi klienci**  
   - Powracający klienci odpowiadają za większość sprzedaży, ale liczba nowych klientów stopniowo rośnie miesiąc do miesiąca.

2. **Produkty**  
   - Najwięcej sztuk sprzedaje się w kategorii "Jackets".  
   - Produkty premium (o wyższej cenie jednostkowej) odpowiadają za większy udział w przychodach niż produkty tanie.  
   - Top 5 produktów odpowiada za znaczną część sprzedaży — warto rozważyć ich promocję i utrzymywanie zapasów.

3. **Sprzedaż w czasie**  
   - Widoczny jest trend wzrostu sprzedaży w kolejnych miesiącach (szczególnie w Q4), co może sugerować wpływ sezonowości (np. okresy świąteczne).  
   - Średnia wartość zamówienia (AOV) utrzymuje się na stabilnym poziomie, ale wzrasta w miesiącach o najwyższych przychodach.

4. **Geografia**  
   - Najwyższe przychody generowane są w kilku wybranych stanach/regionach, co można wykorzystać do lepszego targetowania kampanii marketingowych.  
   - Regiony o niskiej sprzedaży mogą być potencjalnym obszarem do rozwoju.

5. **Logistyka**  
   - Średni czas dostawy wynosi około 14 dni, jednak w niektórych regionach występują opóźnienia. To wskazuje na możliwość optymalizacji procesów logistycznych.

---

## 📊 Podsumowanie
Projekt pokazał pełny cykl pracy analityka danych: od przygotowania zapytań SQL, przez modelowanie danych i tworzenie KPI, aż po wizualizację i raportowanie w Power BI i Excelu.  

Dzięki temu udało się:
- zidentyfikować kluczowych klientów i produkty,
- przeanalizować zachowania zakupowe klientów (nowi vs powracający, RFM),
- zbadać sezonowość sprzedaży i czynniki geograficzne,
- stworzyć narzędzie raportowe (dashboard) do monitorowania wyników.

---

## 🛠️ Technologie
- **SQL (SSMS)** — zapytania i analizy,
- **Power BI (DAX, model danych)** — dashboard interaktywny,
- **Excel (Power Query, Tabele przestawne)** — dodatkowy raport i dashboard.

---

## 👩‍💻 Autor
Eliza Kapela 
[LinkedIn] www.linkedin.com/in/eliza-kapela


---
