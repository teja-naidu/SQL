-- ===================================
-- Data Exploration
-- ===================================

-- Total Transactions

SELECT COUNT(*) AS total_transactions
FROM sales_data;

-- Total Customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_data;


-- ===================================
-- Revenue Analysis
-- ===================================

-- Total Revenue

SELECT
    ROUND(SUM(quantity * price),2) AS total_revenue
FROM sales_data;

-- Revenue by Category

SELECT
    category,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY category
ORDER BY revenue DESC;

-- Revenue by Shopping Mall

SELECT
    shopping_mall,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY shopping_mall
ORDER BY revenue DESC;

-- Quantity Sold by Category

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY category
ORDER BY total_quantity DESC;


-- ===================================
-- Customer Analysis
-- ===================================

-- Revenue by Gender

SELECT
    c.gender,
    ROUND(SUM(s.quantity * s.price),2) AS revenue
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY revenue DESC;

-- Revenue by Age Group

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    ROUND(SUM(s.quantity * s.price),2) AS revenue
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY age_group
ORDER BY revenue DESC;

-- Top 10 Customers by Spending

SELECT
    s.customer_id,
    ROUND(SUM(s.quantity * s.price),2) AS total_spent
FROM sales_data s
GROUP BY s.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- ===================================
-- Shopping Behavior Analysis
-- ===================================

-- Revenue by Payment Method

SELECT
    c.payment_method,
    ROUND(SUM(s.quantity * s.price),2) AS revenue
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY c.payment_method
ORDER BY revenue DESC;

-- Average Order Value

SELECT
    ROUND(AVG(quantity * price),2) AS average_order_value
FROM sales_data;


-- ===================================
-- Time Series Analysis
-- ===================================

-- Monthly Revenue Trend

SELECT
    strftime(invoice_date, '%Y-%m') AS month,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY month
ORDER BY month;


-- ===================================
-- Category Contribution Analysis
-- ===================================

-- Revenue Share by Category

SELECT
    category,
    ROUND(
        (100.0 * SUM(quantity * price)) /
        (SELECT SUM(quantity * price) FROM sales_data),
        2
    ) AS revenue_percentage
FROM sales_data
GROUP BY category
ORDER BY revenue_percentage DESC;


-- ===================================
-- Advanced Business Analysis
-- ===================================

-- Top 5 Revenue Generating Categories

SELECT
    category,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY category
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 Shopping Malls

SELECT
    shopping_mall,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY shopping_mall
ORDER BY revenue DESC
LIMIT 5;

-- Average Spending by Gender

SELECT
    c.gender,
    ROUND(AVG(s.quantity * s.price),2) AS avg_spending
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY avg_spending DESC;

-- Transactions by Payment Method

SELECT
    c.payment_method,
    COUNT(*) AS total_transactions
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY c.payment_method
ORDER BY total_transactions DESC;