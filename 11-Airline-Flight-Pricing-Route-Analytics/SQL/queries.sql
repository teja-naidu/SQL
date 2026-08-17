-- =====================================================
-- Airline Flight Pricing & Route Analytics
-- Day 1: Dataset Overview
-- =====================================================


-- 1. Total Number of Flights

SELECT
    COUNT(*) AS total_flights
FROM flights;


-- 2. Total Number of Airlines

SELECT
    COUNT(DISTINCT airline) AS total_airlines
FROM flights;


-- 3. Total Source Cities

SELECT
    COUNT(DISTINCT source_city) AS total_source_cities
FROM flights;


-- 4. Total Destination Cities

SELECT
    COUNT(DISTINCT destination_city) AS total_destination_cities
FROM flights;


-- 5. Dataset Journey Date Range

SELECT
    MIN(journey_date) AS earliest_journey_date,
    MAX(journey_date) AS latest_journey_date
FROM flights;


-- 6. Ticket Price Overview

SELECT
    ROUND(AVG(price), 2) AS average_ticket_price,
    MIN(price) AS minimum_ticket_price,
    MAX(price) AS maximum_ticket_price
FROM flights;


-- 7. Number of Flights by Airline

SELECT
    airline,
    COUNT(*) AS total_flights
FROM flights
GROUP BY airline
ORDER BY total_flights DESC;


-- 8. Flights by Source City

SELECT
    source_city,
    COUNT(*) AS total_flights
FROM flights
GROUP BY source_city
ORDER BY total_flights DESC;


-- 9. Flights by Destination City

SELECT
    destination_city,
    COUNT(*) AS total_flights
FROM flights
GROUP BY destination_city
ORDER BY total_flights DESC;


-- 10. Flight Distribution by Number of Stops

SELECT
    total_stops,
    COUNT(*) AS total_flights
FROM flights
GROUP BY total_stops
ORDER BY total_flights DESC;