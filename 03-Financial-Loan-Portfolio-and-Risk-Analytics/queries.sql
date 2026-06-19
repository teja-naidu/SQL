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

-- ==========================================
-- DAY 3 - MONTHLY LOAN TRENDS ANALYSIS
-- ==========================================

-- Monthly Loan Applications

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    COUNT(*) AS total_applications
FROM financial_loan
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


-- Monthly Funded Amount

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


-- Monthly Amount Received

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


-- Monthly Average Interest Rate

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate_pct
FROM financial_loan
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


-- Monthly Average DTI

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    ROUND(AVG(dti) * 100, 2) AS avg_dti_pct
FROM financial_loan
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


-- Monthly Loan Status Trend

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    loan_status,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY loan_year, loan_month, loan_status
ORDER BY loan_year, loan_month, total_loans DESC;

-- ==========================================
-- DAY 4 - PORTFOLIO SEGMENTATION ANALYSIS
-- ==========================================

-- State-wise Loan Applications

SELECT
    address_state,
    COUNT(*) AS total_applications
FROM financial_loan
GROUP BY address_state
ORDER BY total_applications DESC;


-- State-wise Funded Amount

SELECT
    address_state,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY address_state
ORDER BY total_funded_amount DESC;


-- Purpose-wise Loan Applications

SELECT
    purpose,
    COUNT(*) AS total_applications
FROM financial_loan
GROUP BY purpose
ORDER BY total_applications DESC;


-- Purpose-wise Funded Amount

SELECT
    purpose,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY purpose
ORDER BY total_funded_amount DESC;


-- Home Ownership Analysis

SELECT
    home_ownership,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY total_applications DESC;


-- Grade-wise Loan Analysis

SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS funded_amount,
    SUM(total_payment) AS amount_received
FROM financial_loan
GROUP BY grade
ORDER BY grade;


-- Grade-wise Charged Off Loans

SELECT
    grade,
    COUNT(*) AS charged_off_loans
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY grade
ORDER BY charged_off_loans DESC;

-- ==========================================
-- DAY 5 - RISK & PERFORMANCE DASHBOARD
-- ==========================================

-- Good Loans by State

SELECT
    address_state,
    COUNT(*) AS good_loans
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current')
GROUP BY address_state
ORDER BY good_loans DESC;


-- Bad Loans by State

SELECT
    address_state,
    COUNT(*) AS bad_loans
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY address_state
ORDER BY bad_loans DESC;


-- Bad Loans by Purpose

SELECT
    purpose,
    COUNT(*) AS bad_loans
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY purpose
ORDER BY bad_loans DESC;


-- Good Loan Percentage by Grade

SELECT
    grade,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM financial_loan WHERE grade = f.grade),
        2
    ) AS good_loan_percentage
FROM financial_loan f
WHERE loan_status IN ('Fully Paid', 'Current')
GROUP BY grade
ORDER BY grade;


-- Loan Status Dashboard

SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM financial_loan),2) AS portfolio_percentage,
    SUM(loan_amount) AS funded_amount,
    SUM(total_payment) AS amount_received
FROM financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;