# Milan Air Quality & Weather Analytics

## Project Overview

This project analyzes Milan's historical air quality and weather data using SQL to uncover environmental trends, pollution patterns, and the relationship between weather conditions and air quality. The analysis combines daily and hourly datasets to generate meaningful insights through descriptive, comparative, and advanced analytical SQL queries.

The project demonstrates practical SQL techniques commonly used by Data Analysts, including aggregations, filtering, conditional logic, Common Table Expressions (CTEs), Window Functions, and time-series analysis.

---

## Objectives

- Analyze long-term air quality trends.
- Explore seasonal weather patterns.
- Study the relationship between weather conditions and pollution levels.
- Identify periods of high and low pollution.
- Perform advanced SQL analytics using Window Functions and CTEs.
- Generate business-oriented environmental insights.

---

## Dataset

The project uses two datasets containing historical environmental observations for Milan.

### Daily Dataset

Includes daily weather and air quality measurements such as:

- Temperature
- Relative Humidity
- Atmospheric Pressure
- Wind Speed
- Precipitation
- PM2.5
- PM10
- Nitrogen Dioxide (NO₂)
- Ozone (O₃)
- Sulphur Dioxide (SO₂)
- European Air Quality Index (EAQI)

### Hourly Dataset

Contains detailed hourly observations for weather and air quality parameters to support time-series analysis.

---

## Project Structure

```
06-Milan-Air-Quality-Weather-Analytics
│
├── Datasets
│   ├── weatheraqDataset.csv
│   └── weatheraqHourly.csv
│
├── SQL
│   ├── schema.sql
│   └── queries.sql
│
├── Screenshots
│
├── insights.md
└── README.md
```

---

## SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- CASE Statements
- Date Functions
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- Running Averages
- Time-Series Analysis

---

## Project Workflow

### Day 1 - Dataset Exploration

- Imported daily and hourly datasets into DuckDB.
- Explored dataset structure and coverage.
- Calculated summary statistics.
- Performed data quality checks.

### Day 2 - Air Quality Analytics

- Analyzed PM2.5, PM10, NO₂, O₃, and SO₂.
- Evaluated European Air Quality Index (EAQI).
- Identified monthly pollution trends.
- Ranked the most polluted days.
- Categorized air quality levels.

### Day 3 - Weather Analytics

- Examined temperature trends.
- Analyzed humidity patterns.
- Studied rainfall distribution.
- Evaluated wind speed and atmospheric pressure.
- Identified weather extremes.

### Day 4 - Weather & Air Quality Correlation

- Compared pollution across temperature ranges.
- Evaluated humidity and pollution relationships.
- Compared rainy and non-rainy days.
- Analyzed the effect of wind speed on pollution.
- Combined weather and air quality metrics for environmental insights.

### Day 5 - Advanced SQL Analytics

- Applied Common Table Expressions (CTEs).
- Used Window Functions.
- Ranked pollution levels using RANK() and DENSE_RANK().
- Identified yearly pollution leaders using ROW_NUMBER().
- Applied LAG() and LEAD() for time-series comparisons.
- Calculated running averages for pollution analysis.

---

## Key Insights

- Air pollution varies across different seasons.
- Weather conditions influence pollutant concentrations.
- Rainfall contributes to reducing airborne particulate matter.
- Wind speed supports pollutant dispersion.
- Temperature and humidity show noticeable relationships with air quality.
- Window Functions and CTEs provide deeper analytical capabilities for environmental data.

---

## Business Value

This analysis helps:

- Monitor environmental quality.
- Detect long-term pollution trends.
- Support sustainable urban planning.
- Improve environmental reporting.
- Assist public health monitoring.
- Enable data-driven environmental decision-making.

---

## Tools Used

- SQL
- DuckDB
- Git
- GitHub
- Visual Studio Code

---

## Repository Contents

- SQL queries for exploratory, intermediate, and advanced analysis.
- Business insights generated from environmental data.
- Well-structured SQL scripts.
- Documentation describing methodology and findings.

---

## Learning Outcomes

Through this project, I strengthened my skills in:

- Writing optimized SQL queries.
- Environmental data analysis.
- Time-series analytics.
- Business insight generation.
- Common Table Expressions (CTEs).
- Window Functions.
- Data storytelling using SQL.

---

## Conclusion

This project demonstrates how SQL can be applied to real-world environmental datasets to uncover meaningful insights. By integrating weather and air quality data, the analysis provides a comprehensive view of pollution patterns and their relationship with atmospheric conditions while showcasing advanced SQL techniques used in professional data analytics projects.