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