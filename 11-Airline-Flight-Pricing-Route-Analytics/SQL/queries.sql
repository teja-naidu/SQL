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


-- =====================================================
-- Day 2: Airline & Ticket Pricing Analysis
-- =====================================================


-- 11. Average Ticket Price by Airline

SELECT
    airline,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY airline
ORDER BY average_ticket_price DESC;


-- 12. Minimum and Maximum Ticket Price by Airline

SELECT
    airline,
    MIN(price) AS minimum_ticket_price,
    MAX(price) AS maximum_ticket_price
FROM flights
GROUP BY airline
ORDER BY maximum_ticket_price DESC;


-- 13. Total Ticket Value by Airline

SELECT
    airline,
    COUNT(*) AS total_flights,
    SUM(price) AS total_ticket_value
FROM flights
GROUP BY airline
ORDER BY total_ticket_value DESC;


-- 14. Airline Share of Total Flights

SELECT
    airline,
    COUNT(*) AS total_flights,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS flight_share_percentage
FROM flights
GROUP BY airline
ORDER BY flight_share_percentage DESC;


-- 15. Airline Price Range

SELECT
    airline,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    MAX(price) - MIN(price) AS price_range
FROM flights
GROUP BY airline
ORDER BY price_range DESC;


-- 16. Flights Priced Above Overall Average

SELECT
    airline,
    COUNT(*) AS flights_above_average
FROM flights
WHERE price > (
    SELECT AVG(price)
    FROM flights
)
GROUP BY airline
ORDER BY flights_above_average DESC;


-- 17. Percentage of Each Airline's Flights Above Overall Average Price

SELECT
    airline,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (
        WHERE price > (SELECT AVG(price) FROM flights)
    ) AS flights_above_average,
    ROUND(
        COUNT(*) FILTER (
            WHERE price > (SELECT AVG(price) FROM flights)
        ) * 100.0 / COUNT(*),
        2
    ) AS above_average_percentage
FROM flights
GROUP BY airline
ORDER BY above_average_percentage DESC;


-- 18. Most Expensive Flight for Each Airline

SELECT
    airline,
    source_city,
    destination_city,
    journey_date,
    price
FROM (
    SELECT
        airline,
        source_city,
        destination_city,
        journey_date,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY airline
            ORDER BY price DESC
        ) AS price_rank
    FROM flights
)
WHERE price_rank = 1
ORDER BY price DESC;


-- 19. Cheapest Flight for Each Airline

SELECT
    airline,
    source_city,
    destination_city,
    journey_date,
    price
FROM (
    SELECT
        airline,
        source_city,
        destination_city,
        journey_date,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY airline
            ORDER BY price ASC
        ) AS price_rank
    FROM flights
)
WHERE price_rank = 1
ORDER BY price ASC;


-- 20. Airline Pricing Compared with Overall Average

WITH overall_price AS (
    SELECT
        AVG(price) AS overall_average_price
    FROM flights
)

SELECT
    f.airline,
    ROUND(AVG(f.price), 2) AS airline_average_price,
    ROUND(o.overall_average_price, 2) AS overall_average_price,
    ROUND(AVG(f.price) - o.overall_average_price, 2) AS price_difference,
    CASE
        WHEN AVG(f.price) > o.overall_average_price
            THEN 'Above Average'
        WHEN AVG(f.price) < o.overall_average_price
            THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS pricing_category
FROM flights f
CROSS JOIN overall_price o
GROUP BY
    f.airline,
    o.overall_average_price
ORDER BY airline_average_price DESC;

-- =====================================================
-- Day 3: Route & Destination Analysis
-- =====================================================


-- 21. Most Popular Source-Destination Routes

SELECT
    source_city,
    destination_city,
    COUNT(*) AS total_flights
FROM flights
GROUP BY source_city, destination_city
ORDER BY total_flights DESC
LIMIT 10;


-- 22. Average Ticket Price by Route

SELECT
    source_city,
    destination_city,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY source_city, destination_city
HAVING COUNT(*) >= 20
ORDER BY average_ticket_price DESC
LIMIT 10;


-- 23. Most Affordable Routes by Average Ticket Price

SELECT
    source_city,
    destination_city,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY source_city, destination_city
HAVING COUNT(*) >= 20
ORDER BY average_ticket_price ASC
LIMIT 10;


-- 24. Source Cities by Average Ticket Price

SELECT
    source_city,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY source_city
ORDER BY average_ticket_price DESC;


-- 25. Destination Cities by Average Ticket Price

SELECT
    destination_city,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY destination_city
ORDER BY average_ticket_price DESC;


-- 26. Direct vs Connecting Flight Distribution

SELECT
    CASE
        WHEN total_stops = 'non-stop'
            THEN 'Direct Flight'
        ELSE 'Connecting Flight'
    END AS flight_type,
    COUNT(*) AS total_flights,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS flight_percentage
FROM flights
GROUP BY flight_type
ORDER BY total_flights DESC;


-- 27. Direct vs Connecting Flight Pricing

SELECT
    CASE
        WHEN total_stops = 'non-stop'
            THEN 'Direct Flight'
        ELSE 'Connecting Flight'
    END AS flight_type,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price,
    MIN(price) AS minimum_ticket_price,
    MAX(price) AS maximum_ticket_price
FROM flights
GROUP BY flight_type
ORDER BY average_ticket_price DESC;


-- 28. Average Ticket Price by Number of Stops

SELECT
    total_stops,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS average_ticket_price
FROM flights
GROUP BY total_stops
ORDER BY average_ticket_price DESC;


-- 29. Most Popular Routes for Each Airline

WITH airline_routes AS (
    SELECT
        airline,
        source_city,
        destination_city,
        COUNT(*) AS total_flights,
        ROW_NUMBER() OVER (
            PARTITION BY airline
            ORDER BY COUNT(*) DESC
        ) AS route_rank
    FROM flights
    GROUP BY
        airline,
        source_city,
        destination_city
)

SELECT
    airline,
    source_city,
    destination_city,
    total_flights
FROM airline_routes
WHERE route_rank = 1
ORDER BY total_flights DESC;


-- 30. Route Price Compared with Overall Average

WITH route_prices AS (
    SELECT
        source_city,
        destination_city,
        COUNT(*) AS total_flights,
        AVG(price) AS route_average_price
    FROM flights
    GROUP BY source_city, destination_city
    HAVING COUNT(*) >= 20
),

overall_price AS (
    SELECT
        AVG(price) AS overall_average_price
    FROM flights
)

SELECT
    r.source_city,
    r.destination_city,
    r.total_flights,
    ROUND(r.route_average_price, 2) AS route_average_price,
    ROUND(o.overall_average_price, 2) AS overall_average_price,
    ROUND(
        r.route_average_price - o.overall_average_price,
        2
    ) AS price_difference,
    CASE
        WHEN r.route_average_price > o.overall_average_price
            THEN 'Above Average'
        WHEN r.route_average_price < o.overall_average_price
            THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS pricing_category
FROM route_prices r
CROSS JOIN overall_price o
ORDER BY ABS(r.route_average_price - o.overall_average_price) DESC
LIMIT 15;