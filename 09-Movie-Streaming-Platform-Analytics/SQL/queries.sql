-- ==========================================================
-- Day 1 - Dataset Exploration
-- ==========================================================

-- Movies by Decade
SELECT
FLOOR(Year / 10) * 10 AS decade,
COUNT(*) AS total_movies
FROM movies
GROUP BY decade
ORDER BY decade;

-- Top 10 Production Companies
SELECT
Production,
COUNT(*) AS total_movies
FROM movies
GROUP BY Production
ORDER BY total_movies DESC
LIMIT 10;

-- Top 10 Languages
SELECT
Language,
COUNT(*) AS total_movies
FROM movies
GROUP BY Language
ORDER BY total_movies DESC
LIMIT 10;

-- Rating Distribution
SELECT
CASE
    WHEN IMDb_10 >= 9 THEN '9.0 - 10'
    WHEN IMDb_10 >= 8 THEN '8.0 - 8.9'
    WHEN IMDb_10 >= 7 THEN '7.0 - 7.9'
    ELSE 'Below 7'
END AS rating_range,
COUNT(*) AS total_movies
FROM movies
GROUP BY rating_range
ORDER BY total_movies DESC;

-- Average Movie Release Year
SELECT
ROUND(AVG(Year),0) AS average_release_year
FROM movies;

-- Movies Available on Multiple Streaming Platforms
SELECT
COUNT(*) AS multi_platform_movies
FROM movies
WHERE Streaming_On LIKE '%,%';