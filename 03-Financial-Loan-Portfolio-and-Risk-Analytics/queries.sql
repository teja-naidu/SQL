-- Total Loan Applications
SELECT COUNT(*) AS total_loan_applications
FROM financial_loan;

-- Total Funded Amount
SELECT SUM(loan_amount) AS total_funded_amount
FROM financial_loan;

-- Total Amount Received
SELECT SUM(total_payment) AS total_amount_received
FROM financial_loan;

-- Average Loan Amount
SELECT ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM financial_loan;

-- Average Interest Rate
SELECT ROUND(AVG(int_rate),2) AS avg_interest_rate
FROM financial_loan;

-- Average Debt-to-Income Ratio
SELECT ROUND(AVG(dti),2) AS avg_dti
FROM financial_loan;

-- Loan Status Distribution
SELECT
    loan_status,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;