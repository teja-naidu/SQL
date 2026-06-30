COPY teams
FROM 'Dataset/teams.csv'
(HEADER, AUTO_DETECT TRUE);

COPY tournament_stages
FROM 'Dataset/tournament_stages.csv'
(HEADER, AUTO_DETECT TRUE);

COPY venues
FROM 'Dataset/venues.csv'
(HEADER, AUTO_DETECT TRUE);

COPY referees
FROM 'Dataset/referees.csv'
(HEADER, AUTO_DETECT TRUE);

COPY squads_and_players
FROM 'Dataset/squads_and_players.csv'
(HEADER, AUTO_DETECT TRUE);

COPY matches
FROM 'Dataset/matches.csv'
(HEADER, AUTO_DETECT TRUE);

COPY matches_detailed
FROM 'Dataset/matches_detailed.csv'
(HEADER, AUTO_DETECT TRUE);

COPY match_team_stats
FROM 'Dataset/match_team_stats.csv'
(HEADER, AUTO_DETECT TRUE);

COPY match_events
FROM 'Dataset/match_events.csv'
(HEADER, AUTO_DETECT TRUE);

COPY match_lineups
FROM 'Dataset/match_lineups.csv'
(HEADER, AUTO_DETECT TRUE);