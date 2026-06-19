# Financial Loan Portfolio and Risk Analytics

## Project Overview

This project analyzes a financial loan portfolio using SQL and DuckDB to evaluate lending performance, borrower behavior, portfolio quality, and credit risk. The analysis focuses on loan applications, repayment performance, loan segmentation, risk assessment, and portfolio trends.

The project demonstrates how SQL can be used to generate business insights that support lending decisions and risk management strategies.

---

## Objectives

- Analyze overall loan portfolio performance.
- Measure lending and repayment activity.
- Identify good and bad loan segments.
- Evaluate portfolio growth trends.
- Analyze borrower demographics and loan purposes.
- Assess credit risk across loan grades and geographic regions.
- Build a performance dashboard for business decision-making.

---

## Dataset Information

The dataset contains loan application and repayment information, including:

- Loan Amount
- Interest Rate
- Debt-to-Income Ratio (DTI)
- Loan Status
- Loan Grade
- Loan Purpose
- Home Ownership
- State Information
- Payment Details
- Employment Information

### Dataset Size

- Total Loan Applications: 38,576

---

## Tools Used

- SQL
- DuckDB
- Git
- GitHub
- VS Code

---

## Project Structure

```text
03-Financial-Loan-Portfolio-and-Risk-Analytics
│
├── financial_loan.csv
├── schema.sql
├── queries.sql
├── insights.md
├── README.md
└── .gitignore
```

---

## Day 1 - Loan Portfolio Overview

### Analysis Performed

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Loan Amount
- Average Interest Rate
- Average DTI
- Loan Status Distribution

### Key Insights

- Total Loan Applications: 38,576
- Total Funded Amount: $435.76 Million
- Total Amount Received: $473.07 Million
- Average Loan Amount: $11,296
- Average Interest Rate: 12%
- Average DTI: 13%

---

## Day 2 - Good Loans vs Bad Loans Analysis

### Analysis Performed

- Good Loan Applications
- Bad Loan Applications
- Good Loan Percentage
- Bad Loan Percentage
- Good Loan Funded Amount
- Bad Loan Funded Amount
- Loan Status Summary

### Key Insights

- Good Loans: 86.18%
- Bad Loans: 13.82%
- Good Loans generated the majority of repayments.
- Charged-Off loans represent the primary source of portfolio risk.

---

## Day 3 - Monthly Loan Trends Analysis

### Analysis Performed

- Monthly Applications
- Monthly Funded Amount
- Monthly Amount Received
- Monthly Interest Rate Trends
- Monthly DTI Trends

### Key Insights

- Loan activity increased throughout 2021.
- December 2021 recorded the highest application volume.
- Q4 2021 showed the strongest lending growth.

---

## Day 4 - Portfolio Segmentation Analysis

### Analysis Performed

- State-wise Loan Analysis
- Purpose-wise Loan Analysis
- Home Ownership Analysis
- Grade-wise Loan Analysis
- Charged-Off Loans by Grade

### Key Insights

- California generated the highest number of applications.
- Debt Consolidation was the most common loan purpose.
- Renters represented the largest borrower segment.
- Grades B, C, and D accounted for the majority of charged-off loans.

---

## Day 5 - Risk & Performance Dashboard

### Analysis Performed

- Bad Loans by State
- Bad Loans by Purpose
- Good Loan Percentage by Grade
- Loan Status Dashboard

### Key Insights

- California recorded the highest number of charged-off loans.
- Debt Consolidation loans showed the highest default volume.
- Grade A loans achieved the highest repayment performance.
- More than 83% of loans were fully paid.

---

## Business Recommendations

- Increase monitoring of Debt Consolidation loans.
- Strengthen credit review processes for lower-grade borrowers.
- Focus on high-performing Grade A and Grade B lending segments.
- Monitor geographic risk concentration in high-volume states.
- Use segmentation insights to optimize lending strategies.

---

## SQL Concepts Used

- Aggregations
- GROUP BY
- ORDER BY
- Filtering with WHERE
- Date Functions
- Subqueries
- KPI Calculations
- Portfolio Segmentation Analysis
- Risk Analysis

---

## Conclusion

This project demonstrates how SQL can be used to analyze lending portfolios, evaluate credit risk, monitor repayment performance, and generate actionable business insights. The analysis highlights both portfolio strengths and risk areas, supporting data-driven lending decisions.