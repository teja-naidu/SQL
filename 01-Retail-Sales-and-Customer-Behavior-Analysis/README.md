# Retail Sales and Customer Behavior Analysis

## Project Overview

This project analyzes retail sales transactions and customer behavior data using SQL and DuckDB. The goal is to identify revenue drivers, customer purchasing patterns, shopping preferences, and business opportunities through data analysis.

The project covers revenue analysis, customer segmentation, shopping behavior analysis, category performance, shopping mall performance, and business recommendations.

---

## Dataset Information

The analysis uses two datasets:

### 1. Sales Data (`sales_data.csv`)

Contains transaction-level retail sales information.

**Columns:**

* invoice_no
* customer_id
* category
* quantity
* price
* invoice_date
* shopping_mall

### 2. Customer Data (`customer_data.csv`)

Contains customer demographic information.

**Columns:**

* customer_id
* gender
* age
* payment_method

---

## Tools & Technologies

* SQL
* DuckDB
* Git
* GitHub
* CSV Files

---

## Project Workflow

```text
CSV Files
    ↓
DuckDB Database
    ↓
SQL Analysis
    ↓
Business Insights
    ↓
Business Recommendations
```

---

## Project Structure

```text
01-Retail-Sales-and-Customer-Behavior-Analysis
│
├── sales_data.csv
├── customer_data.csv
├── queries.sql
├── insights.md
└── README.md
```

---

## Analysis Performed

### Data Exploration

* Total Transactions
* Total Customers

### Revenue Analysis

* Total Revenue
* Revenue by Category
* Revenue by Shopping Mall
* Quantity Sold by Category

### Customer Analysis

* Revenue by Gender
* Revenue by Age Group
* Top Customers by Spending

### Shopping Behavior Analysis

* Revenue by Payment Method
* Average Order Value

### Time Series Analysis

* Monthly Revenue Trend

### Category Contribution Analysis

* Revenue Share by Category

### Advanced Business Analysis

* Top Revenue Generating Categories
* Top Shopping Malls
* Average Spending by Gender
* Transactions by Payment Method

### Deep Dive Customer Insights

* Revenue by Gender and Category
* Revenue by Age Group and Category
* Revenue by Shopping Mall and Category
* Customer Segmentation

---

## Key Findings

### Revenue Performance

* Total Revenue generated: **$251.51 Million**
* Clothing generated the highest revenue among all categories.
* Shoes and Technology were the second and third highest-performing categories.

### Shopping Mall Performance

* Mall of Istanbul generated the highest revenue.
* Kanyon closely followed as the second-best performing mall.
* Metrocity ranked third in total revenue.

### Customer Insights

* Female customers generated significantly higher revenue than male customers.
* Customers aged **56+** contributed the highest revenue among all age groups.

### Shopping Behavior

* Cash was the most commonly used payment method.
* Credit cards accounted for a significant portion of customer spending.
* Average Order Value was approximately **$2,528.79**.

### Customer Segmentation

* Most customers belong to the Low Value segment.
* A smaller High Value customer group contributes significantly to total revenue.
* Customer retention and loyalty strategies can improve long-term revenue.

---

## Business Recommendations

### 1. Focus on High-Performing Categories

Increase marketing efforts for Clothing, Shoes, and Technology categories.

### 2. Improve Customer Retention

Develop loyalty programs targeting Low Value customers to increase repeat purchases.

### 3. Target High Revenue Demographics

Create personalized campaigns for female customers and the 56+ age group.

### 4. Expand High-Performing Locations

Focus operational and marketing investments on top-performing shopping malls.

### 5. Encourage Digital Payments

Promote credit and debit card usage through rewards and promotional offers.

---

## How to Run the Project

### Step 1: Open DuckDB

```sql
duckdb retail_analysis.duckdb
```

### Step 2: Create Tables

```sql
CREATE TABLE sales_data AS
SELECT * FROM read_csv_auto('sales_data.csv');

CREATE TABLE customer_data AS
SELECT * FROM read_csv_auto('customer_data.csv');
```

### Step 3: Execute Analysis Queries

```sql
.read queries.sql
```

---

## Repository Structure

| File              | Description                    |
| ----------------- | ------------------------------ |
| sales_data.csv    | Retail sales dataset           |
| customer_data.csv | Customer demographic dataset   |
| queries.sql       | SQL analysis queries           |
| insights.md       | Business insights and findings |
| README.md         | Project documentation          |

---

## Future Improvements

* Build interactive dashboards using Power BI or Tableau.
* Perform customer lifetime value (CLV) analysis.
* Develop predictive sales forecasting models.
* Add customer churn analysis.
* Create automated reporting pipelines.

---

## Conclusion

This project demonstrates end-to-end SQL-based retail analytics using DuckDB. Through revenue analysis, customer segmentation, shopping behavior analysis, and business recommendations, valuable insights were generated to support data-driven decision making.
