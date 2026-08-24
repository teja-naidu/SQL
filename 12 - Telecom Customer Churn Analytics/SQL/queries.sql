-- ============================================================
-- SQL Project 12: Telecom Customer Churn Analytics
-- Day 1: Dataset Overview & Churn KPIs
-- ============================================================


-- 1. Total Customers

SELECT
    COUNT(*) AS total_customers
FROM telecom_customer_churn;


-- 2. Customer Status Distribution

SELECT
    "Customer Status",
    COUNT(*) AS total_customers
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY total_customers DESC;


-- 3. Overall Churn Rate

SELECT
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Customer Status" = 'Churned'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "Customer Status" = 'Churned'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM telecom_customer_churn;


-- 4. Average Customer Age

SELECT
    ROUND(AVG("Age"), 2) AS average_customer_age
FROM telecom_customer_churn;


-- 5. Average Customer Tenure

SELECT
    ROUND(AVG("Tenure in Months"), 2) AS average_tenure_months
FROM telecom_customer_churn;


-- 6. Average Monthly Charge

SELECT
    ROUND(AVG("Monthly Charge"), 2) AS average_monthly_charge
FROM telecom_customer_churn;


-- 7. Total Revenue

SELECT
    ROUND(SUM("Total Revenue"), 2) AS total_revenue
FROM telecom_customer_churn;


-- 8. Average Revenue per Customer

SELECT
    ROUND(AVG("Total Revenue"), 2) AS average_revenue_per_customer
FROM telecom_customer_churn;


-- 9. Customers by Contract Type

SELECT
    "Contract",
    COUNT(*) AS total_customers
FROM telecom_customer_churn
GROUP BY "Contract"
ORDER BY total_customers DESC;


-- 10. Churn by Contract Type

SELECT
    "Contract",
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Customer Status" = 'Churned'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN "Customer Status" = 'Churned'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM telecom_customer_churn
GROUP BY "Contract"
ORDER BY churn_rate_percentage DESC;