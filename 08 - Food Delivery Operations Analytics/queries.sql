-- ==========================================
-- Food Delivery Operations Analytics
-- Order & Business Overview
-- ==========================================


-- 1. Total Number of Orders

SELECT
    COUNT(*) AS total_orders
FROM food_delivery;


-- 2. Total Order Value

SELECT
    ROUND(SUM(order_value), 2) AS total_order_value
FROM food_delivery;


-- 3. Total Amount Paid by Customers

SELECT
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid
FROM food_delivery;


-- 4. Average Order Value

SELECT
    ROUND(AVG(order_value), 2) AS average_order_value
FROM food_delivery;


-- 5. Average Final Amount Paid

SELECT
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery;


-- 6. Total Items Ordered and Average Items per Order

SELECT
    SUM(number_of_items) AS total_items_ordered,
    ROUND(AVG(number_of_items), 2) AS average_items_per_order
FROM food_delivery;


-- 7. Orders by City Tier

SELECT
    city_tier,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY city_tier
ORDER BY total_orders DESC;


-- 8. Orders by Day of Week

SELECT
    order_day_of_week,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid
FROM food_delivery
GROUP BY order_day_of_week
ORDER BY total_orders DESC;


-- 9. Monthly Order Performance

SELECT
    order_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY order_month
ORDER BY order_month;


-- 10. Orders by Hour of Day

SELECT
    order_hour,
    COUNT(*) AS total_orders,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY order_hour
ORDER BY order_hour;