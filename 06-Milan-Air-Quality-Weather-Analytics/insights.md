# Milan Air Quality & Weather Analytics - Insights

## Dataset Overview

- The project analyzes Milan's air quality and weather conditions using both daily and hourly datasets.
- The daily dataset contains long-term environmental measurements, while the hourly dataset provides detailed time-series observations.
- The datasets include key air pollutants such as PM2.5, PM10, Nitrogen Dioxide (NO₂), Ozone (O₃), and Sulphur Dioxide (SO₂).
- Weather variables include temperature, humidity, wind speed, atmospheric pressure, precipitation, and other environmental indicators.

---

## Key Findings

### Dataset Coverage

- Successfully imported both daily and hourly datasets into DuckDB.
- The datasets span multiple years, enabling long-term environmental trend analysis.
- Daily observations provide an overview of weather and air quality patterns, while hourly observations support detailed time-based analysis.

### Weather Overview

- The dataset contains comprehensive weather measurements, including temperature, humidity, pressure, wind speed, and precipitation.
- These variables will be used to analyze seasonal weather patterns and their relationship with air quality.

### Air Quality Overview

- Air quality measurements include multiple pollutants commonly used to assess environmental health.
- European Air Quality Index (EAQI) values are available to evaluate pollution severity over time.
- The dataset enables analysis of pollution trends across different periods and environmental conditions.

---

## Business Value

Analyzing historical weather and air quality data can help:

- Identify long-term pollution trends.
- Understand seasonal changes in environmental conditions.
- Evaluate the relationship between weather and air pollution.
- Support environmental monitoring and public health decision-making.
- Provide insights for sustainable urban planning and pollution management.


---

# Day 2 Insights - Air Quality Analytics

## Key Findings

### Air Pollution Overview

- The analysis evaluated key air pollutants, including PM2.5, PM10, Nitrogen Dioxide (NO₂), Ozone (O₃), and Sulphur Dioxide (SO₂).
- Monthly and yearly trends were analyzed to identify variations in pollution levels throughout the observation period.
- The European Air Quality Index (EAQI) was used to assess the overall air quality status.

### Monthly Pollution Trends

- Monthly average PM2.5 and PM10 concentrations show noticeable seasonal variations.
- Average EAQI values fluctuate across different months, indicating changes in overall air quality throughout the year.
- Certain months consistently experience higher pollution levels, while others maintain relatively cleaner air conditions.

### Most Polluted Days

- The analysis identified the top 10 days with the highest European Air Quality Index (EAQI) values.
- Days with the highest PM2.5 and PM10 concentrations represent periods of elevated air pollution.
- These high-pollution events can be further analyzed alongside weather conditions to understand possible contributing factors.

### Air Quality Categories

- Air quality observations were categorized into Good, Fair, Moderate, Poor, Very Poor, and Extremely Poor classifications.
- The distribution of these categories provides an overview of Milan's environmental conditions over the study period.
- Most observations fall within acceptable air quality ranges, while a smaller proportion represent periods of degraded air quality.

### Yearly Air Quality Trends

- Average pollutant concentrations were compared across multiple years.
- Year-over-year comparisons help identify long-term improvements or deterioration in air quality.
- These trends provide valuable insights for environmental monitoring and policy evaluation.

---

## Business Value

Analyzing historical air quality patterns helps environmental agencies and city planners:

- Monitor long-term pollution trends.
- Identify high-risk pollution periods.
- Support public health awareness initiatives.
- Evaluate the effectiveness of environmental regulations.
- Improve urban sustainability and pollution management strategies.

---

# Day 3 Insights - Weather Analytics

## Key Findings

### Temperature Analysis

- Monthly average temperatures were analyzed to identify seasonal weather patterns throughout the observation period.
- The dataset highlights significant temperature variations between colder winter months and warmer summer months.
- The hottest and coldest days were identified, providing insights into extreme weather events.

### Humidity Analysis

- Average humidity levels vary across different months, reflecting seasonal atmospheric changes.
- Higher humidity levels are generally observed during colder months, while relatively lower humidity occurs during warmer periods.
- Understanding humidity trends helps evaluate overall weather conditions and their potential influence on air quality.

### Rainfall Analysis

- Monthly rainfall patterns were examined using cumulative daily precipitation values.
- The analysis identified the rainiest days within the dataset, highlighting periods of significant precipitation.
- Rainfall trends provide valuable context for understanding seasonal weather variations and their relationship with environmental conditions.

### Wind Speed Analysis

- Monthly average wind speeds were analyzed to understand changes in atmospheric movement throughout the year.
- The windiest days were identified, representing periods with stronger wind activity.
- Wind speed plays an important role in the dispersion of air pollutants and overall air quality.

### Atmospheric Pressure Analysis

- Average atmospheric pressure remained relatively stable across the observation period with normal seasonal fluctuations.
- Pressure measurements provide additional insight into changing weather systems and environmental conditions.

---

## Business Value

Weather analytics provides valuable insights that support environmental monitoring and urban planning by:

- Understanding seasonal weather variations.
- Identifying extreme temperature and precipitation events.
- Monitoring long-term climate patterns.
- Supporting future air quality correlation analysis.
- Assisting environmental agencies in data-driven decision-making for sustainable city management.

---

# Day 4 Insights - Weather & Air Quality Correlation Analysis

## Key Findings

### Temperature and Air Quality

- Air quality metrics were analyzed across different temperature ranges to identify potential relationships between temperature and pollution levels.
- Average PM2.5, PM10, and EAQI values vary across temperature categories, indicating that weather conditions may influence pollutant concentrations.

### Humidity and Pollution

- Air quality was compared across multiple humidity ranges.
- Variations in PM2.5, PM10, and EAQI suggest that humidity plays a role in the dispersion and accumulation of air pollutants.
- This analysis provides a better understanding of atmospheric conditions associated with poor air quality.

### Rainfall Impact

- Rainy and non-rainy days were compared to evaluate the impact of precipitation on pollution levels.
- Rainfall generally contributes to the removal of airborne particulate matter through natural atmospheric cleansing.
- Comparing these conditions helps assess the effectiveness of precipitation in improving air quality.

### Wind Speed Analysis

- Air quality indicators were analyzed under different wind speed categories.
- Wind plays an important role in dispersing pollutants and reducing localized pollution concentrations.
- Stronger wind conditions generally promote better air circulation and improved environmental conditions.

### Monthly Weather and Air Quality Trends

- Monthly weather conditions were evaluated alongside key air pollution indicators.
- The combined analysis highlights seasonal variations in both weather and air quality throughout the observation period.
- Understanding these trends supports long-term environmental monitoring and urban planning initiatives.

### High Pollution Periods

- The analysis identified periods with pollution levels above the overall average.
- These observations provide valuable insights into environmental conditions associated with elevated pollution events.
- High pollution periods can be further investigated to understand contributing meteorological and seasonal factors.

---

## Business Value

Understanding the relationship between weather conditions and air quality helps organizations and public agencies:

- Monitor environmental risks more effectively.
- Improve pollution forecasting and early warning systems.
- Support evidence-based environmental policy decisions.
- Develop sustainable urban planning strategies.
- Enhance public health awareness through environmental analytics.

---

# Day 5 Insights - Advanced SQL Analytics

## Key Findings

### Monthly Pollution Ranking

- Ranking functions were used to identify the months with the highest average PM2.5 concentrations and European Air Quality Index (EAQI) values.
- The analysis highlights periods with consistently higher pollution levels, enabling easier comparison across months.
- Ranking techniques simplify the identification of high-risk environmental periods.

### Yearly Pollution Analysis

- Year-over-year comparisons were performed to evaluate long-term changes in air quality.
- Average PM2.5, PM10, and EAQI values were compared across multiple years to identify environmental trends.
- These comparisons provide valuable insights into improvements or deteriorations in overall air quality.

### Time-Series Analysis

- Running averages were calculated to observe long-term pollution trends while minimizing the impact of short-term fluctuations.
- Sequential analysis using previous-day and next-day comparisons provides better visibility into daily pollution changes.
- Time-series techniques help monitor environmental patterns over extended periods.

### Window Function Analysis

- ROW_NUMBER() was used to identify the most polluted day within each year.
- RANK() and DENSE_RANK() were applied to compare pollution levels across different months.
- LAG() and LEAD() functions enabled comparisons between consecutive observations, supporting trend identification and change analysis.

### Common Table Expressions (CTEs)

- Common Table Expressions (CTEs) simplified complex analytical queries by breaking them into logical steps.
- CTEs improved query readability, maintainability, and overall analytical workflow.
- Multi-step summaries generated using CTEs provide meaningful environmental insights for reporting and decision-making.

---

## SQL Concepts Demonstrated

Throughout this project, the following SQL concepts were applied:

- Aggregate Functions
- GROUP BY
- HAVING
- CASE Statements
- Date Functions
- Conditional Analysis
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- Running Averages
- Time-Series Analysis
- Environmental Data Analytics

---

## Business Value

Advanced SQL analytics enables organizations to:

- Detect long-term environmental trends.
- Identify seasonal pollution patterns.
- Monitor changes in air quality over time.
- Improve environmental reporting and forecasting.
- Support evidence-based policy and sustainability initiatives.
- Enhance public health monitoring through data-driven insights.

---

# Project Summary

This project demonstrates how SQL can be used to analyze historical weather and air quality datasets to uncover meaningful environmental insights. By combining descriptive analytics, trend analysis, weather correlation, and advanced SQL techniques such as Common Table Expressions (CTEs) and Window Functions, the project provides a comprehensive understanding of Milan's environmental conditions.

The project showcases practical SQL skills that are widely used in real-world data analytics, including data exploration, aggregation, ranking, time-series analysis, and business insight generation. It also illustrates how environmental data can support sustainable urban planning, pollution monitoring, and public health decision-making.
