-- 1. Total Orders

SELECT COUNT(*) AS total_orders
FROM ecommerce_orders;

-- 2. Total Revenue

SELECT ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders;

-- 3. Average Order Value

SELECT ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM ecommerce_orders;

-- 4. Total Unique Customers

SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM ecommerce_orders;

-- 5. Monthly Revenue Trend

SELECT
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM ecommerce_orders
GROUP BY 1,2
ORDER BY 1,2;