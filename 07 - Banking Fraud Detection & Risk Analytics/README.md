# Banking Fraud Detection & Risk Analytics

## Project Overview

This project analyzes banking transaction data using SQL to identify fraudulent activity, evaluate transaction risk factors, measure financial fraud exposure, and develop a multi-factor approach for fraud risk segmentation.

The analysis progresses from transaction-level fraud metrics to advanced fraud detection techniques using Common Table Expressions (CTEs), window functions, conditional aggregation, risk scoring, and transaction segmentation.

The objective is to demonstrate how SQL can be used to transform raw banking transaction data into actionable fraud detection and risk management insights.

---

## Business Objective

Financial institutions process large volumes of transactions across multiple banking channels. Identifying fraudulent transactions while minimizing unnecessary investigations is an important risk management challenge.

This project aims to answer questions such as:

- What percentage of transactions are fraudulent?
- What is the total financial exposure associated with fraud?
- Which transaction characteristics are associated with higher fraud rates?
- How strongly does anomaly score relate to fraudulent activity?
- Which payment channels have the highest fraud exposure?
- Which authentication methods experience higher fraud rates?
- Does transaction time influence fraud activity?
- How does fraud risk change when multiple risk indicators occur together?
- Can transactions be segmented into Low, Medium, and High Risk groups?
- Which transactions should be prioritized for fraud investigation?

---

## Dataset Overview

The dataset contains 10,000 banking transactions with information related to transaction behaviour, payment channels, authentication methods, geographic activity, and fraud risk indicators.

### Dataset Summary

- Total Transactions: 10,000
- Total Transaction Amount: $124.13 million
- Average Transaction Amount: $12,412.75
- Fraudulent Transactions: 1,251
- Overall Fraud Rate: 12.51%
- Fraudulent Transaction Amount: $15.66 million

### Key Data Fields

The dataset includes fields related to:

- Transaction ID
- Transaction Amount
- Payment Channel
- Authentication Type
- Transaction Time
- Card Presence
- Device Risk Score
- Anomaly Score
- Transaction Velocity Score
- Geographic Distance
- Login Attempts
- Suspicious IP Flag
- International Transaction Flag
- Fraud Flag

---

## Analysis Performed

### Transaction & Fraud Overview

The initial analysis establishes baseline transaction and fraud metrics.

The analysis includes:

- Total number of transactions
- Total transaction value
- Average transaction value
- Number of fraudulent transactions
- Overall fraud rate
- Total fraudulent transaction amount
- Fraudulent vs non-fraudulent transaction comparison

---

### Fraud Risk Factor Analysis

Multiple transaction and behavioural indicators were evaluated to determine their relationship with fraudulent activity.

Risk factors analysed include:

- Suspicious IP activity
- International transactions
- Device risk score
- Anomaly score
- Transaction velocity
- Geographic distance
- Login attempts

This analysis helps distinguish stronger fraud indicators from factors that provide limited predictive value.

---

### Transaction Channel & Authentication Analysis

Fraud activity was analysed across banking channels and authentication methods.

The analysis includes:

- Fraud rate by payment channel
- Fraud rate by authentication type
- Card-present vs card-not-present transactions
- Transaction amount by payment channel
- Payment channel and authentication combinations
- Fraud patterns by transaction time

---

### Advanced Fraud Analytics

Advanced SQL techniques were used to develop more detailed fraud risk profiles.

The analysis includes:

- Ranking payment channels by fraud rate
- Ranking authentication methods by fraud rate
- Ranking high-value fraudulent transactions
- Identifying transactions containing multiple risk indicators
- Multi-factor risk scoring
- Transaction risk segmentation
- Ranking fraudulent transactions within individual payment channels

---

### Fraud Monitoring & Financial Risk Analysis

The final analysis focuses on fraud exposure and investigation prioritization.

The analysis includes:

- Financial exposure by risk segment
- Fraudulent transaction value by payment channel
- Fraud contribution percentage by channel
- High-anomaly financial exposure
- Identification of critical transactions for investigation
- Evaluation of high-risk fraud capture

---

## Key Findings

### Overall Fraud Exposure

- 1,251 of the 10,000 transactions were fraudulent.
- The overall fraud rate was 12.51%.
- Fraudulent transactions represented approximately $15.66 million in transaction value.
- The average fraudulent transaction amount was approximately $12,515.91.

### Anomaly Score as a Fraud Indicator

Anomaly score emerged as the strongest individual fraud indicator in the analysis.

- High Anomaly transactions had an 84.97% fraud rate.
- Medium Anomaly transactions had an 8.17% fraud rate.
- Low Anomaly transactions had only a 0.02% fraud rate.
- 899 of the 1,058 High Anomaly transactions were fraudulent.

Fraudulent transactions had an average anomaly score of 0.77 compared with 0.29 for non-fraudulent transactions.

### Multi-Factor Fraud Risk

Fraud risk increased significantly as additional risk indicators occurred together.

| Risk Factors | Fraud Rate |
|---:|---:|
| 0 | 3.95% |
| 1 | 7.34% |
| 2 | 12.12% |
| 3 | 20.26% |
| 4 | 43.60% |
| 5 | 95.65% |

Transactions containing all five analysed risk indicators had a fraud rate of 95.65%.

This demonstrates the value of combining multiple fraud signals rather than relying on individual indicators.

### Risk Segmentation

Transactions were classified into Low, Medium, and High Risk segments.

| Risk Segment | Transactions | Fraudulent Transactions | Fraud Rate |
|---|---:|---:|---:|
| High Risk | 429 | 199 | 46.39% |
| Medium Risk | 5,200 | 768 | 14.77% |
| Low Risk | 4,371 | 284 | 6.50% |

The High Risk segment showed significantly greater fraud concentration.

However, Medium Risk transactions represented the largest absolute fraudulent financial exposure because of their larger transaction volume.

### Payment Channel Risk

Fraud rates by payment channel were:

| Payment Channel | Fraud Rate |
|---|---:|
| ATM | 13.00% |
| Mobile App | 12.82% |
| Web Banking | 12.32% |
| POS Terminal | 11.43% |

ATM transactions had the highest fraud rate.

However, Mobile App transactions generated the largest fraudulent transaction amount because of their much higher transaction volume.

### Fraudulent Financial Exposure by Channel

- Mobile App: approximately $7.71 million
- Web Banking: approximately $5.04 million
- POS Terminal: approximately $1.71 million
- ATM: approximately $1.19 million

Mobile App transactions contributed 49.25% of total fraudulent transaction value.

Mobile App and Web Banking together accounted for approximately 81.43% of total fraudulent transaction value.

### Authentication Risk

Fraud rates by authentication type were:

| Authentication Type | Fraud Rate |
|---|---:|
| OTP | 13.08% |
| Password Only | 12.77% |
| Biometric | 12.05% |
| Two-Factor Authentication | 11.62% |

Two-Factor Authentication recorded the lowest fraud rate among the authentication methods analysed.

The highest-risk channel and authentication combination was ATM with OTP, which recorded a fraud rate of 14.33%.

### Transaction Timing

Fraud rates by transaction period were:

| Transaction Period | Fraud Rate |
|---|---:|
| Late Night | 12.85% |
| Evening | 12.68% |
| Afternoon | 12.48% |
| Morning | 12.03% |

Late-night transactions showed the highest fraud rate, although differences across transaction periods were relatively small.

---

## Business Recommendations

Based on the analysis:

- Prioritize anomaly score as an important signal in transaction monitoring.
- Combine multiple behavioural and transaction indicators when calculating fraud risk.
- Apply enhanced monitoring to transactions containing multiple simultaneous risk factors.
- Prioritize high-value transactions with four or five risk indicators for investigation.
- Maintain monitoring of Medium Risk transactions because they represent substantial fraud exposure.
- Strengthen monitoring across Mobile App and Web Banking channels because they account for the majority of fraudulent transaction value.
- Consider stronger authentication controls for higher-risk digital transactions.
- Use tiered fraud alerts instead of relying on a single binary risk threshold.
- Continuously evaluate fraud thresholds to balance fraud detection with investigation workload.

---

## SQL Techniques Used

This project demonstrates the use of:

- SELECT statements
- WHERE filtering
- GROUP BY
- ORDER BY
- Aggregate functions
- COUNT()
- SUM()
- AVG()
- MAX()
- CASE expressions
- Conditional aggregation
- Common Table Expressions (CTEs)
- Window functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- PARTITION BY
- Percentage calculations
- Multi-factor risk scoring
- Risk segmentation
- Financial exposure analysis

---

## Tools & Technologies

- SQL
- DuckDB
- Visual Studio Code
- Git
- GitHub

---

## Repository Structure

```text
Banking-Fraud-Detection-Risk-Analytics/
│
├── Datasets/
│   └── banking_transactions.csv
│
├── schema.sql
├── queries.sql
├── insights.md
└── README.md