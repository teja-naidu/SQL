-- ==========================================
-- Food Delivery Operations Analytics
-- Schema Creation
-- ==========================================

CREATE OR REPLACE TABLE food_delivery AS
SELECT *
FROM read_csv_auto('Datasets/food_delivery_analytics.csv');

-- Verify dataset
SELECT COUNT(*) AS total_records
FROM food_delivery;

-- Preview data
SELECT *
FROM food_delivery
LIMIT 10;

-- Check table structure
DESCRIBE food_delivery;