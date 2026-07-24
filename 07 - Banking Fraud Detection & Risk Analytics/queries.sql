-- ==========================================
-- Banking Fraud Detection & Risk Analytics
-- Transaction & Fraud Overview
-- ==========================================


-- 1. Total Number of Transactions

SELECT 
    COUNT(*) AS total_transactions
FROM banking_transactions;


-- 2. Total Transaction Amount

SELECT 
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount
FROM banking_transactions;


-- 3. Average Transaction Amount

SELECT 
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount
FROM banking_transactions;


-- 4. Total Fraudulent Transactions

SELECT 
    COUNT(*) AS total_fraudulent_transactions
FROM banking_transactions
WHERE fraud_flag = TRUE;


-- 5. Overall Fraud Rate

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) 
        / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions;


-- 6. Total Transaction Amount Associated with Fraud

SELECT
    ROUND(SUM(transaction_amount), 2) AS fraudulent_transaction_amount
FROM banking_transactions
WHERE fraud_flag = TRUE;


-- 7. Fraudulent vs Non-Fraudulent Transaction Analysis

SELECT
    CASE 
        WHEN fraud_flag = TRUE THEN 'Fraudulent'
        ELSE 'Non-Fraudulent'
    END AS transaction_status,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount
FROM banking_transactions
GROUP BY fraud_flag
ORDER BY total_transactions DESC;

-- ==========================================
-- Day 2 - Fraud Risk Factor Analysis
-- ==========================================


-- 8. Fraud Analysis by Suspicious IP Flag

SELECT
    suspicious_ip_flag,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY suspicious_ip_flag
ORDER BY fraud_rate_percentage DESC;


-- 9. Fraud Analysis by International Transaction Flag

SELECT
    international_transaction_flag,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY international_transaction_flag
ORDER BY fraud_rate_percentage DESC;


-- 10. Average Risk Scores by Fraud Status

SELECT
    CASE
        WHEN fraud_flag = TRUE THEN 'Fraudulent'
        ELSE 'Non-Fraudulent'
    END AS transaction_status,
    ROUND(AVG(device_risk_score), 2) AS avg_device_risk_score,
    ROUND(AVG(anomaly_score), 2) AS avg_anomaly_score,
    ROUND(AVG(transaction_velocity_score), 2) AS avg_transaction_velocity_score
FROM banking_transactions
GROUP BY fraud_flag;


-- 11. Fraud Analysis by Device Risk Level

SELECT
    CASE
        WHEN device_risk_score < 30 THEN 'Low Risk'
        WHEN device_risk_score < 70 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS device_risk_level,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY device_risk_level
ORDER BY fraud_rate_percentage DESC;


-- 12. Fraud Analysis by Anomaly Score Level

SELECT
    CASE
        WHEN anomaly_score < 0.30 THEN 'Low Anomaly'
        WHEN anomaly_score < 0.70 THEN 'Medium Anomaly'
        ELSE 'High Anomaly'
    END AS anomaly_level,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY anomaly_level
ORDER BY fraud_rate_percentage DESC;


-- 13. Fraud Analysis by Transaction Velocity Level

SELECT
    CASE
        WHEN transaction_velocity_score < 30 THEN 'Low Velocity'
        WHEN transaction_velocity_score < 70 THEN 'Medium Velocity'
        ELSE 'High Velocity'
    END AS velocity_level,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY velocity_level
ORDER BY fraud_rate_percentage DESC;


-- 14. Geographic Distance Analysis by Fraud Status

SELECT
    CASE
        WHEN fraud_flag = TRUE THEN 'Fraudulent'
        ELSE 'Non-Fraudulent'
    END AS transaction_status,
    ROUND(AVG(geo_distance_km), 2) AS avg_geo_distance_km,
    ROUND(MAX(geo_distance_km), 2) AS max_geo_distance_km
FROM banking_transactions
GROUP BY fraud_flag;


-- 15. Login Attempts Analysis by Fraud Status

SELECT
    CASE
        WHEN fraud_flag = TRUE THEN 'Fraudulent'
        ELSE 'Non-Fraudulent'
    END AS transaction_status,
    ROUND(AVG(login_attempts), 2) AS avg_login_attempts,
    MAX(login_attempts) AS max_login_attempts
FROM banking_transactions
GROUP BY fraud_flag;

-- ==========================================
-- Day 3 - Transaction Channel & Authentication Analysis
-- ==========================================


-- 16. Fraud Analysis by Payment Channel

SELECT
    payment_channel,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY payment_channel
ORDER BY fraud_rate_percentage DESC;


-- 17. Fraud Analysis by Authentication Type

SELECT
    authentication_type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY authentication_type
ORDER BY fraud_rate_percentage DESC;


-- 18. Fraud Analysis by Card Presence

SELECT
    card_present_flag,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY card_present_flag
ORDER BY fraud_rate_percentage DESC;


-- 19. Transaction Amount Analysis by Payment Channel

SELECT
    payment_channel,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_amount,
    ROUND(MAX(transaction_amount), 2) AS maximum_transaction_amount
FROM banking_transactions
GROUP BY payment_channel
ORDER BY total_transaction_amount DESC;


-- 20. Payment Channel and Authentication Risk

SELECT
    payment_channel,
    authentication_type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY payment_channel, authentication_type
ORDER BY fraud_rate_percentage DESC;


-- 21. Fraud Analysis by Transaction Time

SELECT
    CASE
        WHEN transaction_time_hour BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN transaction_time_hour BETWEEN 6 AND 11 THEN 'Morning'
        WHEN transaction_time_hour BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS transaction_period,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
GROUP BY transaction_period
ORDER BY fraud_rate_percentage DESC;

-- ==========================================
-- Day 4 - Advanced Fraud Analytics
-- CTEs, Window Functions & Risk Segmentation
-- ==========================================


-- 22. Rank Payment Channels by Fraud Rate
-- Uses a CTE and RANK() window function

WITH channel_fraud AS (
    SELECT
        payment_channel,
        COUNT(*) AS total_transactions,
        SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
        ROUND(
            100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS fraud_rate_percentage
    FROM banking_transactions
    GROUP BY payment_channel
)

SELECT
    payment_channel,
    total_transactions,
    fraudulent_transactions,
    fraud_rate_percentage,
    RANK() OVER (ORDER BY fraud_rate_percentage DESC) AS fraud_risk_rank
FROM channel_fraud
ORDER BY fraud_risk_rank;


-- 23. Rank Authentication Types by Fraud Rate
-- Uses CTE + DENSE_RANK()

WITH authentication_fraud AS (
    SELECT
        authentication_type,
        COUNT(*) AS total_transactions,
        SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
        ROUND(
            100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS fraud_rate_percentage
    FROM banking_transactions
    GROUP BY authentication_type
)

SELECT
    authentication_type,
    total_transactions,
    fraudulent_transactions,
    fraud_rate_percentage,
    DENSE_RANK() OVER (
        ORDER BY fraud_rate_percentage DESC
    ) AS fraud_risk_rank
FROM authentication_fraud
ORDER BY fraud_risk_rank;


-- 24. Rank Highest-Value Fraudulent Transactions
-- Uses ROW_NUMBER() to identify the largest fraud transactions

SELECT
    transaction_id,
    transaction_amount,
    payment_channel,
    authentication_type,
    anomaly_score,
    device_risk_score,
    ROW_NUMBER() OVER (
        ORDER BY transaction_amount DESC
    ) AS transaction_value_rank
FROM banking_transactions
WHERE fraud_flag = TRUE
ORDER BY transaction_value_rank
LIMIT 10;


-- 25. High-Risk Transactions Using Multiple Risk Indicators
-- Combines anomaly, device risk, velocity and suspicious IP indicators

WITH high_risk_transactions AS (
    SELECT
        transaction_id,
        transaction_amount,
        anomaly_score,
        device_risk_score,
        transaction_velocity_score,
        suspicious_ip_flag,
        fraud_flag
    FROM banking_transactions
    WHERE anomaly_score >= 0.70
       OR device_risk_score >= 70
       OR transaction_velocity_score >= 70
       OR suspicious_ip_flag = 1
)

SELECT
    COUNT(*) AS high_risk_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS high_risk_fraud_rate
FROM high_risk_transactions;


-- 26. Multi-Factor Risk Score

WITH risk_scoring AS (
    SELECT
        transaction_id,
        transaction_amount,
        fraud_flag,

        (
            CASE WHEN anomaly_score >= 0.70 THEN 1 ELSE 0 END +
            CASE WHEN device_risk_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN transaction_velocity_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN suspicious_ip_flag = 1 THEN 1 ELSE 0 END +
            CASE WHEN international_transaction_flag = 1 THEN 1 ELSE 0 END
        ) AS risk_factor_count

    FROM banking_transactions
)

SELECT
    risk_factor_count,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM risk_scoring
GROUP BY risk_factor_count
ORDER BY risk_factor_count;


-- 27. Transaction Risk Segmentation

WITH transaction_risk AS (
    SELECT
        transaction_id,
        transaction_amount,
        fraud_flag,

        (
            CASE WHEN anomaly_score >= 0.70 THEN 1 ELSE 0 END +
            CASE WHEN device_risk_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN transaction_velocity_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN suspicious_ip_flag = 1 THEN 1 ELSE 0 END +
            CASE WHEN international_transaction_flag = 1 THEN 1 ELSE 0 END
        ) AS risk_factor_count

    FROM banking_transactions
),

risk_segments AS (
    SELECT
        *,
        CASE
            WHEN risk_factor_count <= 1 THEN 'Low Risk'
            WHEN risk_factor_count <= 3 THEN 'Medium Risk'
            ELSE 'High Risk'
        END AS risk_segment
    FROM transaction_risk
)

SELECT
    risk_segment,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_amount,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM risk_segments
GROUP BY risk_segment
ORDER BY fraud_rate_percentage DESC;


-- 28. Top Fraudulent Transactions Within Each Payment Channel
-- Uses PARTITION BY to rank fraud transactions within each channel

WITH ranked_fraud AS (
    SELECT
        transaction_id,
        payment_channel,
        transaction_amount,
        anomaly_score,

        ROW_NUMBER() OVER (
            PARTITION BY payment_channel
            ORDER BY transaction_amount DESC
        ) AS channel_rank

    FROM banking_transactions
    WHERE fraud_flag = TRUE
)

SELECT
    transaction_id,
    payment_channel,
    transaction_amount,
    anomaly_score,
    channel_rank
FROM ranked_fraud
WHERE channel_rank <= 3
ORDER BY payment_channel, channel_rank;

-- ==========================================
-- Day 5 - Fraud Monitoring & Final Risk Analysis
-- ==========================================


-- 29. Financial Exposure by Risk Segment

WITH risk_scoring AS (
    SELECT
        transaction_amount,
        fraud_flag,
        (
            CASE WHEN anomaly_score >= 0.70 THEN 1 ELSE 0 END +
            CASE WHEN device_risk_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN transaction_velocity_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN suspicious_ip_flag = 1 THEN 1 ELSE 0 END +
            CASE WHEN international_transaction_flag = 1 THEN 1 ELSE 0 END
        ) AS risk_factor_count
    FROM banking_transactions
),

risk_segments AS (
    SELECT
        *,
        CASE
            WHEN risk_factor_count <= 1 THEN 'Low Risk'
            WHEN risk_factor_count <= 3 THEN 'Medium Risk'
            ELSE 'High Risk'
        END AS risk_segment
    FROM risk_scoring
)

SELECT
    risk_segment,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount,
    ROUND(
        SUM(CASE WHEN fraud_flag = TRUE THEN transaction_amount ELSE 0 END),
        2
    ) AS fraudulent_transaction_amount
FROM risk_segments
GROUP BY risk_segment
ORDER BY fraudulent_transaction_amount DESC;


-- 30. Fraudulent Amount by Payment Channel

SELECT
    payment_channel,
    COUNT(*) AS fraudulent_transactions,
    ROUND(SUM(transaction_amount), 2) AS fraudulent_transaction_amount,
    ROUND(AVG(transaction_amount), 2) AS avg_fraud_transaction_amount
FROM banking_transactions
WHERE fraud_flag = TRUE
GROUP BY payment_channel
ORDER BY fraudulent_transaction_amount DESC;


-- 31. Fraud Contribution by Payment Channel

WITH channel_fraud AS (
    SELECT
        payment_channel,
        COUNT(*) AS fraudulent_transactions,
        SUM(transaction_amount) AS fraudulent_amount
    FROM banking_transactions
    WHERE fraud_flag = TRUE
    GROUP BY payment_channel
)

SELECT
    payment_channel,
    fraudulent_transactions,
    ROUND(fraudulent_amount, 2) AS fraudulent_amount,
    ROUND(
        100.0 * fraudulent_amount /
        SUM(fraudulent_amount) OVER (),
        2
    ) AS fraud_amount_percentage
FROM channel_fraud
ORDER BY fraud_amount_percentage DESC;


-- 32. High-Anomaly Fraud Financial Exposure

SELECT
    COUNT(*) AS high_anomaly_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraudulent_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount,
    ROUND(
        SUM(CASE WHEN fraud_flag = TRUE THEN transaction_amount ELSE 0 END),
        2
    ) AS fraudulent_transaction_amount,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percentage
FROM banking_transactions
WHERE anomaly_score >= 0.70;


-- 33. Critical Transactions for Fraud Investigation

WITH scored_transactions AS (
    SELECT
        transaction_id,
        transaction_amount,
        payment_channel,
        authentication_type,
        anomaly_score,
        fraud_flag,

        (
            CASE WHEN anomaly_score >= 0.70 THEN 1 ELSE 0 END +
            CASE WHEN device_risk_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN transaction_velocity_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN suspicious_ip_flag = 1 THEN 1 ELSE 0 END +
            CASE WHEN international_transaction_flag = 1 THEN 1 ELSE 0 END
        ) AS risk_factor_count

    FROM banking_transactions
)

SELECT
    transaction_id,
    transaction_amount,
    payment_channel,
    authentication_type,
    anomaly_score,
    risk_factor_count,
    fraud_flag
FROM scored_transactions
WHERE risk_factor_count >= 4
ORDER BY risk_factor_count DESC, transaction_amount DESC
LIMIT 20;


-- 34. Fraud Detection Effectiveness of High-Risk Segmentation

WITH risk_scoring AS (
    SELECT
        fraud_flag,
        (
            CASE WHEN anomaly_score >= 0.70 THEN 1 ELSE 0 END +
            CASE WHEN device_risk_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN transaction_velocity_score >= 70 THEN 1 ELSE 0 END +
            CASE WHEN suspicious_ip_flag = 1 THEN 1 ELSE 0 END +
            CASE WHEN international_transaction_flag = 1 THEN 1 ELSE 0 END
        ) AS risk_factor_count
    FROM banking_transactions
)

SELECT
    SUM(
        CASE
            WHEN risk_factor_count >= 4 AND fraud_flag = TRUE
            THEN 1 ELSE 0
        END
    ) AS fraud_detected_in_high_risk,

    SUM(
        CASE
            WHEN fraud_flag = TRUE
            THEN 1 ELSE 0
        END
    ) AS total_fraudulent_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN risk_factor_count >= 4 AND fraud_flag = TRUE
                THEN 1 ELSE 0
            END
        )
        /
        SUM(
            CASE
                WHEN fraud_flag = TRUE
                THEN 1 ELSE 0
            END
        ),
        2
    ) AS high_risk_fraud_capture_rate

FROM risk_scoring;