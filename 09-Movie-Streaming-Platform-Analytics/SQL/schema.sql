-- ==========================================================
-- Movie & Streaming Platform Analytics
-- Schema Creation
-- ==========================================================

CREATE OR REPLACE TABLE movies AS
SELECT *
FROM read_csv_auto('Datasets/top_500_movies.csv');

-- Verify the data
SELECT *
FROM movies
LIMIT 10;