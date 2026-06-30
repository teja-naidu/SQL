-- ==========================================================
-- SQL Project 5 - Football World Cup Tournament Analytics
-- Day 1 - Tournament Overview Analytics
-- ==========================================================

-- ----------------------------------------------------------
-- Query 1: Total Teams Participating
-- Business Question:
-- How many teams participated in the tournament?
-- ----------------------------------------------------------

SELECT COUNT(*) AS total_teams
FROM teams;


-- ----------------------------------------------------------
-- Query 2: Total Players Registered
-- Business Question:
-- How many players were registered for the tournament?
-- ----------------------------------------------------------

SELECT COUNT(*) AS total_players
FROM squads_and_players;


-- ----------------------------------------------------------
-- Query 3: Total Matches Played
-- Business Question:
-- How many matches were played in the tournament?
-- ----------------------------------------------------------

SELECT COUNT(*) AS total_matches
FROM matches;


-- ----------------------------------------------------------
-- Query 4: Total Tournament Venues
-- Business Question:
-- How many stadiums hosted tournament matches?
-- ----------------------------------------------------------

SELECT COUNT(*) AS total_venues
FROM venues;


-- ----------------------------------------------------------
-- Query 5: Tournament Stages
-- Business Question:
-- What tournament stages were included?
-- ----------------------------------------------------------

SELECT
    stage_name,
    CASE
        WHEN is_knockout = TRUE THEN 'Knockout Stage'
        ELSE 'Group Stage'
    END AS stage_type
FROM tournament_stages;


-- ----------------------------------------------------------
-- Query 6: Teams by Confederation
-- Business Question:
-- Which confederations had the highest participation?
-- ----------------------------------------------------------

SELECT
    confederation,
    COUNT(*) AS total_teams
FROM teams
GROUP BY confederation
ORDER BY total_teams DESC;


-- ----------------------------------------------------------
-- Query 7: Top 10 Highest Ranked Teams
-- Business Question:
-- Which teams entered the tournament with the best FIFA rankings?
-- ----------------------------------------------------------

SELECT
    team_name,
    fifa_code,
    fifa_ranking_pre_tournament,
    elo_rating
FROM teams
ORDER BY fifa_ranking_pre_tournament ASC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 8: Stadium Capacity Ranking
-- Business Question:
-- Rank tournament stadiums by seating capacity.
-- ----------------------------------------------------------

SELECT
    stadium_name,
    city,
    capacity
FROM venues
ORDER BY capacity DESC;


-- ----------------------------------------------------------
-- Query 9: Average FIFA Ranking by Confederation
-- Business Question:
-- Which confederation had the strongest average FIFA ranking?
-- ----------------------------------------------------------

SELECT
    confederation,
    ROUND(AVG(fifa_ranking_pre_tournament), 2) AS average_fifa_ranking
FROM teams
GROUP BY confederation
ORDER BY average_fifa_ranking ASC;


-- ----------------------------------------------------------
-- Query 10: Average Stadium Capacity
-- Business Question:
-- What is the average seating capacity of tournament venues?
-- ----------------------------------------------------------

SELECT
    ROUND(AVG(capacity), 2) AS average_stadium_capacity
FROM venues;