library(readxl)
setwd("C:/Users/zuzan/OneDrive/Pulpit/Dokumenty/bank_projekt")

library(readxl)
setwd("C:/Users/zuzan/OneDrive/Pulpit/Dokumenty/bank_projekt")
pkb<-read_xlsx('dane_kw.xlsx',sheet=1)
unmeployment <-read_xlsx('dane_kw.xlsx',sheet=2)
# Liczba arkuszy w pliku
liczba_arkuszy <- 5
plik <- 'dane_kw.xlsx'
# Lista do przechowywania danych z każdego arkusza
dane_list <- list()

# Pętla do wczytywania danych z każdego arkusza
for (i in 1:liczba_arkuszy) {
  dane_list[[i]] <- read_xlsx(plik, sheet = i)
}

# Opcjonalnie: nadanie nazw elementom listy
names(dane_list) <- paste0("Sheet", 1:liczba_arkuszy)

# Wyświetlenie przykładowych danych z pierwszego arkusza
# Nie można tu za wiele zrobić wartości brakujących 
head(dane_list[[1]])

#Skonwertować na dane liczbowe z char

dane_list[[5]] 


dane_list[[1]] [2,]

dane_list[[1]] [2,3:dim(dane_list[[1]])[2]]
as.numeric(dane_list[[1]] [2,3:dim(dane_list[[1]])[2]])

dane_2 <- as.numeric(unlist(dane_list[[1]][2, 3:dim(dane_list[[1]])[2]]))


wyniki <- list()

# Przetwarzanie danych z każdego arkusza
for (i in 1:length(dane_list)) {
  # Pobranie drugiego i trzeciego wiersza (od 3 kolumny do końca)
  wiersz_2 <- as.numeric(unlist(dane_list[[i]][2, 3:dim(dane_list[[i]])[2]]))
  wiersz_3 <- as.numeric(unlist(dane_list[[i]][3, 3:dim(dane_list[[i]])[2]]))
   
  # Zapisanie wyników do listy
  wyniki[[i]] <- list(
    wiersz_2 = wiersz_2,
    wiersz_3 = wiersz_3
  )
}

# Dane z drugiego wiersza z pierwszego arkusza
print(wyniki[[1]]$wiersz_2)

# Dane z trzeciego wiersza z drugiego arkusza
print(wyniki[[2]]$wiersz_3)


str(wyniki[[1]])

