# ============================================
# Przetwarzanie danych makroekonomicznych
# Opis: Kod wczytuje dane z wielu arkuszy pliku Excel,
# konwertuje wartości na typ numeryczny, zachowując braki danych (NA).
# ============================================

library(readxl)
setwd("C:/Users/zuzan/OneDrive/Pulpit/Dokumenty/bank_projekt")
pkb<-read_xlsx('dane_kw.xlsx',sheet=1)
unmeployment <-read_xlsx('dane_kw.xlsx',sheet=2)

# 2. Definiowanie parametrów
liczba_arkuszy <- 5 # Liczba arkuszy do przetworzenia
plik <- 'dane_kw.xlsx'

# 3. Wczytywanie danych z pliku Excel
dane_list <- list() # Inicjalizacja listy do przechowywania danych z arkuszy

# Pętla do wczytywania danych z każdego arkusza
for (i in 1:liczba_arkuszy) {
  dane_list[[i]] <- read_xlsx(plik, sheet = i)  
}

# Opcjonalnie: nadanie nazw elementom listy
names(dane_list) <- paste0("Sheet", 1:liczba_arkuszy)

# 4. Podgląd danych z pierwszego arkusza
# Sprawdzenie pierwszych kilku wierszy danych (przykładowo z arkusza 1)
# Nie można tu za wiele zrobić wartości brakujących 
head(dane_list[[1]])


# 5. Podgląd danych z piątego arkusza
# Wyświetlenie całego arkusza 5 w celu analizy struktury danych
#Skonwertować na dane liczbowe z char

dane_list[[5]] 

# 6. Ekstrakcja danych z pierwszego arkusza (wiersz 2)
# Pobranie drugiego wiersza z pierwszego arkusza
dane_list[[1]] [2,]


dane_list[[1]] [2,3:dim(dane_list[[1]])[2]] 
as.numeric(dane_list[[1]] [2,3:dim(dane_list[[1]])[2]])

dane_2 <- as.numeric(unlist(dane_list[[1]][2, 3:dim(dane_list[[1]])[2]]))



# 7. Przetwarzanie danych dla wszystkich arkuszy
wyniki <- list()
for (i in 1:length(dane_list)) {
  # Pobranie i konwersja drugiego wiersza (od 3 kolumny do końca)
  wiersz_2 <- as.numeric(unlist(dane_list[[i]][2, 3:dim(dane_list[[i]])[2]]))
  # Pobranie i konwersja trzeciego wiersza
  wiersz_3 <- as.numeric(unlist(dane_list[[i]][3, 3:dim(dane_list[[i]])[2]]))
   
  # Zapisanie wyników dla każdego arkusza
  wyniki[[i]] <- list(
    wiersz_2 = wiersz_2,
    wiersz_3 = wiersz_3
  )
}

# 8. Wyświetlanie wyników dla każdego arkusza
for (i in 1:length(wyniki)) {
  # Informacja o numerze arkusza
  cat(paste0("\nArkusz ", i, " - Wyniki dla drugiego wiersza:\n"))
  print(wyniki[[i]]$wiersz_2)  # Wyświetlenie drugiego wiersza
  
  cat(paste0("\nArkusz ", i, " - Wyniki dla trzeciego wiersza:\n"))
  print(wyniki[[i]]$wiersz_3)  # Wyświetlenie trzeciego wiersza
}

# 9. Podgląd struktury danych dla każdego arkusza
for (i in 1:length(wyniki)) {
  cat(paste0("\nStruktura danych dla arkusza ", i, ":\n"))
  str(wyniki[[i]])
}
