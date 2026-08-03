-- ==========================================================
-- Day 1
-- Dataset Overview
-- ==========================================================

-- Total Movies
SELECT
COUNT(*) AS total_movies
FROM movies;

-- Earliest Release Year
SELECT
MIN(Year) AS earliest_movie
FROM movies;

-- Latest Release Year
SELECT
MAX(Year) AS latest_movie
FROM movies;

-- Average Custom Score
SELECT
ROUND(AVG(Custom_Score),2) AS average_custom_score
FROM movies;

-- Average IMDb Rating
SELECT
ROUND(AVG(IMDb_10),2) AS average_imdb_rating
FROM movies;

-- Average IMDb Votes
SELECT
ROUND(AVG(IMDb_Votes),0) AS average_imdb_votes
FROM movies;

-- Highest IMDb Rating
SELECT
MAX(IMDb_10) AS highest_imdb_rating
FROM movies;

-- Highest Flickmetrix Score
SELECT
MAX(Flickmetrix_Score) AS highest_flickmetrix_score
FROM movies;

-- Total Streaming Providers Listed
SELECT
COUNT(DISTINCT Streaming_On) AS streaming_provider_combinations
FROM movies;

-- Number of Languages
SELECT
COUNT(DISTINCT Language) AS total_languages
FROM movies;

-- Number of Production Companies
SELECT
COUNT(DISTINCT Production) AS total_production_companies
FROM movies;