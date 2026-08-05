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

-- ==========================================================
-- Day 2 - Movie Ratings & Genre Analytics
-- ==========================================================

-- Top 10 Highest Rated Movies by Custom Score
SELECT
Rank,
Title,
Year,
Custom_Score
FROM movies
ORDER BY Custom_Score DESC
LIMIT 10;

-- Top 10 Highest IMDb Rated Movies
SELECT
Title,
Year,
IMDb_10
FROM movies
ORDER BY IMDb_10 DESC, IMDb_Votes DESC
LIMIT 10;

-- Top 10 Most Popular Movies (IMDb Votes)
SELECT
Title,
Year,
IMDb_Votes
FROM movies
ORDER BY IMDb_Votes DESC
LIMIT 10;

-- Genre Distribution
SELECT
Genre,
COUNT(*) AS total_movies
FROM movies
GROUP BY Genre
ORDER BY total_movies DESC
LIMIT 15;

-- Average IMDb Rating by Genre
SELECT
Genre,
ROUND(AVG(IMDb_10),2) AS average_imdb_rating
FROM movies
GROUP BY Genre
HAVING COUNT(*) >= 3
ORDER BY average_imdb_rating DESC;

-- Average Custom Score by Genre
SELECT
Genre,
ROUND(AVG(Custom_Score),2) AS average_custom_score
FROM movies
GROUP BY Genre
HAVING COUNT(*) >= 3
ORDER BY average_custom_score DESC;

-- Genre with Highest Audience Rating
SELECT
Genre,
ROUND(AVG(Audience_Rating),2) AS average_audience_rating
FROM movies
GROUP BY Genre
HAVING COUNT(*) >= 3
ORDER BY average_audience_rating DESC;

-- Top 15 Movies by Audience Rating
SELECT
Title,
Year,
Audience_Rating
FROM movies
ORDER BY Audience_Rating DESC
LIMIT 15;

-- Top 15 Movies by Rotten Tomatoes Critic Rating
SELECT
Title,
Year,
Critic_Rating_RT
FROM movies
ORDER BY Critic_Rating_RT DESC
LIMIT 15;

-- Top 15 Movies by Metacritic Score
SELECT
Title,
Year,
Metacritic
FROM movies
ORDER BY Metacritic DESC
LIMIT 15;


-- ==========================================================
-- Day 3 - Directors, Production & Language Analytics
-- ==========================================================

-- Top 15 Directors by Number of Movies
SELECT
Director,
COUNT(*) AS total_movies
FROM movies
WHERE Director IS NOT NULL
GROUP BY Director
ORDER BY total_movies DESC
LIMIT 15;

-- Top 15 Production Companies
SELECT
Production,
COUNT(*) AS total_movies
FROM movies
WHERE Production IS NOT NULL
GROUP BY Production
ORDER BY total_movies DESC
LIMIT 15;

-- Top Languages
SELECT
Language,
COUNT(*) AS total_movies
FROM movies
GROUP BY Language
ORDER BY total_movies DESC;

-- Average IMDb Rating by Director
SELECT
Director,
COUNT(*) AS total_movies,
ROUND(AVG(IMDb_10),2) AS average_imdb_rating
FROM movies
WHERE Director IS NOT NULL
GROUP BY Director
HAVING COUNT(*) >= 3
ORDER BY average_imdb_rating DESC
LIMIT 15;

-- Average Custom Score by Production Company
SELECT
Production,
COUNT(*) AS total_movies,
ROUND(AVG(Custom_Score),2) AS average_custom_score
FROM movies
WHERE Production IS NOT NULL
GROUP BY Production
HAVING COUNT(*) >= 3
ORDER BY average_custom_score DESC
LIMIT 15;

-- Average Custom Score by Language
SELECT
Language,
COUNT(*) AS total_movies,
ROUND(AVG(Custom_Score),2) AS average_custom_score
FROM movies
GROUP BY Language
HAVING COUNT(*) >= 3
ORDER BY average_custom_score DESC;

-- Movie Releases by Year
SELECT
Year,
COUNT(*) AS total_movies
FROM movies
GROUP BY Year
ORDER BY Year;

-- Top 20 Movies Ranked by IMDb Votes
SELECT
ROW_NUMBER() OVER(ORDER BY IMDb_Votes DESC) AS popularity_rank,
Title,
Year,
IMDb_Votes
FROM movies
LIMIT 20;

-- Top Movie for Each Decade (Based on Custom Score)
WITH ranked_movies AS
(
SELECT
FLOOR(Year/10)*10 AS decade,
Title,
Year,
Custom_Score,
ROW_NUMBER() OVER(
PARTITION BY FLOOR(Year/10)
ORDER BY Custom_Score DESC
) AS rank_num
FROM movies
)

SELECT
decade,
Title,
Year,
Custom_Score
FROM ranked_movies
WHERE rank_num = 1
ORDER BY decade;