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