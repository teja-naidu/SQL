-- ============================================================
-- Uber Ride Bookings Analytics
-- Day 1: Dataset Exploration & Data Quality Analysis
-- ============================================================


-- ============================================================
-- 1. View Sample Records
-- ============================================================

SELECT *
FROM uber_bookings
LIMIT 10;


-- ============================================================
-- 2. Total Number of Bookings
-- ============================================================

SELECT
    COUNT(*) AS total_bookings
FROM uber_bookings;


-- ============================================================
-- 3. Dataset Date Range
-- ============================================================

SELECT
    MIN("Date") AS start_date,
    MAX("Date") AS end_date
FROM uber_bookings;


-- ============================================================
-- 4. Total Unique Customers
-- ============================================================

SELECT
    COUNT(DISTINCT "Customer ID") AS unique_customers
FROM uber_bookings;


-- ============================================================
-- 5. Available Vehicle Types
-- ============================================================

SELECT DISTINCT
    "Vehicle Type"
FROM uber_bookings
ORDER BY "Vehicle Type";


-- ============================================================
-- 6. Number of Vehicle Types
-- ============================================================

SELECT
    COUNT(DISTINCT "Vehicle Type") AS total_vehicle_types
FROM uber_bookings;


-- ============================================================
-- 7. Booking Status Distribution
-- ============================================================

SELECT
    "Booking Status",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Booking Status"
ORDER BY total_bookings DESC;


-- ============================================================
-- 8. Booking Status Percentage
-- ============================================================

SELECT
    "Booking Status",
    COUNT(*) AS total_bookings,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_bookings
FROM uber_bookings
GROUP BY "Booking Status"
ORDER BY total_bookings DESC;


-- ============================================================
-- 9. Total Pickup Locations
-- ============================================================

SELECT
    COUNT(DISTINCT "Pickup Location") AS total_pickup_locations
FROM uber_bookings;


-- ============================================================
-- 10. Total Drop Locations
-- ============================================================

SELECT
    COUNT(DISTINCT "Drop Location") AS total_drop_locations
FROM uber_bookings;


-- ============================================================
-- 11. Most Common Pickup Locations
-- ============================================================

SELECT
    "Pickup Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Pickup Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 12. Most Common Drop Locations
-- ============================================================

SELECT
    "Drop Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Drop Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 13. Payment Methods Available
-- ============================================================

SELECT
    "Payment Method",
    COUNT(*) AS total_bookings
FROM uber_bookings
WHERE "Payment Method" IS NOT NULL
GROUP BY "Payment Method"
ORDER BY total_bookings DESC;


-- ============================================================
-- 14. Duplicate Booking ID Check
-- ============================================================

SELECT
    "Booking ID",
    COUNT(*) AS duplicate_count
FROM uber_bookings
GROUP BY "Booking ID"
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- ============================================================
-- 15. Missing Value Analysis
-- ============================================================

SELECT
    COUNT(*) AS total_rows,

    COUNT(*) - COUNT("Booking ID")
        AS missing_booking_id,

    COUNT(*) - COUNT("Customer ID")
        AS missing_customer_id,

    COUNT(*) - COUNT("Vehicle Type")
        AS missing_vehicle_type,

    COUNT(*) - COUNT("Pickup Location")
        AS missing_pickup_location,

    COUNT(*) - COUNT("Drop Location")
        AS missing_drop_location,

    COUNT(*) - COUNT("Booking Value")
        AS missing_booking_value,

    COUNT(*) - COUNT("Ride Distance")
        AS missing_ride_distance,

    COUNT(*) - COUNT("Driver Ratings")
        AS missing_driver_ratings,

    COUNT(*) - COUNT("Customer Rating")
        AS missing_customer_rating,

    COUNT(*) - COUNT("Payment Method")
        AS missing_payment_method

FROM uber_bookings;


-- ============================================================
-- 16. Basic Booking Value Statistics
-- ============================================================

SELECT
    ROUND(MIN("Booking Value"), 2) AS minimum_booking_value,
    ROUND(MAX("Booking Value"), 2) AS maximum_booking_value,
    ROUND(AVG("Booking Value"), 2) AS average_booking_value
FROM uber_bookings;


-- ============================================================
-- 17. Basic Ride Distance Statistics
-- ============================================================

SELECT
    ROUND(MIN("Ride Distance"), 2) AS minimum_ride_distance,
    ROUND(MAX("Ride Distance"), 2) AS maximum_ride_distance,
    ROUND(AVG("Ride Distance"), 2) AS average_ride_distance
FROM uber_bookings;


-- ============================================================
-- 18. Dataset Overview
-- ============================================================

SELECT
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT "Booking ID") AS unique_bookings,
    COUNT(DISTINCT "Customer ID") AS unique_customers,
    COUNT(DISTINCT "Vehicle Type") AS vehicle_types,
    COUNT(DISTINCT "Pickup Location") AS pickup_locations,
    COUNT(DISTINCT "Drop Location") AS drop_locations,
    MIN("Date") AS start_date,
    MAX("Date") AS end_date
FROM uber_bookings;