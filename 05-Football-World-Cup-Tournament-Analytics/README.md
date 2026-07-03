# Football World Cup Tournament Analytics

## Project Overview

This project analyzes a Football World Cup tournament dataset using SQL to uncover insights into team performance, player statistics, match events, stadium utilization, and overall tournament trends.

The project demonstrates how SQL can be used to transform raw sports data into meaningful business intelligence through data exploration, aggregation, joins, Common Table Expressions (CTEs), window functions, and executive reporting.

---

## Objectives

- Analyze tournament participation and structure
- Evaluate team performance throughout the tournament
- Analyze player statistics and squad market values
- Study match events and playing patterns
- Perform stadium and referee analysis
- Build executive dashboard reports using advanced SQL
- Demonstrate advanced SQL concepts on a normalized relational database

---

## Dataset

The project uses a normalized football tournament dataset consisting of **10 relational tables**.

| Table | Description |
|---------|------------|
| teams | Participating national teams |
| squads_and_players | Player information and squad details |
| matches | Match results and scores |
| matches_detailed | Detailed match information |
| match_team_stats | Team performance statistics |
| match_events | Goals, assists, cards and match events |
| match_lineups | Starting XI and player minutes |
| venues | Stadium information |
| referees | Referee details |
| tournament_stages | Tournament stages |

---

## Project Structure

```
05-Football-World-Cup-Tournament-Analytics/
│
├── Dataset/
│
├── SQL/
│   ├── schema.sql
│   ├── import_data.sql
│   ├── queries.sql
│   └── advanced_queries.sql
│
├── screenshots/
├── insights.md
└── README.md
```

---

## Tools Used

- SQL
- DuckDB
- Git
- GitHub
- Visual Studio Code

---

## SQL Concepts Demonstrated

### SQL Fundamentals

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- CASE WHEN

### Joins

- INNER JOIN
- Multiple Table Joins
- UNION ALL

### Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Running Totals
- Multi-level Aggregations
- Executive Dashboard Queries

---

## Business Questions Solved

### Tournament Overview

- Total participating teams
- Tournament stages
- Stadium analysis
- Confederation analysis
- FIFA ranking analysis

### Match & Team Performance

- Highest scoring matches
- Goal statistics
- Goal difference analysis
- Expected Goals (xG)
- Team possession analysis
- Stadium utilization
- Referee analysis

### Player Analytics

- Position-wise player distribution
- Squad market value analysis
- Club representation
- Match event analysis
- Playing time analysis
- Starting XI analysis

### Executive Dashboard

- Tournament KPIs
- Team performance dashboard
- Stadium performance
- Possession analysis
- Discipline analysis
- Club market value analysis
- Executive business reporting

---

## Project Statistics

- **10 Relational Tables**
- **10 CSV Datasets**
- **50 SQL Queries**
- **30 Business Analytics Queries**
- **20 Advanced SQL Queries**
- **Advanced Business Insights**
- **Executive Dashboard Reports**

---

## Key Insights

- Analyzed performance across **48 national teams**.
- Evaluated **1,248 players** participating in the tournament.
- Analyzed **89 tournament matches** hosted across **16 stadiums**.
- Performed team performance analysis using goals, possession, and expected goals (xG).
- Identified top-performing players based on market value, playing time, and match events.
- Built executive-level dashboard reports using advanced SQL techniques.

Detailed findings are available in the **insights.md** file.

---

## Learning Outcomes

This project strengthened practical knowledge of:

- Relational database analysis
- Data exploration using SQL
- Business-oriented reporting
- Sports analytics
- Window Functions
- Common Table Expressions
- Executive dashboard development
- Advanced SQL problem solving

---

## How to Run the Project

### 1. Clone the repository

```bash
git clone <repository-url>
```

### 2. Open DuckDB

```bash
duckdb football.db
```

### 3. Create database tables

```sql
.read SQL/schema.sql
```

### 4. Import the datasets

```sql
.read SQL/import_data.sql
```

### 5. Execute SQL queries

Run:

- `queries.sql`
- `advanced_queries.sql`

---

## Conclusion

This project demonstrates how SQL can be applied to analyze a real-world football tournament database and generate actionable insights for coaches, analysts, tournament organizers, and decision-makers.

By combining foundational SQL with advanced analytical techniques such as Common Table Expressions (CTEs), Window Functions, and Executive Dashboard Reporting, the project showcases end-to-end SQL capabilities for solving complex business problems using structured data.