-- ============================================================
-- Uber Ride Bookings Analytics
-- Day 1: Dataset Exploration & Data Quality Analysis
-- ============================================================


-- ============================================================
-- 1. View Sample Records
-- Selected columns only for cleaner terminal output
-- ============================================================

SELECT
    "Date",
    "Time",
    "Booking ID",
    "Booking Status",
    "Customer ID",
    "Vehicle Type",
    "Pickup Location",
    "Drop Location"
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
-- 6. Total Number of Vehicle Types
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
    ) AS booking_percentage
FROM uber_bookings
GROUP BY "Booking Status"
ORDER BY total_bookings DESC;


-- ============================================================
-- 9. Location Coverage
-- ============================================================

SELECT
    COUNT(DISTINCT "Pickup Location") AS pickup_locations,
    COUNT(DISTINCT "Drop Location") AS drop_locations
FROM uber_bookings;


-- ============================================================
-- 10. Top 10 Pickup Locations
-- ============================================================

SELECT
    "Pickup Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Pickup Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 11. Top 10 Drop Locations
-- ============================================================

SELECT
    "Drop Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Drop Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 12. Payment Method Distribution
-- ============================================================

SELECT
    "Payment Method",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Payment Method"
ORDER BY total_bookings DESC;


-- ============================================================
-- 13. Duplicate Booking ID Sample
-- ============================================================

SELECT
    "Booking ID",
    COUNT(*) AS duplicate_count
FROM uber_bookings
GROUP BY "Booking ID"
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC, "Booking ID"
LIMIT 10;


-- ============================================================
-- 14. Duplicate Booking Summary
-- ============================================================

SELECT
    COUNT(*) AS duplicated_booking_ids,
    SUM(booking_count - 1) AS extra_duplicate_rows
FROM (
    SELECT
        "Booking ID",
        COUNT(*) AS booking_count
    FROM uber_bookings
    GROUP BY "Booking ID"
    HAVING COUNT(*) > 1
) AS duplicates;


-- ============================================================
-- 15. Missing Values - Core Fields
-- ============================================================

SELECT
    SUM(
        CASE
            WHEN "Booking ID" IS NULL
                 OR LOWER(TRIM("Booking ID")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_booking_ids,

    SUM(
        CASE
            WHEN "Customer ID" IS NULL
                 OR LOWER(TRIM("Customer ID")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_customer_ids,

    SUM(
        CASE
            WHEN "Vehicle Type" IS NULL
                 OR LOWER(TRIM("Vehicle Type")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_vehicle_types

FROM uber_bookings;


-- ============================================================
-- 16. Missing Values - Location Fields
-- ============================================================

SELECT
    SUM(
        CASE
            WHEN "Pickup Location" IS NULL
                 OR LOWER(TRIM("Pickup Location")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_pickup_locations,

    SUM(
        CASE
            WHEN "Drop Location" IS NULL
                 OR LOWER(TRIM("Drop Location")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_drop_locations

FROM uber_bookings;


-- ============================================================
-- 17. Missing Values - Ride Metrics
-- ============================================================

SELECT
    SUM(
        CASE
            WHEN "Booking Value" IS NULL
                 OR LOWER(TRIM("Booking Value")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_booking_values,

    SUM(
        CASE
            WHEN "Ride Distance" IS NULL
                 OR LOWER(TRIM("Ride Distance")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_ride_distances,

    SUM(
        CASE
            WHEN "Payment Method" IS NULL
                 OR LOWER(TRIM("Payment Method")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_payment_methods

FROM uber_bookings;


-- ============================================================
-- 18. Missing Values - Rating Fields
-- ============================================================

SELECT
    SUM(
        CASE
            WHEN "Driver Ratings" IS NULL
                 OR LOWER(TRIM("Driver Ratings")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_driver_ratings,

    SUM(
        CASE
            WHEN "Customer Rating" IS NULL
                 OR LOWER(TRIM("Customer Rating")) = 'null'
            THEN 1 ELSE 0
        END
    ) AS missing_customer_ratings

FROM uber_bookings;


-- ============================================================
-- 19. Booking Value Statistics
-- ============================================================

SELECT
    ROUND(
        MIN(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS minimum_booking_value,

    ROUND(
        MAX(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS maximum_booking_value,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_booking_value,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings;


-- ============================================================
-- 20. Ride Distance Statistics
-- ============================================================

SELECT
    ROUND(
        MIN(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS minimum_ride_distance,

    ROUND(
        MAX(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS maximum_ride_distance,

    ROUND(
        AVG(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS average_ride_distance,

    ROUND(
        SUM(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS total_ride_distance

FROM uber_bookings;


-- ============================================================
-- 21. Driver Rating Statistics
-- ============================================================

SELECT
    ROUND(
        AVG(TRY_CAST("Driver Ratings" AS DOUBLE)),
        2
    ) AS average_driver_rating,

    ROUND(
        MIN(TRY_CAST("Driver Ratings" AS DOUBLE)),
        2
    ) AS minimum_driver_rating,

    ROUND(
        MAX(TRY_CAST("Driver Ratings" AS DOUBLE)),
        2
    ) AS maximum_driver_rating

FROM uber_bookings;


-- ============================================================
-- 22. Customer Rating Statistics
-- ============================================================

SELECT
    ROUND(
        AVG(TRY_CAST("Customer Rating" AS DOUBLE)),
        2
    ) AS average_customer_rating,

    ROUND(
        MIN(TRY_CAST("Customer Rating" AS DOUBLE)),
        2
    ) AS minimum_customer_rating,

    ROUND(
        MAX(TRY_CAST("Customer Rating" AS DOUBLE)),
        2
    ) AS maximum_customer_rating

FROM uber_bookings;


-- ============================================================
-- 23. Final Dataset Overview - Records
-- ============================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT "Booking ID") AS unique_booking_ids,
    COUNT(DISTINCT "Customer ID") AS unique_customers
FROM uber_bookings;


-- ============================================================
-- 24. Final Dataset Overview - Dimensions
-- ============================================================

SELECT
    COUNT(DISTINCT "Vehicle Type") AS vehicle_types,
    COUNT(DISTINCT "Pickup Location") AS pickup_locations,
    COUNT(DISTINCT "Drop Location") AS drop_locations
FROM uber_bookings;


-- ============================================================
-- 25. Final Dataset Overview - Date Coverage
-- ============================================================

SELECT
    MIN("Date") AS start_date,
    MAX("Date") AS end_date
FROM uber_bookings;