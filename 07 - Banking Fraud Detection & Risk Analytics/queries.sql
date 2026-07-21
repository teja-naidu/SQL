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