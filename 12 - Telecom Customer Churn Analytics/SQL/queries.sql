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

-- ============================================================
-- Day 2: Customer Demographics & Churn Analysis
-- ============================================================


-- 11. Churn Analysis by Gender

SELECT
    "Gender",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Gender"
ORDER BY churn_rate_percentage DESC;


-- 12. Churn Analysis by Age Group

SELECT
    CASE
        WHEN "Age" < 30 THEN 'Under 30'
        WHEN "Age" BETWEEN 30 AND 44 THEN '30-44'
        WHEN "Age" BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY age_group
ORDER BY churn_rate_percentage DESC;


-- 13. Churn Analysis by Marital Status

SELECT
    "Married",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Married"
ORDER BY churn_rate_percentage DESC;


-- 14. Churn Analysis by Number of Dependents

SELECT
    "Number of Dependents",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Number of Dependents"
ORDER BY "Number of Dependents";


-- 15. Churn Analysis by Referral Activity

SELECT
    CASE
        WHEN "Number of Referrals" = 0 THEN 'No Referrals'
        WHEN "Number of Referrals" BETWEEN 1 AND 3 THEN '1-3 Referrals'
        WHEN "Number of Referrals" BETWEEN 4 AND 7 THEN '4-7 Referrals'
        ELSE '8+ Referrals'
    END AS referral_group,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY referral_group
ORDER BY churn_rate_percentage DESC;


-- 16. Average Age: Churned vs Stayed Customers

SELECT
    "Customer Status",
    ROUND(AVG("Age"), 2) AS average_age
FROM telecom_customer_churn
WHERE "Customer Status" IN ('Stayed', 'Churned')
GROUP BY "Customer Status"
ORDER BY average_age DESC;


-- 17. Average Dependents: Churned vs Stayed Customers

SELECT
    "Customer Status",
    ROUND(AVG("Number of Dependents"), 2) AS average_dependents
FROM telecom_customer_churn
WHERE "Customer Status" IN ('Stayed', 'Churned')
GROUP BY "Customer Status"
ORDER BY average_dependents DESC;


-- 18. Average Referrals: Churned vs Stayed Customers

SELECT
    "Customer Status",
    ROUND(AVG("Number of Referrals"), 2) AS average_referrals
FROM telecom_customer_churn
WHERE "Customer Status" IN ('Stayed', 'Churned')
GROUP BY "Customer Status"
ORDER BY average_referrals DESC;


-- 19. Top 10 Cities by Number of Churned Customers

SELECT
    "City",
    COUNT(*) AS churned_customers
FROM telecom_customer_churn
WHERE "Customer Status" = 'Churned'
GROUP BY "City"
ORDER BY churned_customers DESC
LIMIT 10;


-- 20. Churn Rate for Top 10 Largest Customer Cities

WITH city_stats AS (
    SELECT
        "City",
        COUNT(*) AS total_customers,
        SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) AS churned_customers
    FROM telecom_customer_churn
    GROUP BY "City"
),
top_cities AS (
    SELECT *
    FROM city_stats
    ORDER BY total_customers DESC
    LIMIT 10
)
SELECT
    "City",
    total_customers,
    churned_customers,
    ROUND(
        100.0 * churned_customers / total_customers,
        2
    ) AS churn_rate_percentage
FROM top_cities
ORDER BY churn_rate_percentage DESC;

-- ============================================================
-- Day 3: Service Usage & Churn Analysis
-- ============================================================


-- 21. Churn Analysis by Internet Service

SELECT
    "Internet Service",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Internet Service"
ORDER BY churn_rate_percentage DESC;


-- 22. Churn Analysis by Internet Type

SELECT
    COALESCE("Internet Type", 'No Internet') AS internet_type,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY COALESCE("Internet Type", 'No Internet')
ORDER BY churn_rate_percentage DESC;


-- 23. Churn Analysis by Online Security

SELECT
    "Online Security",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Online Security"
ORDER BY churn_rate_percentage DESC;


-- 24. Churn Analysis by Premium Tech Support

SELECT
    "Premium Tech Support",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Premium Tech Support"
ORDER BY churn_rate_percentage DESC;


-- 25. Churn Analysis by Online Backup

SELECT
    "Online Backup",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Online Backup"
ORDER BY churn_rate_percentage DESC;


-- 26. Churn Analysis by Device Protection Plan

SELECT
    "Device Protection Plan",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Device Protection Plan"
ORDER BY churn_rate_percentage DESC;


-- 27. Churn Analysis by Unlimited Data

SELECT
    "Unlimited Data",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Unlimited Data"
ORDER BY churn_rate_percentage DESC;


-- 28. Churn Analysis by Phone Service

SELECT
    "Phone Service",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Phone Service"
ORDER BY churn_rate_percentage DESC;


-- 29. Churn Analysis by Multiple Lines

SELECT
    "Multiple Lines",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Multiple Lines"
ORDER BY churn_rate_percentage DESC;


-- 30. Streaming Services and Churn

SELECT
    "Streaming TV",
    "Streaming Movies",
    "Streaming Music",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY
    "Streaming TV",
    "Streaming Movies",
    "Streaming Music"
ORDER BY churn_rate_percentage DESC;


-- 31. Average Monthly Data Usage by Customer Status

SELECT
    "Customer Status",
    ROUND(AVG("Avg Monthly GB Download"), 2) AS avg_monthly_gb_download
FROM telecom_customer_churn
WHERE "Internet Service" = true
GROUP BY "Customer Status"
ORDER BY avg_monthly_gb_download DESC;


-- 32. Number of Internet Add-On Services vs Churn

WITH service_usage AS (
    SELECT
        "Customer ID",
        "Customer Status",
        CAST(COALESCE("Online Security", false) AS INTEGER) +
        CAST(COALESCE("Online Backup", false) AS INTEGER) +
        CAST(COALESCE("Device Protection Plan", false) AS INTEGER) +
        CAST(COALESCE("Premium Tech Support", false) AS INTEGER)
            AS addon_services
    FROM telecom_customer_churn
    WHERE "Internet Service" = true
)

SELECT
    addon_services,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM service_usage
GROUP BY addon_services
ORDER BY addon_services;

-- ============================================================
-- Day 4: Billing, Payment, Tenure & Revenue Churn Analysis
-- ============================================================


-- 33. Churn Analysis by Tenure Group

SELECT
    CASE
        WHEN "Tenure in Months" <= 6 THEN '0-6 Months'
        WHEN "Tenure in Months" <= 12 THEN '7-12 Months'
        WHEN "Tenure in Months" <= 24 THEN '13-24 Months'
        WHEN "Tenure in Months" <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0-6 Months' THEN 1
        WHEN '7-12 Months' THEN 2
        WHEN '13-24 Months' THEN 3
        WHEN '25-48 Months' THEN 4
        ELSE 5
    END;


-- 34. Average Tenure by Customer Status

SELECT
    "Customer Status",
    ROUND(AVG("Tenure in Months"), 2) AS average_tenure_months
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY average_tenure_months DESC;


-- 35. Churn Analysis by Monthly Charge Group

SELECT
    CASE
        WHEN "Monthly Charge" < 40 THEN 'Under $40'
        WHEN "Monthly Charge" < 70 THEN '$40-$69.99'
        WHEN "Monthly Charge" < 100 THEN '$70-$99.99'
        ELSE '$100+'
    END AS monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY monthly_charge_group
ORDER BY churn_rate_percentage DESC;


-- 36. Average Monthly Charge by Customer Status

SELECT
    "Customer Status",
    ROUND(AVG("Monthly Charge"), 2) AS average_monthly_charge
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY average_monthly_charge DESC;


-- 37. Churn Analysis by Payment Method

SELECT
    "Payment Method",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Payment Method"
ORDER BY churn_rate_percentage DESC;


-- 38. Churn Analysis by Paperless Billing

SELECT
    "Paperless Billing",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY "Paperless Billing"
ORDER BY churn_rate_percentage DESC;


-- 39. Revenue by Customer Status

SELECT
    "Customer Status",
    COUNT(*) AS total_customers,
    ROUND(SUM("Total Revenue"), 2) AS total_revenue,
    ROUND(AVG("Total Revenue"), 2) AS average_revenue_per_customer
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY total_revenue DESC;


-- 40. Revenue Lost from Churned Customers

SELECT
    COUNT(*) AS churned_customers,
    ROUND(SUM("Total Revenue"), 2) AS churned_customer_revenue,
    ROUND(AVG("Total Revenue"), 2) AS avg_revenue_per_churned_customer
FROM telecom_customer_churn
WHERE "Customer Status" = 'Churned';


-- 41. Average Total Charges by Customer Status

SELECT
    "Customer Status",
    ROUND(AVG("Total Charges"), 2) AS average_total_charges
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY average_total_charges DESC;


-- 42. Refund Analysis by Customer Status

SELECT
    "Customer Status",
    ROUND(SUM("Total Refunds"), 2) AS total_refunds,
    ROUND(AVG("Total Refunds"), 2) AS average_refund
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY total_refunds DESC;


-- 43. Extra Data Charges by Customer Status

SELECT
    "Customer Status",
    ROUND(SUM("Total Extra Data Charges"), 2) AS total_extra_data_charges,
    ROUND(AVG("Total Extra Data Charges"), 2) AS average_extra_data_charge
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY total_extra_data_charges DESC;


-- 44. Long Distance Charges by Customer Status

SELECT
    "Customer Status",
    ROUND(SUM("Total Long Distance Charges"), 2)
        AS total_long_distance_charges,
    ROUND(AVG("Total Long Distance Charges"), 2)
        AS average_long_distance_charge
FROM telecom_customer_churn
GROUP BY "Customer Status"
ORDER BY total_long_distance_charges DESC;


-- 45. High-Value Churned Customers

SELECT
    "Customer ID",
    "City",
    "Tenure in Months",
    "Contract",
    "Monthly Charge",
    ROUND("Total Revenue", 2) AS total_revenue,
    "Churn Category",
    "Churn Reason"
FROM telecom_customer_churn
WHERE "Customer Status" = 'Churned'
ORDER BY "Total Revenue" DESC
LIMIT 10;


-- 46. Churn Rate by Contract and Payment Method

SELECT
    "Contract",
    "Payment Method",
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN "Customer Status" = 'Churned' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Customer Status" = 'Churned' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_customer_churn
GROUP BY
    "Contract",
    "Payment Method"
ORDER BY churn_rate_percentage DESC;