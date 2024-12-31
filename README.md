# Bank
# Opis danych - Projekt analizy makroekonomicznej

## 1. Plik danych: dane_kw.xlsx
Plik zawiera dane makroekonomiczne podzielone na 5 arkuszy, które reprezentują różne wskaźniki ekonomiczne. Dane te będą wykorzystane do analizy trendów gospodarczych oraz modelowania predykcyjnego.

## 2. Struktura danych

### Arkusze:

#### 1. PKB (Produkt Krajowy Brutto)
- **Opis:** Dane dotyczące PKB w poszczególnych okresach czasowych.
- **Kolumny:**
  - Data: Data w formacie YYYY-MM-DD.
  - Wartość: Wartość PKB w milionach złotych.

#### 2. Bezrobocie
- **Opis:** Stopa bezrobocia w różnych okresach.
- **Kolumny:**
  - Data: Data w formacie YYYY-MM-DD.
  - Wartość: Procentowy poziom bezrobocia (%).

#### 3. Inflacja
- **Opis:** Dane dotyczące wskaźników inflacyjnych.
- **Kolumny:**
  - Data: Data w formacie YYYY-MM-DD.
  - Wartość: Procentowy poziom inflacji (%).

#### 4. Stopy procentowe
- **Opis:** Historyczne dane na temat poziomu stóp procentowych.
- **Kolumny:**
  - Data: Data w formacie YYYY-MM-DD.
  - Wartość: Wysokość stopy procentowej (%).

#### 5. Wskaźniki finansowe
- **Opis:** Różne wskaźniki związane z analizą finansową.
- **Kolumny:**
  - Data: Data w formacie YYYY-MM-DD.
  - Wartość: Wskaźnik finansowy (np. kurs walut, indeksy giełdowe).

## 3. Szczegóły dotyczące brakujących danych
Dane zawierają pewne braki (wartości NA), które nie będą usuwane ani zastępowane, ponieważ mogą być istotne dla analizy. Braki będą traktowane jako brakujące obserwacje wymagające specjalnego traktowania podczas analizy.

## 4. Format i typ danych
- **Data:** Wszystkie daty są w formacie YYYY-MM-DD.
- **Wartość:** Dane numeryczne, reprezentujące wartości ekonomiczne, procentowe lub indeksowe.
- **Kategorie:** Niektóre arkusze mogą zawierać dodatkowe kolumny opisujące typ danych.

## 5. Cel analizy
Dane te zostaną wykorzystane do:
- Analizy korelacji między wskaźnikami makroekonomicznymi.
- Modelowania predykcyjnego trendów gospodarczych.
- Oceny zależności między poziomem bezrobocia, inflacją i wzrostem gospodarczym.

## 6. Przykładowy kod do analizy danych
```R
library(readxl)
plik <- 'dane_kw.xlsx'
dane_list <- list()
for (i in 1:5) {
  dane_list[[i]] <- read_xlsx(plik, sheet = i)
}
# Przykładowy podgląd danych z arkusza 5
head(dane_list[[5]])
```

## 7. Uwagi końcowe
- Dane są wstępnie przygotowane do analizy bez usuwania brakujących wartości ani outlierów.
- Interpretacja wyników będzie uwzględniać kontekst ekonomiczny oraz specyfikę brakujących danych.

