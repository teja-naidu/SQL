# Football World Cup Tournament Analytics - Insights

## Dataset Overview

- Total Teams: 48
- Total Players: 1,248
- Total Matches: 89
- Total Venues: 16
- Tournament Stages: 7

---

## Key Findings

### Tournament Overview

- The tournament features 48 participating national teams.
- A total of 1,248 players are registered across all participating teams.
- The dataset includes 89 completed matches played throughout the tournament.
- Matches were hosted across 16 different stadiums located in multiple host cities.
- The competition consists of 7 tournament stages, including both group and knockout rounds.

### Confederation Analysis

- Teams represent multiple football confederations, providing a diverse international competition.
- Confederation-wise team distribution highlights global participation from Europe, South America, Asia, Africa, North America, and Oceania.
- Average FIFA rankings vary across confederations, indicating differences in overall competitive strength.

### Team Rankings

- The top-ranked teams entered the tournament with strong FIFA rankings and high Elo ratings.
- Comparing FIFA rankings with Elo ratings provides additional insight into each team's recent performance and competitive level.

### Stadium Analysis

- Tournament matches are hosted in stadiums with varying seating capacities.
- Larger venues are primarily allocated for high-profile matches and later tournament stages.
- The average stadium capacity reflects the tournament's ability to accommodate large audiences.

---

## Business Value

Analyzing tournament overview data helps stakeholders:

- Understand tournament scale and participation.
- Evaluate regional representation across football confederations.
- Assess team strength using FIFA and Elo rankings.
- Analyze venue utilization and hosting capacity.
- Build a foundation for deeper match, player, and performance analytics in subsequent analysis.

## Match and Team Performance Analysis

### Goal Statistics

- A total of **216 goals** were scored across 89 matches, averaging **2.96 goals per match**.
- The highest-scoring match was **Germany vs Curaçao**, ending with an **8-goal thriller (7–1)**.
- Several matches featured six or more total goals, highlighting the tournament's attacking style of play.

### Team Performance

- Germany, France, and the Netherlands finished among the tournament's highest-scoring teams with **10 goals each**.
- France recorded the best overall goal difference (**+8**), demonstrating both strong attacking and defensive performances.
- Most participating teams played between **3 and 5 matches**, depending on how far they progressed in the tournament.

### Expected Goals (xG)

- Germany vs Curaçao also recorded the highest combined expected goals (xG), indicating a match with numerous high-quality scoring opportunities.
- Comparing xG with actual goals provides deeper insight into finishing efficiency and attacking effectiveness.

### Venue Analysis

- **MetLife Stadium (New York/New Jersey)** hosted the highest number of matches during the tournament.
- Match distribution across venues reflects effective utilization of stadium infrastructure throughout the competition.

### Referee Analysis

- Match officiating responsibilities were distributed evenly among referees, with several officials overseeing six matches each.
- This balanced allocation helps maintain fairness and consistency throughout the tournament.

### Possession Analysis

- Spain recorded the highest average ball possession (**70.5%**), reflecting a possession-oriented playing style.
- Several top-performing teams consistently maintained possession above 55%, indicating strong midfield control and tactical discipline.

## Player and Match Event Analysis

### Player Distribution

- The tournament features 1,248 registered players across four primary playing positions.
- Defenders make up the largest group with **421 players**, followed by **369 midfielders**, **313 forwards**, and **145 goalkeepers**.
- The squad composition highlights the importance of defensive depth across participating teams.

### Market Value Analysis

- **Lamine Yamal** and **Erling Haaland** are the highest-valued players in the tournament, each with a market value of **€200 million**.
- **France** possesses the highest overall squad market value, followed by **England**, **Spain**, and **Portugal**.
- Among all positions, **forwards** have the highest average market value, reflecting the premium placed on attacking talent in modern football.

### Club Representation

- **Manchester City FC** contributed the highest number of players to the tournament, followed by **FC Bayern München** and **Paris Saint-Germain**.
- Several elite European clubs supplied a significant portion of the tournament's player pool, demonstrating their influence on international football.

### Match Event Analysis

- A total of **216 goals** and **146 assists** were recorded during the tournament.
- **Yellow cards (55)** were significantly more common than **red cards (9)**, indicating relatively disciplined gameplay throughout the competition.
- A small number of **VAR reviews** were recorded, highlighting the use of technology in important match decisions.

### Player Performance

- **Kylian Mbappé** and **Lionel Messi** were involved in the highest number of recorded match events, emphasizing their impact on their respective teams.
- Several attacking players consistently contributed through goals and assists during the tournament.

### Team Event Analysis

- **France** recorded the highest number of match events, followed by **Germany** and **Senegal**.
- Higher event involvement generally reflects increased attacking opportunities and overall match activity.

### Playing Time Analysis

- Midfielders recorded the highest average playing time among all positions, followed by defenders.
- This reflects the crucial role of midfield players in controlling possession and maintaining match tempo throughout the tournament.

### Starting XI Analysis

- Most teams maintained a consistent starting lineup across the tournament.
- Teams advancing further in the competition naturally accumulated a higher number of starting XI appearances due to playing more matches.

---

## Advanced SQL Analytics

### Team Ranking Analysis

- Common Table Expressions (CTEs) were used to calculate total goals scored and goal differences for each participating team.
- Window functions enabled dynamic team rankings based on overall tournament goal difference.
- Advanced ranking techniques provided a clear comparison of attacking efficiency and defensive performance across all participating teams.

### Player Market Value Rankings

- Window functions such as **DENSE_RANK()** and **ROW_NUMBER()** were used to rank players based on their market values.
- Position-wise rankings identified the most valuable player in each playing position.
- Top-three player rankings for every position provide additional insight into positional talent distribution across the tournament.

### Tournament Goal Progression

- Running total calculations were used to monitor cumulative goals scored throughout the tournament.
- Goal progression analysis illustrates how scoring trends evolved over different match days.

### Squad Value Analysis

- Squad market values were aggregated using Common Table Expressions and combined with team information to evaluate financial strength by confederation.
- UEFA teams recorded the highest average squad values, highlighting the concentration of elite football talent within European nations.

### Stage-wise Match Analysis

- Advanced ranking functions identified the highest-scoring match within each tournament stage.
- This analysis highlights the most entertaining fixtures across both group and knockout stages.

### Possession Performance

- Teams were ranked according to their average possession percentages using window functions.
- Possession-based rankings provide additional insight into tactical playing styles and ball control throughout the tournament.

### Player Workload Analysis

- Total playing minutes were aggregated across all matches to identify players with the highest tournament workload.
- This analysis highlights players who consistently featured throughout the competition and played key roles for their national teams.

---

## Advanced SQL Concepts Demonstrated

The project incorporates several advanced SQL techniques commonly used in real-world analytics and reporting:

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Running Totals
- Multi-level Aggregations
- Complex JOIN Operations
- Advanced Business Reporting

---

## Executive Dashboard and Business Reporting

### Tournament Summary

- Executive dashboard queries provide a consolidated view of key tournament metrics, including participating teams, registered players, matches played, venues, and total goals scored.
- These summary metrics offer a high-level overview of the tournament and support quick decision-making.

### Team Performance Dashboard

- Teams were evaluated based on their average goals scored per match, providing a more balanced measure of attacking efficiency than total goals alone.
- Average goal metrics help compare team performance regardless of the number of matches played.

### Stadium Performance Analysis

- Stadiums were ranked by the total number of goals scored in matches they hosted.
- This analysis highlights venues associated with the most entertaining and high-scoring matches during the tournament.

### Confederation Performance

- Average possession statistics were analyzed at the confederation level to compare regional playing styles.
- The analysis demonstrates how different football confederations emphasize possession-based or direct attacking strategies.

### Player Workload

- Total playing minutes were aggregated to identify players with the highest workload throughout the tournament.
- These players consistently featured for their national teams and played key roles across multiple matches.

### Shooting Efficiency

- Shot accuracy was calculated using the ratio of shots on target to total shots.
- Teams with higher shooting efficiency demonstrated better finishing ability and created higher-quality scoring opportunities.

### Stage-wise Goal Analysis

- Goal-scoring trends were analyzed across each tournament stage.
- Comparing average goals by stage provides insight into how match intensity and scoring patterns changed throughout the competition.

### Discipline Analysis

- Yellow and red card events were aggregated to evaluate team discipline.
- Teams with higher card counts may indicate a more aggressive playing style or greater defensive pressure during matches.

### Club Market Value

- Club-level market value analysis identified the clubs contributing the highest overall player market value to the tournament.
- Elite European clubs dominate the rankings, reflecting their concentration of world-class football talent.

### Executive Reporting

- Executive summary reports combine tournament KPIs, team performance, player statistics, venue analysis, and financial metrics into a single analytical view.
- These reports support coaches, analysts, tournament organizers, and football executives in evaluating overall tournament performance and identifying strategic insights.

---

## Project Summary

This project demonstrates the use of SQL to analyze a large, normalized football tournament database containing team, player, match, event, venue, and referee information.

Throughout the project, SQL was used to transform raw tournament data into meaningful business insights by applying both foundational and advanced analytical techniques.

### SQL Concepts Demonstrated

- Aggregate Functions
- GROUP BY and HAVING
- CASE WHEN
- INNER JOIN
- UNION ALL
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Running Totals
- Multi-level Aggregations
- Complex JOIN Operations
- Executive Dashboard Reporting

The project showcases how SQL can be used not only for querying data but also for generating business intelligence, performance reports, and executive dashboards that support data-driven decision-making in sports analytics.