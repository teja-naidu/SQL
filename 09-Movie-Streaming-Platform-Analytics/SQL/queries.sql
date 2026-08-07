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

-- ==========================================================
-- Day 4 - Streaming Platform & Audience Analytics
-- ==========================================================

-- Top 15 Streaming Provider Combinations
SELECT
Streaming_On,
COUNT(*) AS total_movies
FROM movies
WHERE Streaming_On IS NOT NULL
GROUP BY Streaming_On
ORDER BY total_movies DESC
LIMIT 15;

-- Average Custom Score by Streaming Provider Combination
SELECT
Streaming_On,
COUNT(*) AS total_movies,
ROUND(AVG(Custom_Score),2) AS average_custom_score
FROM movies
WHERE Streaming_On IS NOT NULL
GROUP BY Streaming_On
HAVING COUNT(*) >= 3
ORDER BY average_custom_score DESC
LIMIT 15;

-- Audience vs Critic Rating Difference
SELECT
Title,
Year,
Audience_Rating,
Critic_Rating_RT,
ROUND(Audience_Rating - Critic_Rating_RT,2) AS rating_difference
FROM movies
ORDER BY rating_difference DESC
LIMIT 15;

-- Critics Rated Higher than Audience
SELECT
Title,
Year,
Audience_Rating,
Critic_Rating_RT,
ROUND(Critic_Rating_RT - Audience_Rating,2) AS critic_difference
FROM movies
ORDER BY critic_difference DESC
LIMIT 15;

-- Average Ratings Across Platforms
SELECT
ROUND(AVG(IMDb_10),2) AS avg_imdb_rating,
ROUND(AVG(Metacritic),2) AS avg_metacritic,
ROUND(AVG(Critic_Rating_RT),2) AS avg_rt_critic,
ROUND(AVG(Audience_Rating),2) AS avg_rt_audience,
ROUND(AVG(Custom_Score),2) AS avg_custom_score
FROM movies;

-- IMDb Vote Categories
SELECT
CASE
    WHEN IMDb_Votes >= 2000000 THEN '2M+ Votes'
    WHEN IMDb_Votes >= 1000000 THEN '1M - 2M Votes'
    WHEN IMDb_Votes >= 500000 THEN '500K - 1M Votes'
    WHEN IMDb_Votes >= 100000 THEN '100K - 500K Votes'
    ELSE 'Below 100K'
END AS vote_category,
COUNT(*) AS total_movies
FROM movies
GROUP BY vote_category
ORDER BY total_movies DESC;

-- Top Audience Favorites
SELECT
Title,
Year,
Audience_Rating,
IMDb_Votes
FROM movies
ORDER BY Audience_Rating DESC, IMDb_Votes DESC
LIMIT 15;

-- Most Critically Acclaimed Movies
SELECT
Title,
Year,
Metacritic,
Critic_Rating_RT,
Custom_Score
FROM movies
ORDER BY Metacritic DESC, Critic_Rating_RT DESC
LIMIT 15;

-- Highest Rated Movies with More Than 1 Million IMDb Votes
SELECT
Title,
Year,
IMDb_Votes,
IMDb_10,
Custom_Score
FROM movies
WHERE IMDb_Votes >= 1000000
ORDER BY Custom_Score DESC
LIMIT 15;

-- Movies Available on Multiple Streaming Platforms
SELECT
Title,
Year,
Streaming_On
FROM movies
WHERE Streaming_On LIKE '%,%'
ORDER BY Custom_Score DESC
LIMIT 20;

-- ==========================================================
-- Day 5 - Advanced Analytics & Business Intelligence
-- ==========================================================

-- Top Movie for Each Director (Window Function)
WITH ranked_movies AS
(
SELECT
Director,
Title,
Year,
Custom_Score,
ROW_NUMBER() OVER
(
PARTITION BY Director
ORDER BY Custom_Score DESC
) AS movie_rank
FROM movies
WHERE Director IS NOT NULL
)

SELECT
Director,
Title,
Year,
Custom_Score
FROM ranked_movies
WHERE movie_rank = 1
ORDER BY Custom_Score DESC
LIMIT 20;

------------------------------------------------------------

-- Rank Movies by IMDb Rating
SELECT
Title,
Year,
IMDb_10,
RANK() OVER(ORDER BY IMDb_10 DESC) AS imdb_rank
FROM movies
LIMIT 25;

------------------------------------------------------------

-- Dense Rank by Custom Score
SELECT
Title,
Year,
Custom_Score,
DENSE_RANK() OVER
(
ORDER BY Custom_Score DESC
) AS custom_rank
FROM movies
LIMIT 25;

------------------------------------------------------------

-- Movies Quartile Based on IMDb Votes
SELECT
Title,
IMDb_Votes,
NTILE(4) OVER
(
ORDER BY IMDb_Votes DESC
) AS popularity_quartile
FROM movies
LIMIT 30;

------------------------------------------------------------

-- Highest Rated Movie for Each Language
WITH language_rank AS
(
SELECT
Language,
Title,
Custom_Score,
ROW_NUMBER() OVER
(
PARTITION BY Language
ORDER BY Custom_Score DESC
) AS rn
FROM movies
)

SELECT
Language,
Title,
Custom_Score
FROM language_rank
WHERE rn=1
ORDER BY Custom_Score DESC;

------------------------------------------------------------

-- Production Company Ranking
SELECT
Production,
COUNT(*) Total_Movies,
ROUND(AVG(Custom_Score),2) Avg_Custom_Score,
RANK() OVER
(
ORDER BY AVG(Custom_Score) DESC
) Production_Rank
FROM movies
WHERE Production IS NOT NULL
GROUP BY Production
HAVING COUNT(*)>=3
ORDER BY Production_Rank
LIMIT 20;

------------------------------------------------------------

-- Director Ranking
SELECT
Director,
COUNT(*) Total_Movies,
ROUND(AVG(IMDb_10),2) Avg_IMDb,
DENSE_RANK() OVER
(
ORDER BY AVG(IMDb_10) DESC
) Director_Rank
FROM movies
WHERE Director IS NOT NULL
GROUP BY Director
HAVING COUNT(*)>=3
ORDER BY Director_Rank
LIMIT 20;

------------------------------------------------------------

-- Movies Released After 2000 With IMDb Above Average
SELECT
Title,
Year,
IMDb_10
FROM movies
WHERE Year>=2000
AND IMDb_10 >
(
SELECT AVG(IMDb_10)
FROM movies
)
ORDER BY IMDb_10 DESC;

------------------------------------------------------------

-- Movies With Above Average Custom Score
SELECT
Title,
Year,
Genre,
Custom_Score
FROM movies
WHERE Custom_Score >
(
SELECT AVG(Custom_Score)
FROM movies
)
ORDER BY Custom_Score DESC
LIMIT 30;

------------------------------------------------------------

-- Top 20 Most Consistent Movies Across Rating Platforms
SELECT
Title,
Year,
IMDb_10,
Metacritic,
Critic_Rating_RT,
Audience_Rating,
Custom_Score
FROM movies
ORDER BY Custom_Score DESC,
IMDb_10 DESC,
Metacritic DESC
LIMIT 20;