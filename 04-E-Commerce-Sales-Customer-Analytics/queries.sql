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

-- 11. Best Selling Products by Quantity Sold

SELECT
    Product,
    SUM(Quantity) AS total_quantity_sold
FROM ecommerce_orders
GROUP BY Product
ORDER BY total_quantity_sold DESC;

-- 12. Revenue by Product

SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders
GROUP BY Product
ORDER BY total_revenue DESC;

-- 13. Average Selling Price by Product

SELECT
    Product,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM ecommerce_orders
GROUP BY Product
ORDER BY average_order_value DESC;

-- 14. Product Contribution to Total Revenue

SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS revenue,
    ROUND(
        SUM(TotalPrice) * 100.0 /
        (SELECT SUM(TotalPrice) FROM ecommerce_orders),
        2
    ) AS revenue_percentage
FROM ecommerce_orders
GROUP BY Product
ORDER BY revenue DESC;

-- 15. Product Ranking by Revenue

SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(TotalPrice) DESC
    ) AS product_rank
FROM ecommerce_orders
GROUP BY Product
ORDER BY product_rank;

-- 16. Revenue by Referral Source

SELECT
    ReferralSource,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;

-- 17. Orders by Referral Source

SELECT
    ReferralSource,
    COUNT(OrderID) AS total_orders
FROM ecommerce_orders
GROUP BY ReferralSource
ORDER BY total_orders DESC;

-- 18. Coupon Code Performance

SELECT
    CouponCode,
    COUNT(OrderID) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders
GROUP BY CouponCode
ORDER BY total_revenue DESC;

-- 19. Payment Method Analysis

SELECT
    PaymentMethod,
    COUNT(OrderID) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;

-- 20. Order Status Analysis

SELECT
    OrderStatus,
    COUNT(OrderID) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM ecommerce_orders
GROUP BY OrderStatus
ORDER BY total_orders DESC;

-- 21. Running Monthly Revenue

WITH monthly_revenue AS (
    SELECT
        YEAR(Date) AS year,
        MONTH(Date) AS month,
        ROUND(SUM(TotalPrice), 2) AS revenue
    FROM ecommerce_orders
    GROUP BY 1,2
)

SELECT
    year,
    month,
    revenue,
    ROUND(
        SUM(revenue) OVER (
            ORDER BY year, month
        ),
        2
    ) AS running_revenue
FROM monthly_revenue;

-- 22. Monthly Revenue Growth

WITH monthly_revenue AS (
    SELECT
        YEAR(Date) AS year,
        MONTH(Date) AS month,
        ROUND(SUM(TotalPrice), 2) AS revenue
    FROM ecommerce_orders
    GROUP BY 1,2
)

SELECT
    year,
    month,
    revenue,
    ROUND(
        revenue -
        LAG(revenue) OVER (
            ORDER BY year, month
        ),
        2
    ) AS revenue_growth
FROM monthly_revenue;

-- 23. Top Product by Revenue

SELECT
    Product,
    ROUND(SUM(TotalPrice),2) AS total_revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(TotalPrice) DESC
    ) AS revenue_rank
FROM ecommerce_orders
GROUP BY Product
ORDER BY revenue_rank;

-- 24. Customer Revenue Ranking

SELECT
    CustomerID,
    ROUND(SUM(TotalPrice),2) AS total_spent,
    DENSE_RANK() OVER(
        ORDER BY SUM(TotalPrice) DESC
    ) AS customer_rank
FROM ecommerce_orders
GROUP BY CustomerID
LIMIT 20;

-- 25. Business Dashboard

WITH dashboard AS (

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT CustomerID) AS total_customers,
    ROUND(SUM(TotalPrice),2) AS total_revenue,
    ROUND(AVG(TotalPrice),2) AS average_order_value
FROM ecommerce_orders

)

SELECT *
FROM dashboard;