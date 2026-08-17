-- =====================================================
-- Airline Flight Pricing & Route Analytics
-- Day 1: Database Schema Creation
-- =====================================================

CREATE OR REPLACE TABLE flights AS
SELECT
    "index" AS flight_id,
    airline,
    CAST(date_of_journey AS DATE) AS journey_date,
    Source AS source_city,
    destination AS destination_city,
    route,
    dep_time AS departure_time,
    Arrival_time AS arrival_time,
    Duration AS duration,
    Total_stops AS total_stops,
    Additional_info AS additional_info,
    Price AS price
FROM read_csv_auto('Datasets/flights.csv', header = true);