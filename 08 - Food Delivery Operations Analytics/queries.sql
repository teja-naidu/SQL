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

-- ==========================================
-- Delivery Performance & Operational Efficiency
-- ==========================================


-- 21. Overall Delivery Performance

SELECT
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(estimated_delivery_time), 2) AS average_estimated_delivery_time,
    ROUND(AVG(preparation_time_minutes), 2) AS average_preparation_time,
    ROUND(AVG(delivery_distance_km), 2) AS average_delivery_distance
FROM food_delivery;


-- 22. Delayed vs On-Time Delivery Analysis

SELECT
    delayed_delivery_flag,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(estimated_delivery_time), 2) AS average_estimated_time,
    ROUND(AVG(customer_rating), 2) AS average_customer_rating
FROM food_delivery
GROUP BY delayed_delivery_flag
ORDER BY total_orders DESC;


-- 23. Delivery Delay Rate

SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        AS delayed_orders,
    ROUND(
        100.0 * SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS delay_rate_percentage
FROM food_delivery;


-- 24. Delivery Performance by Distance Range

SELECT
    CASE
        WHEN delivery_distance_km <= 3 THEN '0-3 km'
        WHEN delivery_distance_km <= 6 THEN '3-6 km'
        WHEN delivery_distance_km <= 10 THEN '6-10 km'
        ELSE '10+ km'
    END AS distance_range,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(delivery_efficiency_score), 2) AS average_efficiency_score
FROM food_delivery
GROUP BY distance_range
ORDER BY average_delivery_time;


-- 25. Traffic Impact on Delivery Performance

SELECT
    traffic_level_score,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(delivery_efficiency_score), 2) AS average_efficiency_score,
    ROUND(
        100.0 * SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS delay_rate_percentage
FROM food_delivery
GROUP BY traffic_level_score
ORDER BY traffic_level_score;


-- 26. Weather Impact on Delivery Performance

SELECT
    weather_severity_score,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(delivery_efficiency_score), 2) AS average_efficiency_score,
    ROUND(
        100.0 * SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS delay_rate_percentage
FROM food_delivery
GROUP BY weather_severity_score
ORDER BY weather_severity_score;


-- 27. Delivery Performance by City Tier

SELECT
    city_tier,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_distance_km), 2) AS average_distance,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(delivery_efficiency_score), 2) AS average_efficiency_score,
    ROUND(
        100.0 * SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS delay_rate_percentage
FROM food_delivery
GROUP BY city_tier
ORDER BY city_tier;


-- 28. Delivery Partner Experience Analysis

SELECT
    CASE
        WHEN delivery_partner_experience_years < 2 THEN 'Less than 2 years'
        WHEN delivery_partner_experience_years < 5 THEN '2-4 years'
        WHEN delivery_partner_experience_years < 8 THEN '5-7 years'
        ELSE '8+ years'
    END AS experience_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(delivery_partner_rating), 2) AS average_partner_rating,
    ROUND(AVG(delivery_efficiency_score), 2) AS average_efficiency_score
FROM food_delivery
GROUP BY experience_group
ORDER BY average_delivery_time;


-- 29. Preparation Time Impact on Delivery

SELECT
    CASE
        WHEN preparation_time_minutes <= 15 THEN '0-15 min'
        WHEN preparation_time_minutes <= 30 THEN '16-30 min'
        WHEN preparation_time_minutes <= 45 THEN '31-45 min'
        ELSE '45+ min'
    END AS preparation_time_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time,
    ROUND(AVG(customer_rating), 2) AS average_customer_rating,
    ROUND(
        100.0 * SUM(CASE WHEN delayed_delivery_flag = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS delay_rate_percentage
FROM food_delivery
GROUP BY preparation_time_group
ORDER BY average_delivery_time;


-- 30. Estimated vs Actual Delivery Time

SELECT
    COUNT(*) AS total_orders,
    ROUND(AVG(estimated_delivery_time), 2) AS average_estimated_time,
    ROUND(AVG(delivery_time_minutes), 2) AS average_actual_time,
    ROUND(
        AVG(delivery_time_minutes - estimated_delivery_time),
        2
    ) AS average_delivery_time_difference
FROM food_delivery;

-- ==========================================
-- Cancellation, Refund & Rating Analytics
-- ==========================================


-- 31. Cancellation Analysis

SELECT
    cancellation_flag,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM food_delivery),
        2
    ) AS percentage_of_orders
FROM food_delivery
GROUP BY cancellation_flag;


-- 32. Refund Analysis

SELECT
    refund_flag,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM food_delivery),
        2
    ) AS percentage_of_orders
FROM food_delivery
GROUP BY refund_flag;


-- 33. Cancellation vs Refund Analysis

SELECT
    cancellation_flag,
    refund_flag,
    COUNT(*) AS total_orders
FROM food_delivery
GROUP BY cancellation_flag, refund_flag
ORDER BY cancellation_flag DESC, refund_flag DESC;


-- 34. Customer Rating Analysis

SELECT
    ROUND(AVG(customer_rating),2) AS average_customer_rating,
    ROUND(MIN(customer_rating),2) AS minimum_rating,
    ROUND(MAX(customer_rating),2) AS maximum_rating
FROM food_delivery;


-- 35. Restaurant Rating Analysis

SELECT
    ROUND(AVG(restaurant_rating),2) AS average_restaurant_rating,
    ROUND(MIN(restaurant_rating),2) AS minimum_rating,
    ROUND(MAX(restaurant_rating),2) AS maximum_rating
FROM food_delivery;


-- 36. Delivery Partner Rating Analysis

SELECT
    COUNT(delivery_partner_rating) AS available_ratings,
    COUNT(*) - COUNT(delivery_partner_rating) AS missing_ratings,
    ROUND(AVG(delivery_partner_rating),2) AS average_partner_rating,
    ROUND(MIN(delivery_partner_rating),2) AS minimum_rating,
    ROUND(MAX(delivery_partner_rating),2) AS maximum_rating
FROM food_delivery;


-- 37. Customer Rating by Delay Status

SELECT
    delayed_delivery_flag,
    COUNT(*) AS total_orders,
    ROUND(AVG(customer_rating),2) AS average_customer_rating,
    ROUND(AVG(delivery_partner_rating),2) AS average_partner_rating
FROM food_delivery
GROUP BY delayed_delivery_flag;


-- 38. Restaurant Rating by City Tier

SELECT
    city_tier,
    COUNT(*) AS total_orders,
    ROUND(AVG(restaurant_rating),2) AS average_restaurant_rating,
    ROUND(AVG(customer_rating),2) AS average_customer_rating
FROM food_delivery
GROUP BY city_tier
ORDER BY city_tier;


-- 39. Ratings During Festival / Weekend

SELECT
    festival_or_weekend_flag,
    COUNT(*) AS total_orders,
    ROUND(AVG(customer_rating),2) AS average_customer_rating,
    ROUND(AVG(restaurant_rating),2) AS average_restaurant_rating,
    ROUND(AVG(delivery_partner_rating),2) AS average_partner_rating
FROM food_delivery
GROUP BY festival_or_weekend_flag;


-- 40. Cancellation & Refund by City Tier

SELECT
    city_tier,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN cancellation_flag = TRUE THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN refund_flag = TRUE THEN 1 ELSE 0 END) AS refunded_orders,
    ROUND(
        100.0 * SUM(CASE WHEN cancellation_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS cancellation_rate,
    ROUND(
        100.0 * SUM(CASE WHEN refund_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS refund_rate
FROM food_delivery
GROUP BY city_tier
ORDER BY city_tier;