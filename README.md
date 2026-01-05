Extreme Weather Analysis (SQL & Power BI)

Project Overview

This project analyzes daily weather data to identify extreme temperature and wind conditions over a one-year period. Using SQL (SQLite) for data cleaning and analysis and Power BI for visualization, the project explores how frequently extreme weather occurs and how it changes over time. 
This project was also my first time working with Power BI, making it a hands-on learning experience focused on data preparation, analytical thinking, and dashboard storytelling. 

Dataset 
• Simulated weather dataset representing a single sample weather station
• Granularity: Daily observations
• Time period: 2023
• Key variables: 
   • Daily maximum temperature (°F)
   • Daily minimum (°F)
   • Average wind speed (mph) 
   • Date

Note: 
The dataset is simulated and intentionally includes unrealistic values and duplicate records to support data-cleaning practice rather than reak-world forecasting. 

Data Cleaning & Preparation (SQL)
Data preparation was performed using SQLite, with the following steps:
• Identified and handled duplicate records for the same station and date
• Checked for logical inconsistencies (e.g., minimum temperature higher than maximum temperature)
• Investigated unrealistic sensor values
• Created a cleaned SQL view for analysis while preserving the raw data
Defined extreme weather thresholds: 
   • Extreme Heat: Maximum temperature > 90°F
   • Extreme Cold: Minimum temperature < 32°F
   • Extreme Wind: Wind speed > 20 mph

All assumptions were documented and applied consistently across the analysis. 

Analysis & Visualization (Power BI) 
The Power  BI report is organized into three pages: 
(i) Dashboard
• High-level KPIs: 
   • Total recorded days
   • Extreme weather days
   • Percentage of extreme days
   • Extreme heat, cold, and wind counts
• Visualizations: 
   • Distribution of extreme weather types
   • Monthly of extreme weather counts
   • Monthly temperature and wind trends
(ii) Analysis
• Daily temperature and wind trend analysis
• Highlights high day-to-day variability
• Demonstrates how monthly averages can mask extreme daily conditions
• Supports summary KPIs with granular evidence
(iii) Dataset
• Tabular view of cleaned data
• Extreme condition flags
• Transparency into the underlying dataset

Key Findings
• 71% of recorded days experienced at least one extreme weather condition
• Extreme cold days accounted for the largest share of extreme events
• Wind speeds peaked during mid-year, while temperature volatality persisted throughout the year
• Daily-level analysis revealed significant variability hidden by aggregated averages

Tools & Technologies
• SQL (SQLite) – Data cleaning, validation, and aggregation
• Power BI – Data modeling, visualization, and storytelling
• Git & GitHub – Version control and portfolio hosting

What I learned
• How to clean and validate real-world-like datsets
• How to define and document analytical assumptions
• How to balance summary-level insights with detailed analysis
• How to build clear, structured dashboards that answer specific questions
• How SQL and Power BI integrated in an end-to-end analysis workflow

Time Investment
This project took several days to complete, including:
• Learning Power BI fundamentals
• Iterative dashboard design and refinement
• Data validation and assumption review
• Documentation and portfolio preparation

Project Structure
extreme-weather-analysis/
├── data/        # Dataset files (if included)
├── sql/         # SQL queries and cleaned views
├── powerbi/     # Power BI (.pbix) report
└── README.md

Next Steps
• Incorporate multi-year or multi-station data
• Add geographic comparisons
• Explore trend forecasting and anomaly detection