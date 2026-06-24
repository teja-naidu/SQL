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

-- 6. Top 10 Customers by Revenue

SELECT
    CustomerID,
    ROUND(SUM(TotalPrice), 2) AS total_spent
FROM ecommerce_orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- 7. Repeat Customers

SELECT
    CustomerID,
    COUNT(OrderID) AS total_orders
FROM ecommerce_orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1
ORDER BY total_orders DESC;

-- 8. Customer Spending Analysis

SELECT
    CustomerID,
    COUNT(OrderID) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_spent,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM ecommerce_orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 20;

-- 9. Customer Segmentation

SELECT
    CASE
        WHEN TotalPrice < 500 THEN 'Low Value'
        WHEN TotalPrice BETWEEN 500 AND 1500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS customer_segment,
    COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY customer_segment
ORDER BY total_orders DESC;


-- 10. High Value Customers

SELECT
    CustomerID,
    ROUND(SUM(TotalPrice), 2) AS total_spent
FROM ecommerce_orders
GROUP BY CustomerID
HAVING SUM(TotalPrice) > 3000
ORDER BY total_spent DESC;