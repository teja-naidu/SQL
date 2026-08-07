# 🎬 Movie & Streaming Platform Analytics

## Project Overview

This project analyzes a curated dataset of **449 top-rated movies** using SQL and DuckDB. The analysis explores movie ratings, genres, directors, production companies, streaming availability, audience engagement, and historical trends to generate meaningful business insights.

The project demonstrates practical SQL skills commonly used by Data Analysts and Business Intelligence professionals.

---

## Dataset Information

- Total Movies: 449
- Analysis Period: 1920 – 2025
- Languages: 27
- Production Companies: 123
- Streaming Provider Combinations: 80

---

## Project Structure

```
09-Movie-Streaming-Platform-Analytics
│
├── Datasets/
├── Resources/
├── SQL/
│   ├── schema.sql
│   ├── queries.sql
│   └── views.sql
│
├── insights.md
└── README.md
```

---

## Topics Covered

- Dataset Exploration
- Movie Ratings Analysis
- Genre Analytics
- Director Performance
- Production Company Analysis
- Language Analytics
- Streaming Platform Analysis
- Audience vs Critic Comparison
- Popularity Analysis
- Business Intelligence
- Window Functions
- Common Table Expressions (CTEs)

---

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- CASE WHEN
- Aggregate Functions
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- Subqueries

---

## Business Insights

- Highest-rated movies across multiple review platforms.
- Genre performance and popularity.
- Director and production company rankings.
- Streaming platform coverage.
- Audience versus critic preferences.
- Language distribution.
- Historical movie trends.
- Popularity segmentation using IMDb votes.

---

## Tools Used

- DuckDB
- SQL
- VS Code
- Git
- GitHub

---

## Dataset Source

The dataset contains the Top 500 Movies ranked using combined critic and audience scores.

The original dataset was collected using a custom Python web scraping script and exported as a CSV. SQL analysis was performed on the cleaned dataset.