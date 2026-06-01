-- ===================================
-- Data Exploration
-- ===================================

SELECT COUNT(*) AS total_transactions
FROM sales_data;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_data;

-- ===================================
-- Revenue Analysis
-- ===================================

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
    gender,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY gender
ORDER BY revenue DESC;

-- Revenue by Age

SELECT
    age,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data s
JOIN customer_data c
ON s.customer_id = c.customer_id
GROUP BY age
ORDER BY revenue DESC;

-- Top 10 Customers by Spending

SELECT
    s.customer_id,
    ROUND(SUM(quantity * price),2) AS total_spent
FROM sales_data s
GROUP BY s.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- ===================================
-- Shopping Behavior Analysis
-- ===================================

-- Payment Method Analysis

SELECT
    payment_method,
    ROUND(SUM(quantity * price),2) AS revenue
FROM sales_data
GROUP BY payment_method
ORDER BY revenue DESC;

-- Average Order Value

SELECT
    ROUND(AVG(quantity * price),2) AS average_order_value
FROM sales_data;