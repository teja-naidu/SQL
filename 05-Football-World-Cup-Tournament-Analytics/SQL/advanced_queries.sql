-- ==========================================================
-- SQL Project 5 - Football World Cup Tournament Analytics
-- Day 4 - Advanced SQL Analytics
-- ==========================================================

-- ----------------------------------------------------------
-- Query 1: Top Teams by Total Goals
-- ----------------------------------------------------------

WITH team_goals AS
(
    SELECT
        home_team_id AS team_id,
        home_score AS goals
    FROM matches

    UNION ALL

    SELECT
        away_team_id,
        away_score
    FROM matches
)

SELECT
    t.team_name,
    SUM(goals) AS total_goals
FROM team_goals tg
JOIN teams t
ON tg.team_id = t.team_id
GROUP BY t.team_name
ORDER BY total_goals DESC
LIMIT 5;

-- ----------------------------------------------------------
-- Query 2: Team Ranking by Goal Difference
-- ----------------------------------------------------------

WITH goal_difference AS
(
    SELECT
        team_name,
        SUM(goals_for) goals_for,
        SUM(goals_against) goals_against,
        SUM(goals_for-goals_against) goal_difference
    FROM
    (
        SELECT
            t.team_name,
            m.home_score goals_for,
            m.away_score goals_against
        FROM matches m
        JOIN teams t
        ON m.home_team_id=t.team_id

        UNION ALL

        SELECT
            t.team_name,
            m.away_score,
            m.home_score
        FROM matches m
        JOIN teams t
        ON m.away_team_id=t.team_id
    ) x
    GROUP BY team_name
)

SELECT
    team_name,
    goal_difference,
    RANK() OVER(ORDER BY goal_difference DESC) AS team_rank
FROM goal_difference;

SELECT
    player_name,
    club_team,
    market_value_eur,
    DENSE_RANK() OVER(ORDER BY market_value_eur DESC) AS market_value_rank
FROM squads_and_players;

WITH ranked_players AS
(
SELECT
    player_name,
    position,
    market_value_eur,
    ROW_NUMBER() OVER
    (
        PARTITION BY position
        ORDER BY market_value_eur DESC
    ) rn
FROM squads_and_players
)

SELECT *
FROM ranked_players
WHERE rn=1;

SELECT
    date,
    SUM(home_score+away_score) daily_goals,
    SUM(SUM(home_score+away_score))
    OVER
    (
        ORDER BY date
    ) running_total_goals
FROM matches
GROUP BY date
ORDER BY date;

WITH ranked_players AS
(
SELECT
    player_name,
    position,
    market_value_eur,
    ROW_NUMBER() OVER
    (
        PARTITION BY position
        ORDER BY market_value_eur DESC
    ) rn
FROM squads_and_players
)

SELECT
    player_name,
    position,
    market_value_eur
FROM ranked_players
WHERE rn<=3;

WITH squad_value AS
(
SELECT
    team_id,
    SUM(market_value_eur) squad_value
FROM squads_and_players
GROUP BY team_id
)

SELECT
    t.confederation,
    ROUND(AVG(sv.squad_value),0) average_squad_value
FROM squad_value sv
JOIN teams t
ON sv.team_id=t.team_id
GROUP BY t.confederation
ORDER BY average_squad_value DESC;

WITH stage_matches AS
(
SELECT
    stage_name,
    home_team_name,
    away_team_name,
    home_score+away_score total_goals,
    ROW_NUMBER() OVER
    (
        PARTITION BY stage_name
        ORDER BY home_score+away_score DESC
    ) rn
FROM matches_detailed
)

SELECT
    stage_name,
    home_team_name,
    away_team_name,
    total_goals
FROM stage_matches
WHERE rn=1;

SELECT
    t.team_name,
    ROUND(AVG(possession_pct),2) average_possession,
    RANK() OVER
    (
        ORDER BY AVG(possession_pct) DESC
    ) possession_rank
FROM match_team_stats mts
JOIN teams t
ON mts.team_id=t.team_id
GROUP BY t.team_name;

WITH player_minutes AS
(
SELECT
    player_id,
    SUM(minutes_played) total_minutes
FROM match_lineups
GROUP BY player_id
)

SELECT
    s.player_name,
    pm.total_minutes
FROM player_minutes pm
JOIN squads_and_players s
ON pm.player_id=s.player_id
ORDER BY total_minutes DESC
LIMIT 10;

-- ==========================================================
-- Day 5 - Executive Dashboard & Business Reporting
-- ==========================================================

SELECT
    (SELECT COUNT(*) FROM teams) AS total_teams,
    (SELECT COUNT(*) FROM squads_and_players) AS total_players,
    (SELECT COUNT(*) FROM matches) AS total_matches,
    (SELECT SUM(home_score + away_score) FROM matches) AS total_goals,
    (SELECT COUNT(*) FROM venues) AS total_venues;

WITH team_stats AS
(
    SELECT home_team_id AS team_id,
           home_score AS goals
    FROM matches

    UNION ALL

    SELECT away_team_id,
           away_score
    FROM matches
)

SELECT
    t.team_name,
    ROUND(AVG(goals),2) AS avg_goals_per_match
FROM team_stats ts
JOIN teams t
ON ts.team_id=t.team_id
GROUP BY t.team_name
ORDER BY avg_goals_per_match DESC
LIMIT 5;

SELECT
    v.stadium_name,
    SUM(m.home_score+m.away_score) total_goals
FROM matches m
JOIN venues v
ON m.venue_id=v.venue_id
GROUP BY v.stadium_name
ORDER BY total_goals DESC;

SELECT
    t.confederation,
    ROUND(AVG(mts.possession_pct),2) average_possession
FROM match_team_stats mts
JOIN teams t
ON mts.team_id=t.team_id
GROUP BY t.confederation
ORDER BY average_possession DESC;

SELECT
    s.player_name,
    SUM(ml.minutes_played) total_minutes
FROM match_lineups ml
JOIN squads_and_players s
ON ml.player_id=s.player_id
GROUP BY s.player_name
ORDER BY total_minutes DESC
LIMIT 10;

SELECT
    t.team_name,
    ROUND(
        AVG(
            shots_on_target*100.0/NULLIF(total_shots,0)
        ),2
    ) shot_accuracy
FROM match_team_stats mts
JOIN teams t
ON mts.team_id=t.team_id
GROUP BY t.team_name
ORDER BY shot_accuracy DESC;

SELECT
    stage_name,
    ROUND(AVG(home_score+away_score),2) average_goals
FROM matches_detailed
GROUP BY stage_name
ORDER BY average_goals DESC;

SELECT
    t.team_name,
    COUNT(*) total_cards
FROM match_events me
JOIN teams t
ON me.team_id=t.team_id
WHERE event_type IN ('Yellow Card','Red Card')
GROUP BY t.team_name
ORDER BY total_cards DESC;

SELECT
    club_team,
    ROUND(SUM(market_value_eur),0) total_market_value
FROM squads_and_players
GROUP BY club_team
ORDER BY total_market_value DESC
LIMIT 10;

SELECT
    ROUND(AVG(home_score+away_score),2) avg_goals_per_match,
    MAX(home_score+away_score) highest_scoring_match,
    MIN(home_score+away_score) lowest_scoring_match,
    SUM(home_score+away_score) total_goals
FROM matches;