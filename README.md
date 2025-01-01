# Polish Macroeconomic Indicators Analysis

## Overview
This repository provides quarterly macroeconomic indicators for Poland, organized in an Excel file (**dane_kw.xlsx**). It supports the analysis of economic trends and predictive modeling of Poland's economy.

## Dataset Structure
1. **GDP (PKB)**
   - Quarterly GDP in millions of PLN  
   - Year-over-year and quarter-over-quarter growth rates  

2. **Unemployment (Bezrobocie)**
   - Quarterly unemployment rate  
   - Expressed as a percentage of the labor force  

3. **Inflation (Inflacja)**
   - Multiple inflation metrics (CPI, PPI)  
   - Year-over-year and quarter-over-quarter changes  

4. **Interest Rates (Stopa NBP)**
   - Key rates by the National Bank of Poland (rediscount, lombard, reference)  
   - Expressed as end-of-quarter percentages  

5. **Monetary Aggregate M3**
   - Broad money supply (in millions of PLN)  
   - Quarterly and annual growth rates  

## Data Specifications
- **Format**: Time series data with YYYY-MM-DD dates  
- **Units**: Indicators in %, PLN millions, or index values  
- **Categorical Descriptors**: Additional classification columns  
- **Quality**: Contains NA values; no data cleaning or outlier removal  

## Code Tasks
This code performs the following tasks:
- Imports necessary libraries and sets up the working environment  
- Loads data from multiple sheets in the Excel file  
- Processes the data, converting relevant rows to numeric format  
- Displays results and data structure for each sheet  
- Conducts time trend analysis for GDP and inflation using **ggplot2**  
- Performs correlation analysis for interest rates  
- Calculates the correlation coefficient between interest rates  
- Checks for missing values in each sheet  

## Research Applications
- Correlation analyses among economic indicators  
- Predictive modeling of trends  
- Exploring relationships between unemployment, inflation, and GDP  
