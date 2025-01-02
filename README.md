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

##  Vizualizations

## GDP Growth Analysis
![image](https://github.com/user-attachments/assets/cf5407fb-0dba-40ef-846a-6b5ebf9d6ea9)

Based on the GDP trend visualization for Poland (2007-2022), here's the analysis to accompany the README:

## GDP Growth Analysis

### Overall Trend
The graph shows significant fluctuations in Poland's GDP growth rate over the 2007-2022 period, with several notable phases:

### Key Periods
- **2007-2009**: Started strong with growth rates above 106%, followed by a gradual decline
- **2010-2011**: Recovery period with growth rates stabilizing around 104-105%
- **2012-2013**: Slowdown period with growth dropping to approximately 100-101%
- **2014-2016**: Stable growth period maintaining around 103-104%
- **2019-2020**: Sharp decline during the pandemic, reaching a low of 92.15%
- **2021-2022**: Strong recovery with growth peaking at 112.24%, followed by normalization

### Notable Features
- **Highest Peak**: Approximately 112.24% growth in 2021
- **Lowest Point**: 92.15% during the 2020 crisis
- **Recovery Pattern**: V-shaped recovery post-2020
- **Pre-Pandemic Stability**: Relatively stable growth rates between 104-106% during 2015-2019

### Technical Characteristics
- **Data Frequency**: Quarterly measurements
- **Measurement Unit**: Year-over-year percentage change
- **Time Range**: 2007 Q1 to 2022 Q4
- **Missing Data**: Some gaps in the latest periods of 2022

This analysis provides context for the GDP visualization in the repository's documentation, highlighting key economic phases in Poland's recent history.

Citations:
[1] https://pplx-res.cloudinary.com/image/upload/v1735825327/user_uploads/PBwcgvaUUUIdSoC/image.jpg
[2] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/38442079/00dc0877-12c9-411b-91cc-2eb2a69e8c4e/dane_kw.xlsx

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
