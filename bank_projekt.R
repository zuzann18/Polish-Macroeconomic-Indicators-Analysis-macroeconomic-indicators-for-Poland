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
library(TSstudio)
for (i in c(1:dim(tfinal)[2])){
  A<- ts(tfinal[,i], frequency = 4, start = c(2007, 1))
  print(ts_plot(A,Ytitle=colnames(tfinal)[i]))
}
gdp_data <- data.frame(
  index = 1:length(results[[1]]$row_2),
  gdp = results[[1]]$row_2
)

gdp_data$gdp
gdp_data[[2]]
gdp_data[,2]
gdp_ts <-ts(gdp_data$gdp, start =c(2007,1), frequency = 4)
ts_plot(gdp_ts, title = "GDP Trends in Poland (2007-2022)", Ytitle ="GDP (Millions PLN)", Xtitle ="Year" )

# 12. Time Trend Analysis for Inflation (Sheet 3)
inflation_data <- data.frame(
  index = 1:length(results[[3]]$row_2),
  inflation = results[[3]]$row_2
)
inflation_ts <-ts(inflation_data$inflation, start =c(2007,1), frequency = 4)
ts_plot(inflation_ts, title = "Inflation Trends in Poland (2007-2022)", Ytitle ="Inflation (Millions PLN)", Xtitle ="Year" )

gdp_ts_componets <-decompose(gdp_ts)
plot(gdp_ts_componets)
gdp_ts_componets <-decompose(gdp_ts)
plot(gdp_ts_componets)

gdp_ts_componets_seasoanllyadjusted <-gdp_ts - gdp_ts_componets$

# 13. Correlation analysis for Interest Rates (Sheet 4)
interest_rate_data <- data.frame(
  rate_1 = results[[4]]$row_2,
  rate_2 = results[[4]]$row_3
)

ggplot(interest_rate_data, aes(x = rate_1, y = rate_2)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Correlation between Interest Rates (Sheet 4)", 
       x = "Interest Rate 1 (%)", y = "Interest Rate 2 (%)") +
  theme_minimal()

cor(interest_rate_data$rate_1, interest_rate_data$rate_2, use = "complete.obs")

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



