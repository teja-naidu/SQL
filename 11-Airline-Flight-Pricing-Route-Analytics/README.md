# ✈️ Airline Flight Pricing & Route Analytics

## 📌 Project Overview

The **Airline Flight Pricing & Route Analytics** project is an end-to-end SQL analytics project designed to explore airline operations, ticket pricing, route demand, flight characteristics, and market positioning.

Using **DuckDB and SQL**, this project analyzes **15,000 flight records** across multiple airlines, cities, routes, departure times, stop categories, and ticket price ranges.

The analysis progresses from dataset exploration and descriptive statistics to advanced business analysis using **CTEs, subqueries, conditional aggregation, regular expressions, ranking functions, and window functions**.

A total of **50 SQL queries** were developed to uncover meaningful insights into airline pricing behavior, route performance, passenger travel patterns, and flight characteristics.

---

## 🎯 Project Objectives

The primary objectives of this project are to:

* Analyze overall flight activity and ticket pricing.
* Compare pricing strategies across airlines.
* Identify high-demand source and destination cities.
* Discover popular, expensive, and affordable routes.
* Compare direct and connecting flight pricing.
* Analyze the relationship between number of stops and airfare.
* Examine yearly, monthly, weekly, and hourly travel patterns.
* Convert flight-duration text into numerical values for analysis.
* Evaluate airline positioning against the overall market average.
* Segment flights into different ticket price categories.
* Identify high-value routes based on total ticket value.
* Rank airlines using multiple performance metrics.
* Produce business-focused insights using advanced SQL techniques.

---

## 📊 Dataset Overview

The dataset contains **15,000 flight records** covering journeys between **2019 and 2025**.

### Dataset Summary

| Metric                |             Value |
| --------------------- | ----------------: |
| Total Flights         |            15,000 |
| Airlines              |                10 |
| Source Cities         |                20 |
| Destination Cities    |                20 |
| Earliest Journey Date |   January 1, 2019 |
| Latest Journey Date   | December 28, 2025 |
| Average Ticket Price  |         ₹9,355.35 |
| Minimum Ticket Price  |            ₹2,502 |
| Maximum Ticket Price  |           ₹17,900 |

### Dataset Columns

The analysis uses the following standardized fields:

* `flight_id`
* `airline`
* `journey_date`
* `source_city`
* `destination_city`
* `route`
* `departure_time`
* `arrival_time`
* `duration`
* `total_stops`
* `additional_info`
* `price`

---

## 🛠️ Tools & Technologies

* **DuckDB** – SQL database engine used for querying and analysis
* **SQL** – Data exploration, transformation, aggregation, and advanced analytics
* **Visual Studio Code** – Development environment
* **Git** – Version control
* **GitHub** – Project hosting and portfolio documentation
* **CSV** – Source dataset format

---

## 📂 Project Structure

```text
11-Airline-Flight-Pricing-Route-Analytics/
│
├── Datasets/
│   └── flights.csv
│
├── SQL/
│   ├── schema.sql
│   └── queries.sql
│
├── insights.md
│
└── README.md
```

---

## 🔍 Analysis Performed

### Dataset Exploration

The initial analysis establishes the overall structure and scale of the dataset by examining:

* Total number of flights
* Number of airlines
* Source and destination city coverage
* Journey date range
* Average, minimum, and maximum ticket prices
* Airline flight distribution
* Source and destination flight volumes
* Flight distribution by number of stops

---

### Airline & Ticket Pricing Analysis

Airline-level analysis evaluates how pricing and flight volume vary across carriers.

The analysis includes:

* Average ticket price by airline
* Minimum and maximum fares
* Airline price ranges
* Total ticket value
* Airline share of total flights
* Flights priced above the overall average
* Percentage of above-average fares
* Cheapest and most expensive flights by airline
* Airline pricing compared with the overall market average

---

### Route & Destination Analysis

Route-level analysis examines demand and pricing differences between source-destination combinations.

Key areas include:

* Most frequently operated routes
* Most expensive routes
* Most affordable routes
* Source-city average pricing
* Destination-city average pricing
* Direct vs connecting flight distribution
* Direct vs connecting flight pricing
* Average ticket price by number of stops
* Most popular routes by airline
* Route pricing compared with the overall market average

Routes used for certain pricing comparisons were required to contain at least **20 flights** to reduce the influence of very small sample sizes.

---

### Time & Flight Duration Analysis

Time-based analysis evaluates whether travel timing and flight duration influence ticket prices.

The analysis covers:

* Flights and fares by year
* Monthly flight and pricing trends
* Day-of-week patterns
* Morning, afternoon, evening, and night departures
* Average ticket price by departure hour
* Flight duration conversion into minutes
* Flight duration categories
* Duration and pricing by number of stops
* Airline pricing by departure period
* Year-over-year ticket price changes

---

### Advanced Business Analysis

The final stage applies advanced SQL techniques to generate business-oriented metrics.

The analysis includes:

* Airline pricing rankings
* Source-city demand rankings
* Destination-city demand rankings
* Ticket price segmentation
* Airline performance by fare segment
* High-value route identification
* Route pricing rankings within source cities
* Airline premium or discount versus the overall market
* Multi-metric airline performance ranking
* Executive airline performance summary

---

## 💡 Key Business Insights

### Airline Market

* **TruJet** operates the highest number of flights with **1,556** records.
* **Akasa Air** has the highest average ticket price at **₹9,478.98**.
* **IndiGo** has the lowest airline-level average fare at **₹9,174.49**.
* Airline flight shares are highly balanced, with each carrier accounting for roughly 9%–10% of the dataset.
* Akasa Air operates at the largest premium to the overall market average at **1.32%**.
* IndiGo operates at the largest discount to the market average at **1.93%**.

---

### Route Demand

* **Raipur → Indore** is the most frequently operated route with **55 flights**.
* **Hyderabad** is the highest-demand source city with **799 departures**.
* **Guwahati** is the highest-demand destination with **814 arrivals**.
* Route-level pricing varies considerably more than airline-level average pricing.

---

### Route Pricing

Among routes with sufficient flight volume:

* **Lucknow → Hyderabad** has the highest average ticket price at **₹10,731.12**.
* **Raipur → Jaipur** has the lowest average ticket price at **₹7,935.49**.
* The substantial difference between these route averages demonstrates the importance of route-level pricing analysis.

---

### Direct vs Connecting Flights

Connecting flights dominate the dataset.

| Flight Type | Flights |  Share | Average Fare |
| ----------- | ------: | -----: | -----------: |
| Connecting  |  11,234 | 74.89% |   ₹10,096.26 |
| Direct      |   3,766 | 25.11% |    ₹7,145.21 |

Connecting flights are significantly more expensive on average than direct flights within this dataset.

---

### Stops & Ticket Pricing

A particularly strong pricing pattern appears when flights are grouped by number of stops.

| Stops    | Average Ticket Price |
| -------- | -------------------: |
| Non-stop |            ₹7,145.21 |
| 1 Stop   |            ₹8,481.81 |
| 2 Stops  |           ₹10,032.82 |
| 3 Stops  |           ₹11,737.15 |

Average fares increase consistently as the number of stops increases.

Interestingly, average flight duration remains close to **500 minutes across all stop categories**, indicating that stop count is a much stronger pricing differentiator than average duration in this dataset.

---

### Time-Based Pricing

* **June** has the highest monthly average fare at **₹9,545.78**.
* **May** has the lowest monthly average fare at **₹9,205.88**.
* **Sunday** has the highest day-of-week average fare at **₹9,436.10**.
* **Tuesday** has the lowest at **₹9,259.31**.
* Flights departing at **7 AM** have the highest hourly average fare at **₹9,711.03**.
* Flights departing at **4 PM** have the lowest hourly average fare at **₹9,095.97**.

Broad departure periods show relatively small pricing differences compared with individual departure hours.

---

### Flight Duration

* Minimum flight duration: **60 minutes**
* Average flight duration: **502.05 minutes**
* Maximum flight duration: **945 minutes**
* Very long flights of 10+ hours represent the largest duration category.

Ticket prices do not consistently increase with flight duration, suggesting that duration alone is not a strong pricing driver within this dataset.

---

### Ticket Price Segmentation

Flights were segmented into four fare categories:

| Price Segment             | Flights |  Share |
| ------------------------- | ------: | -----: |
| Standard (₹5,000–₹9,999)  |   6,986 | 46.57% |
| Premium (₹10,000–₹14,999) |   5,757 | 38.38% |
| Budget (<₹5,000)          |   1,566 | 10.44% |
| High Premium (₹15,000+)   |     691 |  4.61% |

Standard and premium flights together account for **84.95%** of all records.

---

### High-Value Routes

The highest-value qualifying route is:

**Surat → Delhi**

* Total Flights: **53**
* Average Ticket Price: **₹10,258.36**
* Total Ticket Value: **₹543,693**

Other high-value routes include:

* Cochin → Bangalore
* Hyderabad → Guwahati
* Kolkata → Mumbai
* Bangalore → Hyderabad

This demonstrates that route value depends on the combination of **flight volume and ticket price**.

---

## 🏆 Dataset-Specific Airline Performance Ranking

A combined ranking was created using:

1. Flight volume rank
2. Average ticket price rank
3. Total ticket value rank

The three rankings were added to produce a **combined rank score**, where a lower score indicates stronger combined performance across these metrics.

| Airline       | Combined Rank Score |
| ------------- | ------------------: |
| TruJet        |                   5 |
| SpiceJet      |                   8 |
| Akasa Air     |                  10 |
| Alliance Air  |                  13 |
| GoAir         |                  16 |
| IndiGo        |                  19 |
| Air India     |                  20 |
| Star Air      |                  21 |
| AirAsia India |                  26 |
| Vistara       |                  27 |

> **Note:** This ranking is a dataset-specific analytical metric based only on flight volume, average fare, and total ticket value. It should not be interpreted as a real-world ranking of airline quality, customer experience, profitability, or operational performance.

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates practical usage of:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* Aggregate functions

  * `COUNT()`
  * `AVG()`
  * `SUM()`
  * `MIN()`
  * `MAX()`
* `COUNT(DISTINCT)`
* `CASE WHEN`
* Subqueries
* Common Table Expressions (`WITH`)
* Conditional aggregation with `FILTER`
* Date functions

  * `YEAR()`
  * `MONTH()`
  * `MONTHNAME()`
  * `DAYNAME()`
  * `HOUR()`
* Regular expressions with `REGEXP_EXTRACT`
* `TRY_CAST`
* `COALESCE`
* Window functions

  * `ROW_NUMBER()`
  * `DENSE_RANK()`
  * `LAG()`
  * `SUM() OVER()`
* Percentage calculations
* Year-over-year comparisons
* Market benchmarking
* Business segmentation
* Multi-metric ranking

---

## 📈 Key Takeaways

The analysis reveals that airline-level flight volume and average pricing are relatively balanced across carriers. Greater pricing variation emerges when flights are analyzed by **route and number of stops**.

One of the strongest findings is the consistent increase in average airfare as the number of stops rises. In contrast, flight duration, broad departure periods, and yearly trends show weaker relationships with ticket pricing.

Route-level analysis also demonstrates that high-value routes are driven by the interaction between **demand and average fare**, rather than either metric independently.

Overall, the project demonstrates how SQL can be used to move from basic dataset exploration to advanced business analysis involving pricing, demand, route economics, segmentation, benchmarking, and ranking.

---

## 🚀 Project Outcome

This project contains **50 SQL analyses** covering:

* Dataset exploration
* Airline performance
* Ticket pricing
* Route demand
* Source and destination analysis
* Direct and connecting flights
* Stop-based pricing
* Flight duration
* Time-based trends
* Fare segmentation
* Market positioning
* Route value
* Advanced ranking and window functions

The project provides a complete SQL analytics workflow from raw CSV data to business-focused insights using **DuckDB and SQL**.