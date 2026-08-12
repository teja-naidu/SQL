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

-- ============================================================
-- Uber Ride Bookings Analytics
-- Day 2: Booking & Revenue Analytics
-- ============================================================


-- ============================================================
-- 26. Completed Ride Summary
-- ============================================================

SELECT
    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS completed_booking_value,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_completed_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed';


-- ============================================================
-- 27. Completion Rate
-- ============================================================

SELECT
    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate

FROM uber_bookings;


-- ============================================================
-- 28. Booking Performance by Vehicle Type
-- ============================================================

SELECT
    "Vehicle Type",

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate

FROM uber_bookings
GROUP BY "Vehicle Type"
ORDER BY total_bookings DESC;


-- ============================================================
-- 29. Booking Value by Vehicle Type
-- Completed rides only
-- ============================================================

SELECT
    "Vehicle Type",

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Vehicle Type"
ORDER BY total_booking_value DESC;


-- ============================================================
-- 30. Booking Value by Payment Method
-- ============================================================

SELECT
    "Payment Method",

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
  AND "Payment Method" IS NOT NULL
  AND LOWER(TRIM("Payment Method")) <> 'null'
GROUP BY "Payment Method"
ORDER BY total_booking_value DESC;


-- ============================================================
-- 31. Monthly Booking Trend
-- ============================================================

SELECT
    MONTH("Date") AS month_number,
    MONTHNAME("Date") AS month_name,
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY
    MONTH("Date"),
    MONTHNAME("Date")
ORDER BY month_number;


-- ============================================================
-- 32. Monthly Completed Ride Trend
-- ============================================================

SELECT
    MONTH("Date") AS month_number,
    MONTHNAME("Date") AS month_name,
    COUNT(*) AS completed_rides
FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    MONTH("Date"),
    MONTHNAME("Date")
ORDER BY month_number;


-- ============================================================
-- 33. Monthly Booking Value Trend
-- Completed rides only
-- ============================================================

SELECT
    MONTH("Date") AS month_number,
    MONTHNAME("Date") AS month_name,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    MONTH("Date"),
    MONTHNAME("Date")
ORDER BY month_number;


-- ============================================================
-- 34. Monthly Completion Rate
-- ============================================================

SELECT
    MONTH("Date") AS month_number,
    MONTHNAME("Date") AS month_name,

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate

FROM uber_bookings
GROUP BY
    MONTH("Date"),
    MONTHNAME("Date")
ORDER BY month_number;


-- ============================================================
-- 35. Day-of-Week Booking Performance
-- ============================================================

SELECT
    DAYOFWEEK("Date") AS day_number,
    DAYNAME("Date") AS day_name,

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides

FROM uber_bookings
GROUP BY
    DAYOFWEEK("Date"),
    DAYNAME("Date")
ORDER BY day_number;


-- ============================================================
-- 36. Day-of-Week Booking Value
-- ============================================================

SELECT
    DAYOFWEEK("Date") AS day_number,
    DAYNAME("Date") AS day_name,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    DAYOFWEEK("Date"),
    DAYNAME("Date")
ORDER BY day_number;


-- ============================================================
-- 37. Hourly Booking Demand
-- ============================================================

SELECT
    HOUR("Time") AS booking_hour,
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY HOUR("Time")
ORDER BY booking_hour;


-- ============================================================
-- 38. Peak Booking Hours
-- ============================================================

SELECT
    HOUR("Time") AS booking_hour,
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY HOUR("Time")
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 39. Booking Value by Hour
-- Completed rides only
-- ============================================================

SELECT
    HOUR("Time") AS booking_hour,

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY HOUR("Time")
ORDER BY total_booking_value DESC
LIMIT 10;


-- ============================================================
-- 40. Highest Booking Value Rides
-- ============================================================

SELECT
    "Booking ID",
    "Date",
    "Time",
    "Vehicle Type",
    "Pickup Location",
    "Drop Location",

    TRY_CAST(
        "Booking Value" AS DOUBLE
    ) AS booking_value,

    TRY_CAST(
        "Ride Distance" AS DOUBLE
    ) AS ride_distance

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
ORDER BY booking_value DESC
LIMIT 10;


-- ============================================================
-- 41. Overall Day 2 KPI Summary
-- ============================================================

SELECT
    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN TRY_CAST("Booking Value" AS DOUBLE)
                ELSE 0
            END
        ),
        2
    ) AS completed_booking_value

FROM uber_bookings;

-- ============================================================
-- Uber Ride Bookings Analytics
-- Day 3: Vehicle & Location Analytics
-- ============================================================


-- ============================================================
-- 42. Booking Demand by Vehicle Type
-- ============================================================

SELECT
    "Vehicle Type",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Vehicle Type"
ORDER BY total_bookings DESC;


-- ============================================================
-- 43. Completed Rides by Vehicle Type
-- ============================================================

SELECT
    "Vehicle Type",
    COUNT(*) AS completed_rides
FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Vehicle Type"
ORDER BY completed_rides DESC;


-- ============================================================
-- 44. Ride Distance by Vehicle Type
-- Completed rides only
-- ============================================================

SELECT
    "Vehicle Type",
    COUNT(*) AS completed_rides,

    ROUND(
        AVG(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS average_ride_distance,

    ROUND(
        SUM(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS total_ride_distance

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Vehicle Type"
ORDER BY total_ride_distance DESC;


-- ============================================================
-- 45. Average Booking Value per KM by Vehicle Type
-- Completed rides only
-- ============================================================

SELECT
    "Vehicle Type",

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE))
        /
        NULLIF(
            SUM(TRY_CAST("Ride Distance" AS DOUBLE)),
            0
        ),
        2
    ) AS booking_value_per_km

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Vehicle Type"
ORDER BY booking_value_per_km DESC;


-- ============================================================
-- 46. Top 10 Pickup Locations
-- ============================================================

SELECT
    "Pickup Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Pickup Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 47. Top 10 Pickup Locations by Completed Rides
-- ============================================================

SELECT
    "Pickup Location",
    COUNT(*) AS completed_rides
FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Pickup Location"
ORDER BY completed_rides DESC
LIMIT 10;


-- ============================================================
-- 48. Top 10 Drop Locations
-- ============================================================

SELECT
    "Drop Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY "Drop Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 49. Top 10 Drop Locations by Completed Rides
-- ============================================================

SELECT
    "Drop Location",
    COUNT(*) AS completed_rides
FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Drop Location"
ORDER BY completed_rides DESC
LIMIT 10;


-- ============================================================
-- 50. Top 10 Pickup Locations by Booking Value
-- Completed rides only
-- ============================================================

SELECT
    "Pickup Location",

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Pickup Location"
ORDER BY total_booking_value DESC
LIMIT 10;


-- ============================================================
-- 51. Top 10 Drop Locations by Booking Value
-- Completed rides only
-- ============================================================

SELECT
    "Drop Location",

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY "Drop Location"
ORDER BY total_booking_value DESC
LIMIT 10;


-- ============================================================
-- 52. Most Popular Pickup-Drop Routes
-- ============================================================

SELECT
    "Pickup Location",
    "Drop Location",
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY
    "Pickup Location",
    "Drop Location"
ORDER BY total_bookings DESC
LIMIT 10;


-- ============================================================
-- 53. Most Popular Completed Routes
-- ============================================================

SELECT
    "Pickup Location",
    "Drop Location",
    COUNT(*) AS completed_rides
FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    "Pickup Location",
    "Drop Location"
ORDER BY completed_rides DESC
LIMIT 10;


-- ============================================================
-- 54. Highest-Value Routes
-- Completed rides only
-- ============================================================

SELECT
    "Pickup Location",
    "Drop Location",

    COUNT(*) AS completed_rides,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    "Pickup Location",
    "Drop Location"
ORDER BY total_booking_value DESC
LIMIT 10;


-- ============================================================
-- 55. Longest Average-Distance Routes
-- Minimum 5 completed rides to avoid one-off routes
-- ============================================================

SELECT
    "Pickup Location",
    "Drop Location",

    COUNT(*) AS completed_rides,

    ROUND(
        AVG(TRY_CAST("Ride Distance" AS DOUBLE)),
        2
    ) AS average_ride_distance

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
GROUP BY
    "Pickup Location",
    "Drop Location"
HAVING COUNT(*) >= 5
ORDER BY average_ride_distance DESC
LIMIT 10;


-- ============================================================
-- 56. Pickup Location Completion Performance
-- Minimum 500 bookings for meaningful comparison
-- ============================================================

SELECT
    "Pickup Location",

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate

FROM uber_bookings
GROUP BY "Pickup Location"
HAVING COUNT(*) >= 500
ORDER BY completion_rate DESC
LIMIT 10;


-- ============================================================
-- 57. Pickup Locations with Lowest Completion Rates
-- Minimum 500 bookings
-- ============================================================

SELECT
    "Pickup Location",

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate

FROM uber_bookings
GROUP BY "Pickup Location"
HAVING COUNT(*) >= 500
ORDER BY completion_rate ASC
LIMIT 10;


-- ============================================================
-- 58. Distance Categories
-- Completed rides only
-- ============================================================

SELECT
    CASE
        WHEN TRY_CAST("Ride Distance" AS DOUBLE) <= 10
            THEN 'Short (1-10 km)'

        WHEN TRY_CAST("Ride Distance" AS DOUBLE) <= 25
            THEN 'Medium (11-25 km)'

        WHEN TRY_CAST("Ride Distance" AS DOUBLE) <= 40
            THEN 'Long (26-40 km)'

        ELSE 'Very Long (41-50 km)'
    END AS distance_category,

    COUNT(*) AS completed_rides,

    ROUND(
        AVG(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS average_booking_value,

    ROUND(
        SUM(TRY_CAST("Booking Value" AS DOUBLE)),
        2
    ) AS total_booking_value

FROM uber_bookings
WHERE "Booking Status" = 'Completed'
  AND TRY_CAST("Ride Distance" AS DOUBLE) IS NOT NULL
GROUP BY distance_category
ORDER BY
    MIN(TRY_CAST("Ride Distance" AS DOUBLE));


-- ============================================================
-- 59. Vehicle Type Ranking by Booking Value
-- Window Function
-- ============================================================

WITH vehicle_performance AS (

    SELECT
        "Vehicle Type",

        COUNT(*) AS completed_rides,

        ROUND(
            SUM(TRY_CAST("Booking Value" AS DOUBLE)),
            2
        ) AS total_booking_value

    FROM uber_bookings
    WHERE "Booking Status" = 'Completed'
    GROUP BY "Vehicle Type"
)

SELECT
    "Vehicle Type",
    completed_rides,
    total_booking_value,

    RANK() OVER (
        ORDER BY total_booking_value DESC
    ) AS booking_value_rank

FROM vehicle_performance
ORDER BY booking_value_rank;


-- ============================================================
-- 60. Pickup Location Ranking by Completed Booking Value
-- Window Function
-- ============================================================

WITH location_performance AS (

    SELECT
        "Pickup Location",

        COUNT(*) AS completed_rides,

        ROUND(
            SUM(TRY_CAST("Booking Value" AS DOUBLE)),
            2
        ) AS total_booking_value

    FROM uber_bookings
    WHERE "Booking Status" = 'Completed'
    GROUP BY "Pickup Location"
),

ranked_locations AS (

    SELECT
        "Pickup Location",
        completed_rides,
        total_booking_value,

        RANK() OVER (
            ORDER BY total_booking_value DESC
        ) AS location_rank

    FROM location_performance
)

SELECT *
FROM ranked_locations
WHERE location_rank <= 10
ORDER BY location_rank;


-- ============================================================
-- 61. Day 3 Vehicle Summary
-- ============================================================

SELECT
    "Vehicle Type",

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN "Booking Status" = 'Completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_rides,

    ROUND(
        AVG(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN TRY_CAST("Ride Distance" AS DOUBLE)
            END
        ),
        2
    ) AS average_completed_distance,

    ROUND(
        SUM(
            CASE
                WHEN "Booking Status" = 'Completed'
                THEN TRY_CAST("Booking Value" AS DOUBLE)
                ELSE 0
            END
        ),
        2
    ) AS completed_booking_value

FROM uber_bookings
GROUP BY "Vehicle Type"
ORDER BY completed_booking_value DESC;