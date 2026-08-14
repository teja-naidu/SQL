# 🚗 Uber Ride Bookings Analytics

## 📌 Project Overview

This project analyzes Uber ride booking data using **SQL and DuckDB** to uncover insights into booking performance, revenue, vehicle usage, customer behavior, cancellations, ride distances, locations, and operational efficiency.

The dataset contains **150,000 booking records** covering almost the entire **2024 calendar year**.

The analysis progresses from dataset exploration and data-quality checks to advanced business analytics using **CTEs, window functions, ranking functions, conditional aggregation, segmentation, and time-based analysis**.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Understand overall ride booking performance
- Measure ride completion and cancellation rates
- Analyze completed booking value
- Compare performance across vehicle types
- Identify high-demand pickup and drop locations
- Analyze popular and high-value routes
- Understand ride-distance patterns
- Investigate driver and customer cancellations
- Evaluate driver and customer ratings
- Identify peak booking periods
- Analyze customer booking frequency and retention
- Measure monthly booking and booking-value growth
- Identify high-performing operational segments
- Generate actionable business recommendations

---

## 🛠️ Tools & Technologies

- **SQL**
- **DuckDB**
- **Visual Studio Code**
- **Git**
- **GitHub**

---

## 📂 Project Structure

```text
Uber-Ride-Bookings-Analytics/
│
├── Datasets/
│   └── uber_bookings.csv
│
├── SQL/
│   ├── schema.sql
│   └── queries.sql
│
├── insights.md
├── README.md
└── uber_analytics.db
```

---

## 📊 Dataset Overview

| Metric | Result |
|---|---:|
| Total Records | 150,000 |
| Unique Booking IDs | 148,767 |
| Unique Customers | 148,788 |
| Vehicle Types | 7 |
| Pickup Locations | 176 |
| Drop Locations | 176 |
| Start Date | January 1, 2024 |
| End Date | December 30, 2024 |

### Vehicle Types

The dataset includes seven vehicle categories:

- Auto
- Bike
- Go Mini
- Go Sedan
- Premier Sedan
- Uber XL
- eBike

---

## 📈 Overall Booking Performance

Out of **150,000 booking records**, **93,000 rides were completed**, resulting in an overall completion rate of **62%**.

| Booking Status | Bookings | Percentage |
|---|---:|---:|
| Completed | 93,000 | 62% |
| Cancelled by Driver | 27,000 | 18% |
| Cancelled by Customer | 10,500 | 7% |
| No Driver Found | 10,500 | 7% |
| Incomplete | 9,000 | 6% |

A total of **38% of booking records did not result in a completed ride**, making cancellations and driver availability important operational areas for further improvement.

---

## 💰 Booking Value Analysis

Completed rides generated approximately:

### **47.26 Million in Completed Booking Value**

Key metrics:

- Completed Rides: **93,000**
- Completed Booking Value: **47,260,574**
- Average Completed Booking Value: **508.18**
- Maximum Recorded Booking Value: **4,277**

The analysis focuses primarily on completed rides when evaluating booking value to avoid including unsuccessful bookings that did not generate completed ride value.

---

## 🚘 Vehicle Performance

Auto was the strongest vehicle category by both booking volume and completed booking value.

| Vehicle Type | Completed Booking Value | Contribution |
|---|---:|---:|
| Auto | 11,727,615 | 24.81% |
| Go Mini | 9,411,418 | 19.91% |
| Go Sedan | 8,538,560 | 18.07% |
| Bike | 7,144,913 | 15.12% |
| Premier Sedan | 5,733,655 | 12.13% |
| eBike | 3,298,157 | 6.98% |
| Uber XL | 1,406,256 | 2.98% |

### Key Vehicle Insights

- **Auto** contributed the largest share of completed booking value at **24.81%**.
- Auto, Go Mini, and Go Sedan together generated **62.80%** of completed booking value.
- **Uber XL** achieved the highest completion rate at approximately **62.55%**.
- **Go Sedan** recorded the highest average completed booking value at approximately **512.03**.
- Average completed ride distance remained close to **26 distance units** across all vehicle types.

---

## 💳 Payment Method Analysis

UPI was the dominant payment method among completed rides.

| Payment Method | Completed Rides | Booking Value |
|---|---:|---:|
| UPI | 41,834 | 21,274,591 |
| Cash | 23,114 | 11,756,071 |
| Uber Wallet | 11,206 | 5,669,070 |
| Credit Card | 9,320 | 4,753,767 |
| Debit Card | 7,526 | 3,807,075 |

UPI alone generated approximately **21.27 million** in completed booking value.

---

## 📅 Monthly Performance

Monthly demand remained relatively stable throughout the year.

### Key Monthly Findings

- **July** recorded the highest total booking volume with **12,897 bookings**.
- **March** recorded the highest number of completed rides with **7,954**.
- **March** generated the highest completed booking value at **4,174,900**.
- **April** achieved the highest monthly completion rate at **62.56%**.
- March also recorded the strongest month-over-month completed booking-value growth at approximately **11.13%**.

### Top Months by Completed Booking Value

| Rank | Month | Booking Value |
|---:|---|---:|
| 1 | March | 4,174,900 |
| 2 | October | 4,008,403 |
| 3 | January | 4,001,547 |
| 4 | June | 3,964,298 |
| 5 | July | 3,961,939 |

---

## ⏰ Peak Hour Analysis

Booking activity showed a strong evening demand pattern.

**6 PM was the busiest hour**, recording:

- **12,397 total bookings**
- **7,617 completed rides**
- Approximately **3.91 million in completed booking value**

The period between **5 PM and 7 PM** represented the strongest concentration of booking activity.

### Peak vs Non-Peak Performance

| Period | Total Bookings | Completed Rides | Completion Rate | Booking Value |
|---|---:|---:|---:|---:|
| Peak Hours | 34,488 | 21,275 | 61.69% | 10,826,379 |
| Non-Peak Hours | 115,512 | 71,725 | 62.09% | 36,434,195 |

Peak-hour completion performance was slightly lower than non-peak performance, indicating additional operational pressure during the busiest hours.

---

## 📆 Weekday vs Weekend Performance

| Day Type | Total Bookings | Completion Rate | Avg. Completed Booking Value |
|---|---:|---:|---:|
| Weekday | 107,060 | 61.88% | 448.67 |
| Weekend | 42,940 | 62.31% | 655.51 |

Weekend rides had a slightly higher completion rate and a substantially higher average completed booking value than weekday rides.

---

## 📍 Location Analytics

The dataset contains:

- **176 unique pickup locations**
- **176 unique drop locations**

### High-Demand Locations

- **Khandsa** recorded the highest overall pickup demand with **949 bookings**.
- **Ashram** recorded the highest overall drop demand with **936 bookings**.

### High-Value Locations

- **Barakhamba Road** generated the highest completed booking value among the leading pickup locations at **309,713**.
- **Narsinghpur** generated the highest completed booking value among drop locations at **325,331**.

### Operational Location Performance

Among pickup locations with at least 500 bookings:

- **Welcome** achieved the highest completion rate at **66.27%**.
- **Vinobapuri** recorded the lowest completion rate at **54.68%**.
- **Nehru Place** recorded the highest driver cancellation rate at **21.47%**.
- **Subhash Chowk** combined a strong **65.61% completion rate** with a relatively low **16.01% driver cancellation rate**.

These differences indicate meaningful variation in operational performance across pickup locations.

---

## 🛣️ Route Analysis

The analysis examined:

- Most popular pickup-drop routes
- Most popular completed routes
- Highest-value routes
- Longest recurring routes

Route demand was highly fragmented.

Even the most frequently booked individual route recorded only **17 bookings**, indicating that booking demand is distributed across a large number of pickup-drop combinations.

The analysis also showed that high-value routes are not necessarily the most frequently traveled routes.

---

## 📏 Ride Distance Analysis

Completed rides were divided into four distance segments.

| Distance Category | Completed Rides | Total Booking Value |
|---|---:|---:|
| Short (1–10 km) | 15,524 | 7,813,891 |
| Medium (11–25 km) | 28,983 | 14,743,954 |
| Long (26–40 km) | 29,245 | 14,865,125 |
| Very Long (41–50 km) | 19,248 | 9,837,604 |

### Key Distance Insights

- **Long rides between 26–40 km** generated the highest total booking value.
- Medium-distance rides followed closely.
- Very long rides recorded the highest average booking value.
- Short rides generated the highest booking value per kilometer.
- Booking value per kilometer declined as ride distance increased.

This suggests that longer rides contribute more total value, while shorter rides generate more value relative to distance traveled.

---

## ❌ Cancellation Analysis

Driver cancellations represented the largest unsuccessful booking category.

### Driver Cancellations

- Total Driver Cancellations: **27,000**
- Overall Driver Cancellation Rate: **18%**

The major driver cancellation reasons were distributed relatively evenly across:

- Customer-related issues
- Customer illness
- Personal and vehicle-related issues
- Passenger-capacity issues

### Customer Cancellations

Customer cancellations totaled **10,500 bookings**.

The major reasons included:

- Wrong Address
- Change of plans
- Driver not moving toward pickup location
- Driver asked customer to cancel
- AC not working

Wrong Address was the most common individual customer cancellation reason at approximately **22.50%**.

---

## 🌆 Cancellation Hotspots

Cancellation activity increased during periods of high booking demand.

- **6 PM recorded the highest driver cancellation count**.
- 6 PM also recorded the highest customer cancellation count.
- Driver and customer cancellations were particularly concentrated between **5 PM and 7 PM**.

Among high-volume pickup locations:

- **Nehru Place** recorded a driver cancellation rate of **21.47%**.
- Vinobapuri recorded **21.39%**.
- GTB Nagar recorded **20.99%**.

These locations may warrant further investigation into driver supply, traffic conditions, pickup complexity, or other operational factors.

---

## ⭐ Ratings & Customer Experience

### Driver Ratings

- Average Driver Rating: **4.23**
- Minimum Driver Rating: **3.0**
- Maximum Driver Rating: **5.0**

### Customer Ratings

- Average Customer Rating: **4.40**
- Minimum Customer Rating: **3.0**
- Maximum Customer Rating: **5.0**

Customer ratings were consistently approximately **0.17–0.18 points higher** than driver ratings across vehicle categories.

Ratings remained relatively consistent across different vehicle types, suggesting broadly similar customer-experience performance across the fleet.

---

## 👥 Customer Behavior

The dataset contains **148,788 unique customers**.

| Bookings per Customer | Customers |
|---:|---:|
| 1 | 147,582 |
| 2 | 1,200 |
| 3 | 6 |

Only **1,206 customers** made more than one booking.

### Repeat Customer Rate: **0.81%**

The very low repeat-customer rate is one of the most notable customer-behavior findings in the dataset.

It suggests that booking activity in this dataset is overwhelmingly driven by one-time customers and highlights customer retention as an important area for further investigation.

---

## 🔍 Data Quality Findings

The analysis identified several important data-quality considerations.

### Duplicate Booking IDs

- Total Records: **150,000**
- Unique Booking IDs: **148,767**
- Duplicated Booking IDs: **1,224**
- Extra Duplicate Rows: **1,233**

Duplicate Booking IDs should be considered when performing booking-level aggregations.

### Missing Values

Core identifying and location fields were complete.

However:

- Missing Booking Values: **48,000**
- Missing Ride Distances: **48,000**
- Missing Payment Methods: **48,000**
- Missing Driver Ratings: **57,000**
- Missing Customer Ratings: **57,000**

These missing values appear partly related to unsuccessful bookings that did not progress through the complete ride lifecycle.

For this reason, missing ride-related values were not automatically treated as data-quality errors.

---

## 🧠 SQL Concepts Used

This project demonstrates a range of SQL concepts used in real-world data analytics:

### Core SQL

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- `DISTINCT`
- `CASE WHEN`
- Aggregate functions
- Conditional aggregation

### Data Cleaning

- `TRY_CAST()`
- `TRIM()`
- `LOWER()`
- `NULLIF()`
- NULL handling
- Duplicate detection

### Date & Time Analysis

- `MONTH()`
- `MONTHNAME()`
- `DAYOFWEEK()`
- `DAYNAME()`
- `HOUR()`

### Advanced SQL

- Common Table Expressions (`WITH`)
- `RANK()`
- `LAG()`
- Running totals
- Cumulative contribution analysis
- Window functions
- Customer segmentation
- Performance scorecards

The final project contains **100 analytical SQL queries** covering dataset exploration through advanced business analysis.

---

## 💡 Key Business Insights

1. **62% of bookings were successfully completed**, leaving significant opportunity to improve unsuccessful booking outcomes.

2. **Driver cancellations are the largest operational issue**, accounting for 18% of total booking records.

3. **Auto is the strongest vehicle category**, contributing 24.81% of completed booking value.

4. Auto, Go Mini, and Go Sedan together account for **62.80% of completed booking value**.

5. **UPI is the dominant payment method**, generating approximately 21.27 million in completed booking value.

6. **March was the strongest month by completed booking value**, generating approximately 4.17 million.

7. **6 PM is the platform's strongest booking hour**, but cancellations also peak around the same evening period.

8. Pickup-location performance varies significantly, with completion rates ranging from approximately **54.68% to 66.27%** among high-volume locations.

9. Long rides between **26–40 km** generate the highest total booking value.

10. Weekend rides have a substantially higher average completed booking value than weekday rides.

11. Average ratings remain strong at **4.23 for drivers and 4.40 for customers**.

12. Only **0.81% of customers made repeat bookings**, making customer retention one of the strongest opportunities identified in the analysis.

---

## 📌 Business Recommendations

### Improve Driver Availability During Peak Hours

Driver allocation should be strengthened during the **5 PM–7 PM demand peak**, where both booking demand and cancellations are elevated.

### Reduce Driver Cancellations

With **27,000 driver cancellations**, improving driver acceptance and ride fulfillment could materially increase the overall completion rate.

### Investigate Cancellation Hotspots

Locations such as Nehru Place and Vinobapuri have relatively high driver cancellation rates and should be examined for traffic, pickup accessibility, supply-demand imbalance, or other operational issues.

### Improve Customer Retention

The **0.81% repeat-customer rate** suggests an opportunity to evaluate:

- Loyalty programs
- Personalized promotions
- Re-engagement campaigns
- Customer experience improvements

### Focus on High-Value Vehicle Categories

Auto, Go Mini, and Go Sedan generate nearly two-thirds of completed booking value and should remain important categories for driver availability and operational planning.

### Leverage Weekend Ride Value

Weekend rides have a significantly higher average completed booking value and may provide opportunities for targeted driver incentives or customer campaigns.

### Optimize Distance Economics

Short rides generate stronger booking value relative to distance, while medium and long rides generate the largest total booking value. Both metrics should be considered when evaluating ride economics.

---

## 📁 Key Project Files

### `SQL/schema.sql`

Creates the DuckDB table and loads the Uber booking dataset.

### `SQL/queries.sql`

Contains **100 SQL queries** covering:

- Dataset exploration
- Data quality
- Booking performance
- Booking value analysis
- Vehicle analytics
- Payment analysis
- Time trends
- Location analytics
- Route analysis
- Distance segmentation
- Cancellation analysis
- Ratings
- Customer behavior
- Advanced business analytics

### `insights.md`

Contains detailed findings and business interpretations derived from the SQL query results.

---

## 🚀 Project Outcome

This project demonstrates an end-to-end SQL analytics workflow, beginning with raw ride-booking data and progressing through:

**Data Exploration → Data Quality → Booking Analysis → Booking Value Analysis → Vehicle Analysis → Location & Route Analysis → Cancellation Analysis → Customer Experience → Advanced Business Analytics**

The project highlights how SQL can be used not only to query data but also to identify operational problems, measure business performance, analyze customer behavior, and translate raw transactional data into actionable business insights.

---