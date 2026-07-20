-- ==========================================
-- Banking Fraud Detection & Risk Analytics
-- Schema Creation
-- ==========================================

CREATE OR REPLACE TABLE banking_transactions AS
SELECT *
FROM read_csv_auto('Datasets/banking_transactions.csv');