-- ===========================
-- Teams
-- ===========================

CREATE TABLE teams (
    team_id INTEGER,
    team_name VARCHAR,
    fifa_code VARCHAR,
    group_letter VARCHAR,
    confederation VARCHAR,
    fifa_ranking_pre_tournament INTEGER,
    elo_rating INTEGER,
    manager_name VARCHAR
);

-- ===========================
-- Tournament Stages
-- ===========================

CREATE TABLE tournament_stages (
    stage_id INTEGER,
    stage_name VARCHAR,
    is_knockout BOOLEAN
);

-- ===========================
-- Venues
-- ===========================

CREATE TABLE venues (
    venue_id INTEGER,
    stadium_name VARCHAR,
    city VARCHAR,
    country VARCHAR,
    capacity INTEGER,
    latitude DOUBLE,
    longitude DOUBLE,
    elevation_meters INTEGER
);

-- ===========================
-- Referees
-- ===========================

CREATE TABLE referees (
    referee_id INTEGER,
    name VARCHAR,
    country VARCHAR,
    avg_cards_per_game DOUBLE
);

-- ===========================
-- Squads & Players
-- ===========================

CREATE TABLE squads_and_players (
    player_id INTEGER,
    team_id INTEGER,
    player_name VARCHAR,
    position VARCHAR,
    club_team VARCHAR,
    market_value_eur BIGINT,
    caps INTEGER,
    date_of_birth DATE,
    height_cm INTEGER,
    goals INTEGER
);

-- ===========================
-- Matches
-- ===========================

CREATE TABLE matches (
    match_id INTEGER,
    date DATE,
    kickoff_time_utc TIME,
    stage_id INTEGER,
    venue_id INTEGER,
    home_team_id INTEGER,
    away_team_id INTEGER,
    home_score INTEGER,
    away_score INTEGER,
    status VARCHAR,
    home_xg DOUBLE,
    away_xg DOUBLE,
    referee_id INTEGER,
    player_of_the_match_id INTEGER
);

-- ===========================
-- Match Details
-- ===========================

CREATE TABLE matches_detailed (
    match_id INTEGER,
    date DATE,
    kickoff_time_utc TIME,
    stage_name VARCHAR,
    stadium_name VARCHAR,
    city VARCHAR,
    country VARCHAR,
    home_team_name VARCHAR,
    home_fifa_code VARCHAR,
    away_team_name VARCHAR,
    away_fifa_code VARCHAR,
    home_score INTEGER,
    away_score INTEGER,
    status VARCHAR,
    home_xg DOUBLE,
    away_xg DOUBLE,
    home_goalkeeper VARCHAR,
    away_goalkeeper VARCHAR,
    player_of_the_match_name VARCHAR,
    referee_name VARCHAR
);

-- ===========================
-- Match Team Statistics
-- ===========================

CREATE TABLE match_team_stats (
    match_id INTEGER,
    team_id INTEGER,
    possession_pct INTEGER,
    total_shots INTEGER,
    shots_on_target INTEGER,
    corners INTEGER,
    fouls INTEGER,
    offsides INTEGER,
    saves INTEGER,
    player_of_the_match VARCHAR,
    data_source VARCHAR,
    last_updated DATE
);

-- ===========================
-- Match Events
-- ===========================

CREATE TABLE match_events (
    event_id INTEGER,
    match_id INTEGER,
    minute INTEGER,
    event_type VARCHAR,
    team_id INTEGER,
    player_id INTEGER
);

-- ===========================
-- Match Lineups
-- ===========================

CREATE TABLE match_lineups (
    lineup_id INTEGER,
    match_id INTEGER,
    player_id INTEGER,
    team_id INTEGER,
    is_starting_xi BOOLEAN,
    tactical_position VARCHAR,
    minutes_played INTEGER
);