-- ==========================================
-- Day 1 - Dataset Overview
-- ==========================================

--------------------------------------------------
-- Query 1 : Total Daily Records
--------------------------------------------------

SELECT COUNT(*) AS total_daily_records
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 2 : Total Hourly Records
--------------------------------------------------

SELECT COUNT(*) AS total_hourly_records
FROM hourly_air_quality_weather;


--------------------------------------------------
-- Query 3 : Date Range of Daily Dataset
--------------------------------------------------

SELECT
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 4 : Average Weather Conditions
--------------------------------------------------

SELECT
    ROUND(AVG(avg_temperature_2m),2) AS avg_temperature,
    ROUND(AVG(avg_relative_humidity_2m),2) AS avg_humidity,
    ROUND(AVG(avg_pressure_msl),2) AS avg_pressure,
    ROUND(AVG(max_wind_speed_10m),2) AS avg_max_wind_speed
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 5 : Average Air Quality Metrics
--------------------------------------------------

SELECT
    ROUND(AVG(avg_pm2_5),2) AS avg_pm25,
    ROUND(AVG(avg_pm10),2) AS avg_pm10,
    ROUND(AVG(avg_nitrogen_dioxide),2) AS avg_no2,
    ROUND(AVG(avg_ozone),2) AS avg_ozone,
    ROUND(AVG(avg_sulphur_dioxide),2) AS avg_so2,
    ROUND(AVG(eaqi),2) AS avg_eaqi
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 6 : Highest Recorded Pollution Levels
--------------------------------------------------

SELECT
    MAX(max_pm2_5) AS highest_pm25,
    MAX(max_pm10) AS highest_pm10,
    MAX(max_nitrogen_dioxide) AS highest_no2,
    MAX(max_ozone) AS highest_ozone,
    MAX(max_sulphur_dioxide) AS highest_so2,
    MAX(eaqi) AS highest_eaqi
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 7 : Lowest Recorded Pollution Levels
--------------------------------------------------

SELECT
    MIN(min_pm2_5) AS lowest_pm25,
    MIN(min_pm10) AS lowest_pm10,
    MIN(min_nitrogen_dioxide) AS lowest_no2,
    MIN(min_ozone) AS lowest_ozone,
    MIN(min_sulphur_dioxide) AS lowest_so2,
    MIN(eaqi) AS lowest_eaqi
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 8 : Missing Values Check
--------------------------------------------------

SELECT
    SUM(CASE WHEN avg_pm2_5 IS NULL THEN 1 ELSE 0 END) AS pm25_missing,
    SUM(CASE WHEN avg_pm10 IS NULL THEN 1 ELSE 0 END) AS pm10_missing,
    SUM(CASE WHEN avg_temperature_2m IS NULL THEN 1 ELSE 0 END) AS temperature_missing,
    SUM(CASE WHEN avg_relative_humidity_2m IS NULL THEN 1 ELSE 0 END) AS humidity_missing
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 9 : Hourly Dataset Date Range
--------------------------------------------------

SELECT
    MIN(datetime) AS start_datetime,
    MAX(datetime) AS end_datetime
FROM hourly_air_quality_weather;


--------------------------------------------------
-- Query 10 : Average Hourly Weather Conditions
--------------------------------------------------

SELECT
    ROUND(AVG(temperature_2m),2) AS avg_temperature,
    ROUND(AVG(relative_humidity_2m),2) AS avg_humidity,
    ROUND(AVG(pressure_msl),2) AS avg_pressure,
    ROUND(AVG(wind_speed_10m),2) AS avg_wind_speed
FROM hourly_air_quality_weather;

-- ==========================================
-- Day 2 - Air Quality Analytics
-- ==========================================

--------------------------------------------------
-- Query 1 : Average Pollution Levels
--------------------------------------------------

SELECT
    ROUND(AVG(avg_pm2_5),2) AS avg_pm25,
    ROUND(AVG(avg_pm10),2) AS avg_pm10,
    ROUND(AVG(avg_nitrogen_dioxide),2) AS avg_no2,
    ROUND(AVG(avg_ozone),2) AS avg_ozone,
    ROUND(AVG(avg_sulphur_dioxide),2) AS avg_so2
FROM daily_air_quality_weather;


--------------------------------------------------
-- Query 2 : Monthly Average PM2.5
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(avg_pm2_5),2) AS avg_pm25
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 3 : Monthly Average PM10
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(avg_pm10),2) AS avg_pm10
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 4 : Monthly Average European AQI
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(eaqi),2) AS avg_eaqi
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 5 : Top 10 Most Polluted Days (EAQI)
--------------------------------------------------

SELECT
    date,
    eaqi
FROM daily_air_quality_weather
ORDER BY eaqi DESC
LIMIT 10;


--------------------------------------------------
-- Query 6 : Top 10 Highest PM2.5 Days
--------------------------------------------------

SELECT
    date,
    avg_pm2_5
FROM daily_air_quality_weather
ORDER BY avg_pm2_5 DESC
LIMIT 10;


--------------------------------------------------
-- Query 7 : Top 10 Highest PM10 Days
--------------------------------------------------

SELECT
    date,
    avg_pm10
FROM daily_air_quality_weather
ORDER BY avg_pm10 DESC
LIMIT 10;


--------------------------------------------------
-- Query 8 : Air Quality Category Distribution
--------------------------------------------------

SELECT
    CASE
        WHEN eaqi <= 20 THEN 'Good'
        WHEN eaqi <= 40 THEN 'Fair'
        WHEN eaqi <= 60 THEN 'Moderate'
        WHEN eaqi <= 80 THEN 'Poor'
        WHEN eaqi <= 100 THEN 'Very Poor'
        ELSE 'Extremely Poor'
    END AS air_quality_category,
    COUNT(*) AS total_days
FROM daily_air_quality_weather
GROUP BY air_quality_category
ORDER BY total_days DESC;


--------------------------------------------------
-- Query 9 : Average Pollutants by Year
--------------------------------------------------

SELECT
    YEAR(date) AS year,
    ROUND(AVG(avg_pm2_5),2) AS avg_pm25,
    ROUND(AVG(avg_pm10),2) AS avg_pm10,
    ROUND(AVG(eaqi),2) AS avg_eaqi
FROM daily_air_quality_weather
GROUP BY year
ORDER BY year;


--------------------------------------------------
-- Query 10 : Highest Daily Pollutant Levels
--------------------------------------------------

SELECT
    MAX(max_pm2_5) AS highest_pm25,
    MAX(max_pm10) AS highest_pm10,
    MAX(max_nitrogen_dioxide) AS highest_no2,
    MAX(max_ozone) AS highest_ozone,
    MAX(max_sulphur_dioxide) AS highest_so2
FROM daily_air_quality_weather;

-- ==========================================
-- Day 3 - Weather Analytics
-- ==========================================

--------------------------------------------------
-- Query 1 : Monthly Average Temperature
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(avg_temperature_2m),2) AS avg_temperature
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 2 : Monthly Average Humidity
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(avg_relative_humidity_2m),2) AS avg_humidity
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 3 : Monthly Average Rainfall
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(sum_precipitation),2) AS avg_rainfall
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 4 : Monthly Average Wind Speed
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(max_wind_speed_10m),2) AS avg_wind_speed
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 5 : Monthly Average Atmospheric Pressure
--------------------------------------------------

SELECT
    MONTH(date) AS month,
    ROUND(AVG(avg_pressure_msl),2) AS avg_pressure
FROM daily_air_quality_weather
GROUP BY month
ORDER BY month;


--------------------------------------------------
-- Query 6 : Hottest 10 Days
--------------------------------------------------

SELECT
    date,
    max_temperature_2m
FROM daily_air_quality_weather
ORDER BY max_temperature_2m DESC
LIMIT 10;


--------------------------------------------------
-- Query 7 : Coldest 10 Days
--------------------------------------------------

SELECT
    date,
    min_temperature_2m
FROM daily_air_quality_weather
ORDER BY min_temperature_2m ASC
LIMIT 10;


--------------------------------------------------
-- Query 8 : Rainiest 10 Days
--------------------------------------------------

SELECT
    date,
    sum_precipitation
FROM daily_air_quality_weather
ORDER BY sum_precipitation DESC
LIMIT 10;


--------------------------------------------------
-- Query 9 : Windiest 10 Days
--------------------------------------------------

SELECT
    date,
    max_wind_speed_10m
FROM daily_air_quality_weather
ORDER BY max_wind_speed_10m DESC
LIMIT 10;


--------------------------------------------------
-- Query 10 : Weather Summary
--------------------------------------------------

SELECT
    ROUND(AVG(avg_temperature_2m),2) AS avg_temperature,
    ROUND(AVG(avg_relative_humidity_2m),2) AS avg_humidity,
    ROUND(AVG(sum_precipitation),2) AS avg_rainfall,
    ROUND(AVG(max_wind_speed_10m),2) AS avg_wind_speed,
    ROUND(AVG(avg_pressure_msl),2) AS avg_pressure
FROM daily_air_quality_weather;