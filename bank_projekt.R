# ============================================
# Macroeconomic Data Processing
# Description: The code reads data from multiple sheets in an Excel file,
# converts values to numeric types, and retains missing data (NA) for analysis.
# ============================================

# 1. Import required libraries
library(readxl)
library(ggplot2)


# 2. Set working directory and load example sheets
setwd("C:/Users/zuzan/OneDrive/Pulpit/Dokumenty/bank_projekt")
pkb<-read_xlsx('dane_kw.xlsx',sheet=1)
unmeployment <-read_xlsx('dane_kw.xlsx',sheet=2)

# 3. Define parameters
num_sheets <- 5     
file_name <- 'dane_kw.xlsx'  

# 4. Load data from all sheets
data_list <- list()  # Initialize a list to store data from sheets

# Loop to read data from each sheet
for (i in 1:num_sheets) {
  data_list[[i]] <- read_xlsx(file_name, sheet = i)  
}

# Optional: Assign names to each sheet
names(data_list) <- paste0("Sheet", 1:num_sheets)

# 5. Preview data from the first sheet
# Display the first few rows (example from sheet 1)
# Cannot do much here due to missing values
head(data_list[[1]])

# 6. Preview data from the fifth sheet
# Display all rows from sheet 5 to analyze structure
data_list[[5]]

# 7. Extract and convert data from the first sheet (row 2)
# Fetch the second row
data_list[[1]][2,]

data_list[[1]] [2,3:dim(data_list[[1]])[2]]
# Convert the data to numeric type
as.numeric(data_list[[1]] [2,3:dim(data_list[[1]])[2]])

gdp_row_2 <- as.numeric(unlist(data_list[[1]][2, 3:dim(data_list[[1]])[2]]))

# ============================================
# Data Processing for All Sheets
# ============================================
# 8. Process data for all sheets
results <- list()  # Initialize results list

for (i in 1:length(data_list)) {  # Używamy data_list
  # Extract and convert the second row (from column 3 to the end)
  row_2 <- as.numeric(unlist(data_list[[i]][2, 3:dim(data_list[[i]])[2]]))
  # Extract and convert the third row
  row_3 <- as.numeric(unlist(data_list[[i]][3, 3:dim(data_list[[i]])[2]]))
  
  # Store results for each sheet
  results[[i]] <- list(
    row_2 = row_2,
    row_3 = row_3
  )
}



# ============================================
# Results Display for Each Sheet
# ============================================

# 9. Display results for each sheet
for (i in 1:length(results)) {
  # Display information about sheet number
  cat(paste0("\nSheet ", i, " - Results for Row 2:\n"))
  print(results[[i]]$row_2)  # Display second row data
  
  cat(paste0("\nSheet ", i, " - Results for Row 3:\n"))
  print(results[[i]]$row_3)  # Display third row data
}

# 10. Display structure of data for each sheet
for (i in 1:length(results)) {
  cat(paste0("\nStructure of data for Sheet ", i, ":\n"))
  str(results[[i]])
}

# ============================================
# Statistical Analysis and Visualization
# ============================================

# 11. Time trend analysis for GDP (Sheet 1)

gdp_data <- data.frame(
  index = 1:length(results[[1]]$row_2),
  gdp = results[[1]]$row_2
)

gdp_data$gdp
gdp_data[[2]]
gdp_data[,2]
gdp_ts <-ts(gdp_data$gdp, start =c(2007,1), frequency = 4)
ts_plot(gdp_ts, title = "GDP Trends in Poland (2007-2022)", Ytitle ="GDP (Millions PLN)", Xtitle ="Year" )
gdp_ts_componets <-decompose(gdp_ts)
plot(gdp_ts_componets)

# 12. Time Trend Analysis for Inflation (Sheet 3)
inflation_data <- data.frame(
  index = 1:length(results[[3]]$row_2),
  inflation = results[[3]]$row_2
)
inflation_ts <-ts(inflation_data$inflation, start =c(2007,1), frequency = 4)
ts_plot(inflation_ts, title = "Inflation Trends in Poland (2007-2022)", Ytitle ="Inflation (Millions PLN)", Xtitle ="Year" )


# Dekompozycja Addytywna
gdp_ts_components_add <- decompose(gdp_ts, type = "additive")
plot(gdp_ts_components_add)

# Dekompozycja Multiplikatywna
gdp_ts_components_mult <- decompose(gdp_ts, type = "multiplicative")
plot(gdp_ts_components_mult)

# Sezonowo skorygowany szereg czasowy
gdp_seasonally_adjusted_add <- gdp_ts - gdp_ts_components_add$seasonal
gdp_seasonally_adjusted_mult <- gdp_ts / gdp_ts_components_mult$seasonal

# Obliczenie wariancji dla modeli
var_add <- var(gdp_seasonally_adjusted_add, na.rm = TRUE)
var_mult <- var(gdp_seasonally_adjusted_mult, na.rm = TRUE)

# Wyniki wariancji
cat("Wariancja (Addytywny):", var_add, "\n")
cat("Wariancja (Multiplikatywny):", var_mult, "\n")

# Test wyboru modelu na podstawie wariancji
if (var_mult < var_add) {
  cat("Model multiplikatywny jest lepszy.\n")
} else {
  cat("Model addytywny jest lepszy.\n")
}

# Dekompozycja dla inflacji
inflation_data <- data.frame(
  index = 1:length(results[[3]]$row_2),
  inflation = results[[3]]$row_2
)

inflation_ts <- ts(inflation_data$inflation, start = c(2007, 1), frequency = 4)
ts_plot(inflation_ts, title = "Inflation Trends in Poland (2007-2022)", 
        Ytitle = "Inflation (Millions PLN)", Xtitle = "Year")

inflation_components_add <- decompose(inflation_ts, type = "additive")
inflation_components_mult <- decompose(inflation_ts, type = "multiplicative")

plot(inflation_components_add)
plot(inflation_components_mult)

inflation_seasonally_adjusted_add <- inflation_ts - inflation_components_add$seasonal
inflation_seasonally_adjusted_mult <- inflation_ts / inflation_components_mult$seasonal

var_infl_add <- var(inflation_seasonally_adjusted_add, na.rm = TRUE)
var_infl_mult <- var(inflation_seasonally_adjusted_mult, na.rm = TRUE)

cat("Wariancja Inflacja (Addytywny):", var_infl_add, "\n")
cat("Wariancja Inflacja (Multiplikatywny):", var_infl_mult, "\n")

if (var_infl_mult < var_infl_add) {
  cat("Model multiplikatywny jest lepszy dla inflacji.\n")
} else {
  cat("Model addytywny jest lepszy dla inflacji.\n")
}




# ============================================
# Missing Data Analysis
# ============================================
# 14. Check for missing values
for (i in 1:length(results)) {
  cat(paste0("\nSheet ", i, ": Missing data in Row 2: ", 
             sum(is.na(results[[i]]$row_2)), "\n"))
  cat(paste0("Sheet ", i, ": Missing data in Row 3: ", 
             sum(is.na(results[[i]]$row_3)), "\n"))
}



