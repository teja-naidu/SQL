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

-- ==========================================================
-- Day 2 - Match & Team Performance Analytics
-- ==========================================================

-- ----------------------------------------------------------
-- Query 11: Total Goals Scored in the Tournament
-- Business Question:
-- How many total goals were scored during the tournament?
-- ----------------------------------------------------------

SELECT
    SUM(home_score + away_score) AS total_goals
FROM matches;


-- ----------------------------------------------------------
-- Query 12: Highest Scoring Matches
-- Business Question:
-- Which matches had the highest total goals?
-- ----------------------------------------------------------

SELECT
    md.home_team_name,
    md.away_team_name,
    md.home_score,
    md.away_score,
    (md.home_score + md.away_score) AS total_goals
FROM matches_detailed md
ORDER BY total_goals DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 13: Teams with the Most Goals Scored
-- Business Question:
-- Which teams scored the most goals in the tournament?
-- ----------------------------------------------------------

SELECT
    team_name,
    SUM(goals_scored) AS total_goals
FROM
(
    SELECT
        t.team_name,
        m.home_score AS goals_scored
    FROM matches m
    JOIN teams t
        ON m.home_team_id = t.team_id

    UNION ALL

    SELECT
        t.team_name,
        m.away_score AS goals_scored
    FROM matches m
    JOIN teams t
        ON m.away_team_id = t.team_id
) goals
GROUP BY team_name
ORDER BY total_goals DESC;


-- ----------------------------------------------------------
-- Query 14: Teams with the Best Goal Difference
-- Business Question:
-- Which teams had the best goal difference?
-- ----------------------------------------------------------

SELECT
    team_name,
    SUM(goals_for) AS goals_for,
    SUM(goals_against) AS goals_against,
    SUM(goals_for - goals_against) AS goal_difference
FROM
(
    SELECT
        t.team_name,
        m.home_score AS goals_for,
        m.away_score AS goals_against
    FROM matches m
    JOIN teams t
        ON m.home_team_id = t.team_id

    UNION ALL

    SELECT
        t.team_name,
        m.away_score AS goals_for,
        m.home_score AS goals_against
    FROM matches m
    JOIN teams t
        ON m.away_team_id = t.team_id
) gd
GROUP BY team_name
ORDER BY goal_difference DESC;


-- ----------------------------------------------------------
-- Query 15: Matches Played by Each Team
-- Business Question:
-- How many matches did each team play?
-- ----------------------------------------------------------

SELECT
    t.team_name,
    COUNT(*) AS matches_played
FROM
(
    SELECT home_team_id AS team_id
    FROM matches

    UNION ALL

    SELECT away_team_id
    FROM matches
) mp
JOIN teams t
    ON mp.team_id = t.team_id
GROUP BY t.team_name
ORDER BY matches_played DESC;


-- ----------------------------------------------------------
-- Query 16: Average Goals Per Match
-- Business Question:
-- What is the average number of goals scored per match?
-- ----------------------------------------------------------

SELECT
    ROUND(AVG(home_score + away_score), 2) AS average_goals_per_match
FROM matches;


-- ----------------------------------------------------------
-- Query 17: Top 10 Matches by Expected Goals (xG)
-- Business Question:
-- Which matches had the highest combined expected goals?
-- ----------------------------------------------------------

SELECT
    home_team_name,
    away_team_name,
    ROUND(home_xg + away_xg, 2) AS total_xg
FROM matches_detailed
ORDER BY total_xg DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 18: Stadiums Hosting the Most Matches
-- Business Question:
-- Which stadiums hosted the highest number of matches?
-- ----------------------------------------------------------

SELECT
    v.stadium_name,
    COUNT(*) AS total_matches
FROM matches m
JOIN venues v
    ON m.venue_id = v.venue_id
GROUP BY v.stadium_name
ORDER BY total_matches DESC;


-- ----------------------------------------------------------
-- Query 19: Referees Officiating the Most Matches
-- Business Question:
-- Which referees officiated the highest number of matches?
-- ----------------------------------------------------------

SELECT
    r.name,
    COUNT(*) AS matches_officiated
FROM matches m
JOIN referees r
    ON m.referee_id = r.referee_id
GROUP BY r.name
ORDER BY matches_officiated DESC;


-- ----------------------------------------------------------
-- Query 20: Teams with the Highest Average Ball Possession
-- Business Question:
-- Which teams maintained the highest average possession percentage?
-- ----------------------------------------------------------

SELECT
    t.team_name,
    ROUND(AVG(mts.possession_pct), 2) AS average_possession
FROM match_team_stats mts
JOIN teams t
    ON mts.team_id = t.team_id
GROUP BY t.team_name
ORDER BY average_possession DESC;

-- ==========================================================
-- Day 3 - Player & Match Event Analytics
-- ==========================================================

-- ----------------------------------------------------------
-- Query 21: Players by Playing Position
-- Business Question:
-- How many players belong to each playing position?
-- ----------------------------------------------------------

SELECT
    position,
    COUNT(*) AS total_players
FROM squads_and_players
GROUP BY position
ORDER BY total_players DESC;


-- ----------------------------------------------------------
-- Query 22: Top 10 Most Valuable Players
-- Business Question:
-- Which players have the highest market value?
-- ----------------------------------------------------------

SELECT
    player_name,
    club_team,
    position,
    market_value_eur
FROM squads_and_players
ORDER BY market_value_eur DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 23: Clubs Contributing the Most Players
-- Business Question:
-- Which clubs contributed the highest number of players?
-- ----------------------------------------------------------

SELECT
    club_team,
    COUNT(*) AS total_players
FROM squads_and_players
GROUP BY club_team
ORDER BY total_players DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 24: Average Market Value by Position
-- Business Question:
-- What is the average player market value by position?
-- ----------------------------------------------------------

SELECT
    position,
    ROUND(AVG(market_value_eur),0) AS average_market_value
FROM squads_and_players
GROUP BY position
ORDER BY average_market_value DESC;


-- ----------------------------------------------------------
-- Query 25: Teams with the Highest Total Market Value
-- Business Question:
-- Which national teams have the highest combined squad value?
-- ----------------------------------------------------------

SELECT
    t.team_name,
    ROUND(SUM(s.market_value_eur),0) AS squad_market_value
FROM squads_and_players s
JOIN teams t
ON s.team_id = t.team_id
GROUP BY t.team_name
ORDER BY squad_market_value DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 26: Match Events by Event Type
-- Business Question:
-- How many events of each type occurred during the tournament?
-- ----------------------------------------------------------

SELECT
    event_type,
    COUNT(*) AS total_events
FROM match_events
GROUP BY event_type
ORDER BY total_events DESC;


-- ----------------------------------------------------------
-- Query 27: Players with the Most Match Events
-- Business Question:
-- Which players were involved in the highest number of recorded events?
-- ----------------------------------------------------------

SELECT
    s.player_name,
    COUNT(*) AS total_events
FROM match_events me
JOIN squads_and_players s
ON me.player_id = s.player_id
GROUP BY s.player_name
ORDER BY total_events DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 28: Teams with the Most Match Events
-- Business Question:
-- Which teams were involved in the highest number of match events?
-- ----------------------------------------------------------

SELECT
    t.team_name,
    COUNT(*) AS total_events
FROM match_events me
JOIN teams t
ON me.team_id = t.team_id
GROUP BY t.team_name
ORDER BY total_events DESC;


-- ----------------------------------------------------------
-- Query 29: Average Minutes Played by Position
-- Business Question:
-- What is the average playing time by position?
-- ----------------------------------------------------------

SELECT
    s.position,
    ROUND(AVG(ml.minutes_played),2) AS average_minutes
FROM match_lineups ml
JOIN squads_and_players s
ON ml.player_id = s.player_id
GROUP BY s.position
ORDER BY average_minutes DESC;


-- ----------------------------------------------------------
-- Query 30: Starting XI Players by Team
-- Business Question:
-- Which teams used the most starting XI appearances?
-- ----------------------------------------------------------

SELECT
    t.team_name,
    COUNT(*) AS starting_xi_appearances
FROM match_lineups ml
JOIN teams t
ON ml.team_id = t.team_id
WHERE ml.is_starting_xi = TRUE
GROUP BY t.team_name
ORDER BY starting_xi_appearances DESC;