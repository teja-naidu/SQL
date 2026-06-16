-- ==========================================
-- DAY 1 - LOAN PORTFOLIO OVERVIEW
-- ==========================================

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


-- ==========================================
-- DAY 2 - GOOD LOANS VS BAD LOANS ANALYSIS
-- ==========================================

-- Good Loan Applications
SELECT
    COUNT(*) AS good_loan_applications
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

-- Good Loan Percentage
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM financial_loan),
        2
    ) AS good_loan_percentage
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

-- Good Loan Funded Amount
SELECT
    SUM(loan_amount) AS good_loan_funded_amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

-- Good Loan Amount Received
SELECT
    SUM(total_payment) AS good_loan_amount_received
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

-- Bad Loan Applications
SELECT
    COUNT(*) AS bad_loan_applications
FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Percentage
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM financial_loan),
        2
    ) AS bad_loan_percentage
FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT
    SUM(loan_amount) AS bad_loan_funded_amount
FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT
    SUM(total_payment) AS bad_loan_amount_received
FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Loan Status Summary
SELECT
    loan_status,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS funded_amount,
    SUM(total_payment) AS amount_received
FROM financial_loan
GROUP BY loan_status
ORDER BY total_applications DESC;