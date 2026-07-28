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

-- ==========================================
-- Customer & Revenue Analytics
-- ==========================================


-- 11. Premium vs Non-Premium Customer Analysis

SELECT
    premium_customer_flag,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY premium_customer_flag
ORDER BY total_amount_paid DESC;


-- 12. Customer Loyalty Score Analysis

SELECT
    customer_loyalty_score,
    COUNT(*) AS total_orders,
    ROUND(AVG(order_value), 2) AS average_order_value,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY customer_loyalty_score
ORDER BY customer_loyalty_score;


-- 13. Customer Age Group Analysis

SELECT
    CASE
        WHEN customer_age < 25 THEN 'Under 25'
        WHEN customer_age BETWEEN 25 AND 34 THEN '25-34'
        WHEN customer_age BETWEEN 35 AND 44 THEN '35-44'
        WHEN customer_age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY age_group
ORDER BY total_orders DESC;


-- 14. Promo Code Usage Analysis

SELECT
    promo_code_used,
    COUNT(*) AS total_orders,
    ROUND(SUM(discount_amount), 2) AS total_discount,
    ROUND(AVG(discount_amount), 2) AS average_discount,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY promo_code_used
ORDER BY total_orders DESC;


-- 15. Discount Analysis

SELECT
    ROUND(SUM(discount_amount), 2) AS total_discount_amount,
    ROUND(AVG(discount_amount), 2) AS average_discount_amount,
    ROUND(MAX(discount_amount), 2) AS maximum_discount_amount
FROM food_delivery;


-- 16. Tip Analysis

SELECT
    COUNT(tip_amount) AS orders_with_tip_data,
    COUNT(*) - COUNT(tip_amount) AS missing_tip_records,
    ROUND(SUM(tip_amount), 2) AS total_tip_amount,
    ROUND(AVG(tip_amount), 2) AS average_tip_amount,
    ROUND(MAX(tip_amount), 2) AS maximum_tip_amount
FROM food_delivery;


-- 17. Premium Customer Promo Usage

SELECT
    premium_customer_flag,
    promo_code_used,
    COUNT(*) AS total_orders,
    ROUND(AVG(discount_amount), 2) AS average_discount,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY premium_customer_flag, promo_code_used
ORDER BY premium_customer_flag, total_orders DESC;


-- 18. Festival / Weekend Order Analysis

SELECT
    festival_or_weekend_flag,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(order_value), 2) AS average_order_value,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY festival_or_weekend_flag
ORDER BY total_orders DESC;


-- 19. Customer Loyalty by Premium Status

SELECT
    premium_customer_flag,
    ROUND(AVG(customer_loyalty_score), 2) AS average_loyalty_score,
    ROUND(AVG(order_value), 2) AS average_order_value,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY premium_customer_flag
ORDER BY premium_customer_flag;


-- 20. Highest Spending Customer Segments

SELECT
    premium_customer_flag,
    city_tier,
    COUNT(*) AS total_orders,
    ROUND(SUM(final_amount_paid), 2) AS total_amount_paid,
    ROUND(AVG(final_amount_paid), 2) AS average_amount_paid
FROM food_delivery
GROUP BY premium_customer_flag, city_tier
ORDER BY total_amount_paid DESC;