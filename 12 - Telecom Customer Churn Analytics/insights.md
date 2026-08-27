# Telecom Customer Churn Analytics - Insights

## Dataset Overview

* Total Customers: 7,043
* Stayed Customers: 4,720
* Churned Customers: 1,869
* Newly Joined Customers: 454
* Overall Churn Rate: 26.54%
* Average Customer Age: 46.51 years
* Average Customer Tenure: 32.39 months
* Average Monthly Charge: $63.60
* Total Revenue: $21.37 million
* Average Revenue per Customer: $3,034.38

---

## Key Findings

### Customer Status

* The dataset contains 7,043 telecom customers.
* 4,720 customers remained with the company, representing the largest customer segment.
* 1,869 customers churned, resulting in an overall churn rate of 26.54%.
* 454 customers are newly joined customers.

### Customer Profile

* The average customer age is 46.51 years.
* Customers have an average tenure of 32.39 months, indicating that the typical customer has remained with the company for approximately 2.7 years.
* The average monthly charge across the customer base is $63.60.

### Revenue Overview

* The company generated approximately $21.37 million in total revenue from the customers represented in the dataset.
* Average total revenue per customer is approximately $3,034.38.

### Contract Distribution

* Month-to-Month contracts are the most common, with 3,610 customers.
* Two-Year contracts account for 1,883 customers.
* One-Year contracts account for 1,550 customers.

### Contract Type and Churn

* Month-to-Month customers have the highest churn rate at 45.84%, with 1,655 of 3,610 customers churning.
* One-Year contract customers have a significantly lower churn rate of 10.71%.
* Two-Year contract customers have the lowest churn rate at only 2.55%.
* The sharp decline in churn as contract duration increases suggests that longer-term contracts are strongly associated with customer retention.
* Month-to-Month customers represent the most important segment for further churn investigation and potential retention strategies.

## Customer Demographics & Churn Analysis

### Gender Analysis

* Female customers have a churn rate of 26.92%, while male customers have a churn rate of 26.16%.
* The difference between male and female churn rates is relatively small, suggesting that gender alone is not a major churn differentiator.

### Age Group Analysis

* Customers aged 60 and above have the highest churn rate at 35.41%.
* Customers aged 30–44 have a churn rate of 24.45%.
* Customers aged 45–59 have a churn rate of 23.94%.
* Customers under 30 have the lowest churn rate at 21.70%.
* Churned customers have an average age of 49.74 years compared with 45.58 years for customers who stayed.
* These results suggest that older customers, particularly those aged 60+, represent a higher-risk churn segment.

### Marital Status Analysis

* Unmarried customers have a churn rate of 32.96%.
* Married customers have a significantly lower churn rate of 19.66%.
* This indicates a strong association between marital status and customer retention in the dataset.

### Dependents Analysis

* Customers with no dependents represent the largest group and have a churn rate of 32.55%.
* Customers with one dependent have a churn rate of only 6.87%, while customers with two and three dependents have churn rates of 6.21% and 5.80%, respectively.
* Customers who stayed have an average of 0.62 dependents compared with only 0.12 among churned customers.
* Churn rates for customers with four or more dependents should be interpreted cautiously because these groups contain very few customers.

### Referral Analysis

* Customers with no referrals have a churn rate of 32.58%.
* Customers with 1–3 referrals have a churn rate of 35.83%.
* Churn drops sharply to 5.47% among customers with 4–7 referrals.
* Customers with 8 or more referrals have the lowest churn rate at just 0.89%.
* Customers who stayed made an average of 2.61 referrals compared with only 0.52 referrals among churned customers.
* Strong referral activity appears to be associated with substantially higher customer retention.

### Geographic Churn Analysis

* San Diego recorded the highest number of churned customers with 185, substantially higher than Los Angeles with 78.
* Among the 10 cities with the largest customer bases, San Diego also has the highest churn rate at 64.91%.
* Escondido follows with a churn rate of 31.37%, while San Francisco records 29.81%.
* Los Angeles has the largest customer base among these cities with 293 customers and a churn rate of 26.62%.
* San Diego stands out as an important geographic segment for further investigation because it combines a large customer population with an unusually high churn rate.

### Key Takeaway

Customer churn is more strongly associated with age, marital status, dependents, referral activity, and location than with gender. Older customers, customers without dependents, customers with limited referral engagement, and customers in specific geographic markets such as San Diego represent important segments for deeper churn analysis and targeted retention strategies.


## Service Usage & Churn Analysis

### Internet Service

* Customers with internet service have a churn rate of 31.83%, compared with only 7.40% among customers without internet service.
* This suggests that churn risk is concentrated heavily among customers using internet products.

### Internet Type

* Fiber Optic customers have the highest churn rate at 40.72%.
* Cable customers have a churn rate of 25.66%.
* DSL customers have a lower churn rate of 18.58%.
* Customers without internet service have the lowest churn rate at 7.40%.
* Fiber Optic customers represent an important segment for further investigation because they combine a large customer base with a substantially higher churn rate.

### Online Security

* Internet customers without Online Security have a churn rate of 41.77%.
* Customers with Online Security have a significantly lower churn rate of 14.61%.
* Online Security adoption is therefore strongly associated with higher customer retention.

### Premium Tech Support

* Customers without Premium Tech Support have a churn rate of 41.64%.
* Customers with Premium Tech Support have a much lower churn rate of 15.17%.
* Access to premium support appears to be strongly associated with customer retention.

### Online Backup

* Customers without Online Backup have a churn rate of 39.93%.
* Customers using Online Backup have a churn rate of 21.53%.
* Customers using this additional service show considerably lower churn.

### Device Protection

* Customers without a Device Protection Plan have a churn rate of 39.13%.
* Customers with Device Protection have a churn rate of 22.50%.
* Device Protection adoption is associated with lower customer churn.

### Unlimited Data

* Customers without Unlimited Data have a churn rate of 32.90%.
* Customers with Unlimited Data have a similar churn rate of 31.65%.
* The relatively small difference suggests that Unlimited Data alone is not a strong churn differentiator.

### Phone & Multiple-Line Services

* Customers with Phone Service have a churn rate of 26.71%, compared with 24.93% among customers without Phone Service.
* Multiple-Line customers have a churn rate of 28.61%, compared with 25.04% among customers with a single line.
* These relatively small differences suggest that phone-service configuration is less strongly associated with churn than internet add-on services.

### Streaming Services

* Churn varies considerably across different combinations of Streaming TV, Movies, and Music.
* Some smaller streaming combinations show very high churn rates, but their limited customer counts mean these results should be interpreted cautiously.
* Customers using all three streaming services represent a large segment of 1,670 customers and have a churn rate of 26.95%.
* Streaming adoption does not show the same consistent retention pattern observed with security and support services.

### Internet Usage

* Customers who stayed download an average of 27.55 GB per month.
* Newly joined customers average 25.50 GB.
* Churned customers average 23.60 GB.
* Churned customers therefore show somewhat lower average data usage than retained customers.

### Add-On Service Adoption

* Internet customers with zero add-on services have the highest churn rate at 56.67%.
* Customers with one add-on service have a churn rate of 38.85%.
* Churn falls to 23.76% among customers with two add-on services.
* Customers with three add-on services have a churn rate of only 12.43%.
* Customers using all four analyzed add-on services have the lowest churn rate at 5.32%.
* This shows a strong and consistent relationship between deeper service adoption and customer retention.

### Key Takeaway

Internet-service customers represent the primary churn-risk population, particularly Fiber Optic customers. Online Security, Premium Tech Support, Online Backup, and Device Protection are each associated with substantially lower churn. Most importantly, churn declines from 56.67% among internet customers with no add-on services to just 5.32% among customers using all four add-ons, making service adoption one of the strongest retention signals identified so far.

## Billing, Payment, Tenure & Revenue Churn Analysis

### Tenure Analysis

* Customers within their first 6 months have the highest churn rate at 53.33%.
* Churn declines to 35.34% for customers with 7–12 months of tenure.
* Customers with 13–24 months of tenure have a churn rate of 28.71%.
* The rate falls further to 20.39% among customers with 25–48 months of tenure.
* Customers with 49 or more months of tenure have the lowest churn rate at only 9.51%.
* Customers who stayed have an average tenure of 41.04 months, compared with only 17.98 months among churned customers.
* This shows a strong inverse relationship between customer tenure and churn.

### Monthly Charge Analysis

* Customers paying $70–$99.99 per month have the highest churn rate at 38.03%.
* Customers paying $100 or more have a churn rate of 28.54%.
* Customers paying $40–$69.99 have a churn rate of 23.60%.
* Customers paying under $40 have the lowest churn rate at 12.31%.
* Churned customers pay an average of $73.35 per month compared with $61.74 among customers who stayed.
* Higher monthly charges are therefore associated with increased churn risk, although the relationship is not perfectly linear.

### Payment Method Analysis

* Mailed Check customers have the highest churn rate at 36.88%.
* Bank Withdrawal customers have a similarly high churn rate of 34.00%.
* Credit Card customers have a substantially lower churn rate of 14.48%.
* Credit Card payment is associated with significantly stronger customer retention in this dataset.

### Paperless Billing

* Customers using Paperless Billing have a churn rate of 33.57%.
* Customers without Paperless Billing have a churn rate of only 16.33%.
* Paperless Billing customers therefore show approximately twice the churn rate of customers using traditional billing.

### Revenue Analysis

* Customers who stayed generated approximately $17.63 million in total revenue.
* Churned customers generated approximately $3.68 million before leaving.
* Newly joined customers generated approximately $54.28 thousand.
* Average revenue per retained customer is $3,735.68 compared with $1,971.35 among churned customers.
* The lower lifetime revenue among churned customers is consistent with their significantly shorter average tenure.

### Churned Customer Value

* The 1,869 churned customers generated approximately $3.68 million in historical revenue.
* Average revenue per churned customer was $1,971.35.
* Several high-value churned customers individually generated more than $10,000 in total revenue before leaving.
* Competitor-related reasons and service/support attitude appear repeatedly among the highest-revenue churned customers.
* This indicates that churn affects not only newer customers but can also result in the loss of established, high-value relationships.

### Charges and Usage

* Customers who stayed accumulated average total charges of $2,788.52 compared with $1,531.80 among churned customers.
* Retained customers generated average long-distance charges of $942.29 compared with $433.92 among churned customers.
* Average extra data charges are almost identical for stayed and churned customers at $7.17 and $7.16 respectively.
* Extra data charges therefore do not appear to meaningfully differentiate churned and retained customers.

### Contract and Payment Method Risk

* Month-to-Month customers paying by Mailed Check have the highest churn rate at 55.56%.
* Month-to-Month customers using Bank Withdrawal follow closely at 53.35%.
* Month-to-Month customers paying by Credit Card have a lower, but still elevated, churn rate of 29.05%.
* One-Year contract churn ranges from 7.75% for Credit Card customers to 14.63% for Mailed Check customers.
* Two-Year customers using Credit Cards have a churn rate of only 1.70%.
* No churn was recorded among the 69 Two-Year customers using Mailed Check, though the relatively small group size should be considered.
* Contract duration remains a major retention factor even when payment method is taken into account.

### Key Takeaway

Customer churn is heavily concentrated during the early stages of the customer lifecycle. High monthly charges, Month-to-Month contracts, Mailed Check or Bank Withdrawal payments, and Paperless Billing are associated with elevated churn. The strongest retention patterns occur among long-tenure customers and customers committed to longer contracts, particularly those using Credit Card payments. Retention initiatives should therefore prioritize new and early-tenure customers before they become established churn risks.
