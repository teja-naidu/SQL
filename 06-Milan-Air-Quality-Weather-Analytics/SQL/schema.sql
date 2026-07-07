-- ==========================================
-- Milan Air Quality & Weather Analytics
-- Schema Creation
-- ==========================================

CREATE OR REPLACE TABLE daily_air_quality_weather AS
SELECT *
FROM read_csv_auto('Datasets/weatheraqDataset.csv');

CREATE OR REPLACE TABLE hourly_air_quality_weather AS
SELECT *
FROM read_csv_auto('Datasets/weatheraqHourly.csv');