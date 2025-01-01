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

data_list[[1]] [2,3:dim(dane_list[[1]])[2]]
# Convert the data to numeric type
as.numeric(dane_list[[1]] [2,3:dim(dane_list[[1]])[2]])

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

ggplot(gdp_data, aes(x = index, y = gdp)) +
  geom_line(color = "blue") +
  geom_point(color = "blue") +
  labs(title = "Time Trend of GDP (Sheet 1)", x = "Time", y = "GDP") +
  theme_minimal()

# 12. Time trend analysis for Inflation (Sheet 3)
inflation_data <- data.frame(
  index = 1:length(results[[3]]$row_2),
  inflation = results[[3]]$row_2
)

ggplot(inflation_data, aes(x = index, y = inflation)) +
  geom_line(color = "green") +
  geom_point(color = "green") +
  labs(title = "Time Trend of Inflation (Sheet 3)", x = "Time", y = "Inflation (%)") +
  theme_minimal()

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



