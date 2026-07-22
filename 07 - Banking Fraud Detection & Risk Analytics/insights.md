# Banking Fraud Detection & Risk Analytics - Insights

## Day 1 Insights - Transaction & Fraud Overview

### Dataset Overview

- Total Transactions: 10,000
- Total Transaction Amount: $124,127,540.04
- Average Transaction Amount: $12,412.75
- Total Fraudulent Transactions: 1,251
- Overall Fraud Rate: 12.51%
- Total Fraudulent Transaction Amount: $15,657,404.21

---

## Key Findings

### Transaction Overview

- The dataset contains a total of 10,000 banking transactions.
- The combined transaction value across all transactions is approximately $124.13 million.
- The average transaction amount is approximately $12,412.75.

### Fraud Overview

- A total of 1,251 transactions were identified as fraudulent.
- Fraudulent transactions represent approximately 12.51% of all transactions.
- The total value associated with fraudulent transactions is approximately $15.66 million.

### Fraudulent vs Non-Fraudulent Transactions

- Fraudulent transactions have an average transaction value of approximately $12,515.91.
- Non-fraudulent transactions have an average transaction value of approximately $12,398.00.
- The relatively small difference in average transaction amounts indicates that transaction value alone may not be sufficient to identify fraudulent activity.
- Additional behavioral and risk indicators should be analyzed to improve fraud detection.

## Business Value

Understanding the overall transaction and fraud landscape helps financial institutions:

- Measure the scale and financial exposure associated with fraudulent transactions.
- Track overall fraud rates across banking transactions.
- Identify the potential financial impact of fraudulent activity.
- Establish baseline fraud metrics for further risk analysis.
- Support the development of more effective fraud detection and prevention strategies.

---

## Day 2 Insights - Fraud Risk Factor Analysis

## Key Findings

### Suspicious IP Analysis

- Transactions flagged with suspicious IP addresses recorded a fraud rate of 12.83%.
- Transactions without suspicious IP flags recorded a slightly lower fraud rate of 12.19%.
- Out of 5,005 suspicious-IP transactions, 642 were identified as fraudulent.
- Suspicious IP activity shows a slightly higher fraud risk, but the difference is relatively small, indicating that this factor alone may not be sufficient for identifying fraudulent transactions.

### International Transaction Analysis

- Domestic transactions recorded a fraud rate of 12.70%.
- International transactions recorded a fraud rate of 12.32%.
- Among 4,984 international transactions, 614 were fraudulent.
- International transactions did not demonstrate a higher fraud rate than domestic transactions in this dataset.
- This indicates that international transaction status alone is not a strong fraud indicator.

### Risk Score Comparison

- Fraudulent transactions had an average device risk score of 50.16 compared with 50.27 for non-fraudulent transactions.
- The average transaction velocity score was 50.86 for fraudulent transactions and 50.02 for non-fraudulent transactions.
- These relatively small differences suggest that device risk and transaction velocity scores alone provide limited separation between fraudulent and legitimate transactions.
- The anomaly score showed a much stronger difference, averaging 0.77 for fraudulent transactions compared with only 0.29 for non-fraudulent transactions.

### Device Risk Analysis

- Low-risk device transactions recorded the highest fraud rate at 13.24%.
- High-risk device transactions had a fraud rate of 12.87%.
- Medium-risk device transactions recorded the lowest fraud rate at 11.68%.
- Fraud rates remain relatively close across the three device risk categories.
- Device risk score by itself does not appear to be a strong predictor of fraudulent activity in this dataset.

### Anomaly Score Analysis

- High-anomaly transactions recorded an extremely high fraud rate of 84.97%.
- Out of 1,058 high-anomaly transactions, 899 were fraudulent.
- Medium-anomaly transactions recorded a significantly lower fraud rate of 8.17%.
- Low-anomaly transactions recorded only one fraudulent transaction out of 4,644 transactions, resulting in a fraud rate of just 0.02%.
- Anomaly score is the strongest fraud risk indicator identified in the Day 2 analysis.
- The sharp increase in fraud rates as anomaly scores increase demonstrates a strong relationship between anomalous transaction behavior and fraudulent activity.

### Transaction Velocity Analysis

- High-velocity transactions recorded the highest fraud rate at 12.94%.
- Medium-velocity transactions had a fraud rate of 12.51%.
- Low-velocity transactions recorded a fraud rate of 12.06%.
- Fraud rates increase slightly as transaction velocity increases.
- However, the relatively small differences indicate that transaction velocity should be combined with other risk indicators rather than used independently.

### Geographic Distance Analysis

- Fraudulent transactions had an average geographic distance of 7,400.48 km.
- Non-fraudulent transactions had a slightly higher average geographic distance of 7,633.75 km.
- Maximum geographic distances were similar for both fraudulent and non-fraudulent transactions.
- Geographic distance alone does not appear to provide a strong distinction between fraudulent and legitimate transactions.

### Login Attempt Analysis

- Fraudulent transactions averaged 6.43 login attempts.
- Non-fraudulent transactions averaged 6.44 login attempts.
- Both groups recorded a maximum of 12 login attempts.
- The nearly identical results indicate that login attempt count alone has little ability to distinguish fraudulent transactions in this dataset.

## Business Value

The fraud risk factor analysis helps financial institutions:

- Identify which transaction characteristics are most strongly associated with fraudulent activity.
- Prioritize anomaly scores as a major signal when developing fraud detection rules and monitoring systems.
- Avoid relying too heavily on individual indicators such as device risk, geographic distance, or login attempts.
- Combine multiple transaction and behavioral risk indicators to improve fraud detection accuracy.
- Develop risk-based transaction monitoring strategies that focus investigation resources on transactions with stronger fraud signals.
- Reduce false positives by distinguishing strong fraud indicators from factors that provide limited predictive value.

---

## Day 3 Insights - Transaction Channel & Authentication Analysis

## Key Findings

### Payment Channel Analysis

- ATM transactions recorded the highest fraud rate at 13.00%, with 101 fraudulent transactions out of 777 total transactions.
- Mobile App transactions had a fraud rate of 12.82%, with 616 fraudulent transactions out of 4,804 transactions.
- Web Banking recorded a fraud rate of 12.32%.
- POS Terminal transactions had the lowest fraud rate at 11.43%.
- Although ATM transactions had the highest fraud rate, Mobile App transactions accounted for the largest number of fraudulent transactions because of their significantly higher transaction volume.

### Authentication Type Analysis

- OTP-authenticated transactions recorded the highest fraud rate at 13.08%.
- Password Only transactions followed with a fraud rate of 12.77%.
- Biometric authentication recorded a fraud rate of 12.05%.
- Two-Factor Authentication had the lowest fraud rate at 11.62%.
- Stronger authentication methods such as Two-Factor Authentication and Biometric authentication showed relatively lower fraud rates than OTP and Password Only transactions.

### Card Presence Analysis

- Card-present transactions recorded a fraud rate of 12.54%.
- Card-not-present transactions recorded a nearly identical fraud rate of 12.48%.
- The difference between the two categories is only 0.06 percentage points.
- Card presence therefore does not appear to be a significant standalone fraud indicator in this dataset.

### Transaction Amount by Payment Channel

- Mobile App was the largest payment channel, processing 4,804 transactions worth approximately $59.58 million.
- Web Banking processed approximately $40.26 million across 3,247 transactions.
- POS Terminal transactions had the highest average transaction amount at approximately $12,623.69.
- ATM transactions had the lowest average transaction amount at approximately $12,211.11.
- Average transaction values remained relatively similar across all payment channels.

### Payment Channel and Authentication Risk

- ATM transactions authenticated using OTP recorded the highest fraud rate among all channel-authentication combinations at 14.33%.
- Web Banking with Password Only authentication had the second-highest fraud rate at 13.60%.
- Mobile App transactions using OTP recorded a fraud rate of 13.31%.
- Mobile App with Password Only authentication recorded a fraud rate of 13.04%.
- POS Terminal transactions using Password Only authentication recorded the lowest fraud rate at 9.87%.
- The results demonstrate that fraud risk varies when payment channels and authentication methods are analyzed together rather than independently.

### Transaction Time Analysis

- Late-night transactions recorded the highest fraud rate at 12.85%.
- Evening transactions followed with a fraud rate of 12.68%.
- Afternoon transactions recorded a fraud rate of 12.48%.
- Morning transactions had the lowest fraud rate at 12.03%.
- Fraud rates increase slightly during later periods of the day, although the differences between time periods remain relatively small.

## Business Value

The transaction channel and authentication analysis helps financial institutions:

- Identify payment channels associated with higher fraud exposure.
- Evaluate the effectiveness of different authentication methods.
- Detect higher-risk combinations of payment channels and authentication methods.
- Prioritize monitoring of transactions involving higher-risk combinations such as ATM transactions authenticated using OTP.
- Understand transaction volume and financial exposure across digital and physical banking channels.
- Incorporate transaction timing into fraud monitoring strategies.
- Design multi-factor fraud detection rules instead of relying on individual transaction characteristics.