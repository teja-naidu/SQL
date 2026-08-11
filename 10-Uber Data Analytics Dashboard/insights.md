# Uber Ride Bookings Analytics - Insights

## Dataset Overview

* Total Records: **150,000**
* Unique Booking IDs: **148,767**
* Unique Customers: **148,788**
* Vehicle Types: **7**
* Pickup Locations: **176**
* Drop Locations: **176**
* Analysis Period: **January 1, 2024 to December 30, 2024**

---

## Booking Status Analysis

* **93,000 bookings were completed**, representing **62%** of all booking records.
* **27,000 bookings were cancelled by drivers**, accounting for **18%** of total bookings.
* **10,500 bookings were cancelled by customers**, representing **7%**.
* **10,500 bookings resulted in no driver being found**, also representing **7%**.
* **9,000 bookings were incomplete**, accounting for the remaining **6%**.
* Overall, **38% of booking records did not result in a completed ride**.
* Driver cancellations represent the largest individual source of unsuccessful bookings.

---

## Vehicle Type Analysis

The dataset contains **7 vehicle categories**:

* Auto
* Bike
* Go Mini
* Go Sedan
* Premier Sedan
* Uber XL
* eBike

These vehicle categories provide a basis for comparing booking demand, booking value, ride distance, cancellations, and customer experience in later stages of the analysis.

---

## Location Analysis

* The dataset contains **176 unique pickup locations** and **176 unique drop locations**.
* **Khandsa** recorded the highest number of pickup bookings with **949 bookings**.
* **Barakhamba Road** ranked second with **946 bookings**, followed by **Saket with 931 bookings**.
* **Ashram** was the most frequent drop location with **936 bookings**.
* **Basai Dhankot** followed with **917 bookings**, while **Lok Kalyan Marg** recorded **916 bookings**.
* Booking demand is distributed across a large number of locations rather than being concentrated in only a few areas.

---

## Payment Method Analysis

* **UPI** was the most frequently recorded payment method with **45,909 bookings**.
* **Cash** was used for **25,367 bookings**.
* **Uber Wallet** accounted for **12,276 bookings**.
* **Credit Card** was used for **10,209 bookings**.
* **Debit Card** accounted for **8,239 bookings**.
* Payment method information was unavailable for **48,000 booking records**.
* Missing payment information may be associated with unsuccessful bookings that did not reach the payment stage.

---

## Booking Value Analysis

* Total Recorded Booking Value: **51,846,183**
* Average Booking Value: **508.30**
* Minimum Booking Value: **50.00**
* Maximum Booking Value: **4,277.00**

The large difference between the minimum and maximum booking values indicates substantial variation in ride value across the dataset.

Further analysis will evaluate booking value across vehicle types, payment methods, locations, and time periods.

---

## Ride Distance Analysis

* Total Recorded Ride Distance: **2,512,975.19**
* Average Ride Distance: **24.64**
* Minimum Ride Distance: **1.00**
* Maximum Ride Distance: **50.00**

Ride distances vary considerably across bookings, providing an opportunity to analyze the relationship between distance, booking value, and vehicle type.

---

## Customer Experience

### Driver Ratings

* Average Driver Rating: **4.23**
* Minimum Driver Rating: **3.00**
* Maximum Driver Rating: **5.00**

### Customer Ratings

* Average Customer Rating: **4.40**
* Minimum Customer Rating: **3.00**
* Maximum Customer Rating: **5.00**

Customer ratings are slightly higher than driver ratings on average, while both remain above **4.0**, indicating generally positive experiences among rides with available ratings.

---

## Data Quality Analysis

### Duplicate Booking IDs

* Total Records: **150,000**
* Unique Booking IDs: **148,767**
* Duplicated Booking IDs: **1,224**
* Extra Duplicate Rows: **1,233**

Duplicate Booking IDs were identified in the dataset. These records should be considered carefully during booking-level aggregation to prevent potential double counting.

### Missing Values

No missing values were identified in the core booking and location fields:

* Missing Booking IDs: **0**
* Missing Customer IDs: **0**
* Missing Vehicle Types: **0**
* Missing Pickup Locations: **0**
* Missing Drop Locations: **0**

Missing values were identified in ride-related fields:

* Missing Booking Values: **48,000**
* Missing Ride Distances: **48,000**
* Missing Payment Methods: **48,000**
* Missing Driver Ratings: **57,000**
* Missing Customer Ratings: **57,000**

The missing ride-related values should not automatically be treated as data-quality errors because unsuccessful or incomplete bookings may naturally lack payment, distance, or rating information.

---

## Key Findings

* The dataset contains **150,000 booking records** covering almost the entire 2024 calendar year.
* The overall ride completion rate is **62%**, leaving **38% of bookings unsuccessful or incomplete**.
* **Driver cancellations at 18%** are the largest source of unsuccessful bookings and represent an important area for further investigation.
* The platform operates across **176 pickup and 176 drop locations**, indicating broad geographic coverage.
* **UPI is the most commonly recorded payment method**, followed by Cash.
* The average recorded booking value is **508.30**, while the average recorded ride distance is **24.64**.
* Average driver and customer ratings are both above **4.0**.
* Duplicate Booking IDs were detected and must be considered when calculating booking-level KPIs.
* Missing booking value, distance, payment, and rating information appears to be related partly to bookings that did not complete the full ride lifecycle.


---

# Booking & Revenue Analytics

## Completed Ride Performance

* Total Bookings: **150,000**
* Completed Rides: **93,000**
* Completion Rate: **62.00%**
* Completed Booking Value: **47,260,574**
* Average Completed Booking Value: **508.18**

Completed rides generated approximately **47.26 million** in booking value during the analysis period.

The overall completion rate remained at **62%**, meaning approximately **38% of booking records did not result in a completed ride**.

---

## Vehicle Type Performance

### Booking Volume and Completion Rate

| Vehicle Type  | Total Bookings | Completed Rides | Completion Rate |
| ------------- | -------------: | --------------: | --------------: |
| Auto          |         37,419 |          23,155 |          61.88% |
| Go Mini       |         29,806 |          18,549 |          62.23% |
| Go Sedan      |         27,141 |          16,676 |          61.44% |
| Bike          |         22,517 |          14,034 |          62.33% |
| Premier Sedan |         18,111 |          11,252 |          62.13% |
| eBike         |         10,557 |           6,551 |          62.05% |
| Uber XL       |          4,449 |           2,783 |          62.55% |

* **Auto** was the most frequently booked vehicle category with **37,419 bookings** and **23,155 completed rides**.
* **Uber XL** recorded the highest completion rate at **62.55%**.
* **Go Sedan** had the lowest completion rate among the vehicle categories at **61.44%**.
* Completion rates were tightly grouped around **61–63%**, indicating relatively consistent completion performance across vehicle categories.

---

## Booking Value by Vehicle Type

| Vehicle Type  | Completed Rides | Total Booking Value | Average Booking Value |
| ------------- | --------------: | ------------------: | --------------------: |
| Auto          |          23,155 |          11,727,615 |                506.48 |
| Go Mini       |          18,549 |           9,411,418 |                507.38 |
| Go Sedan      |          16,676 |           8,538,560 |                512.03 |
| Bike          |          14,034 |           7,144,913 |                509.11 |
| Premier Sedan |          11,252 |           5,733,655 |                509.57 |
| eBike         |           6,551 |           3,298,157 |                503.46 |
| Uber XL       |           2,783 |           1,406,256 |                505.30 |

* **Auto generated the highest total completed booking value at 11,727,615**, primarily supported by its high booking volume.
* Go Mini ranked second with **9,411,418**, followed by Go Sedan with **8,538,560**.
* **Go Sedan recorded the highest average booking value at 512.03**.
* eBike recorded the lowest average booking value at **503.46**.
* Average booking values were relatively similar across vehicle categories despite significant differences in total booking volume.

---

## Payment Method Performance

| Payment Method | Completed Rides | Total Booking Value | Average Booking Value |
| -------------- | --------------: | ------------------: | --------------------: |
| UPI            |          41,834 |          21,274,591 |                508.55 |
| Cash           |          23,114 |          11,756,071 |                508.61 |
| Uber Wallet    |          11,206 |           5,669,070 |                505.90 |
| Credit Card    |           9,320 |           4,753,767 |                510.06 |
| Debit Card     |           7,526 |           3,807,075 |                505.86 |

* **UPI was the dominant payment method**, accounting for **41,834 completed rides** and **21,274,591 in booking value**.
* Cash ranked second with **23,114 completed rides** and **11,756,071 in booking value**.
* Credit Card had the highest average booking value at **510.06**, although its overall booking volume was considerably lower than UPI and Cash.
* Average booking values were similar across payment methods, suggesting that total booking value differences were driven mainly by transaction volume.

---

## Monthly Booking Trends

* **July recorded the highest total booking volume with 12,897 bookings**.
* January followed closely with **12,861 bookings**, while May recorded **12,778 bookings**.
* **February had the lowest booking volume with 11,927 bookings**.
* Monthly booking volumes remained relatively stable throughout the year, generally ranging between approximately **11,900 and 12,900 bookings**.

### Completed Ride Trends

* **March recorded the highest number of completed rides with 7,954**.
* January followed with **7,951 completed rides**.
* May and October each recorded **7,905 completed rides**.
* February recorded the lowest number of completed rides at **7,368**.

---

## Monthly Booking Value

* **March generated the highest monthly completed booking value at 4,174,900**.
* October ranked second with **4,008,403**.
* January generated **4,001,547**.
* February recorded the lowest monthly completed booking value at **3,756,610**.
* Monthly completed booking value remained relatively stable, with no single month overwhelmingly dominating annual performance.

---

## Monthly Completion Rate

* **April recorded the highest completion rate at 62.56%**.
* March followed closely at **62.54%**.
* October recorded a completion rate of **62.49%**.
* **July had the lowest monthly completion rate at 61.46%**.
* Monthly completion rates remained within a narrow range of approximately **61.5% to 62.6%**, indicating stable ride completion performance throughout the year.

---

## Day-of-Week Booking Performance

| Day       | Total Bookings | Completed Rides |
| --------- | -------------: | --------------: |
| Sunday    |         21,398 |          13,314 |
| Monday    |         21,644 |          13,318 |
| Tuesday   |         21,391 |          13,171 |
| Wednesday |         21,413 |          13,296 |
| Thursday  |         21,215 |          13,206 |
| Friday    |         21,397 |          13,253 |
| Saturday  |         21,542 |          13,442 |

* Total booking demand was distributed relatively evenly across the week.
* **Monday recorded the highest total booking volume with 21,644 bookings**.
* **Saturday recorded the highest number of completed rides with 13,442**.
* Thursday had the lowest total booking volume with **21,215 bookings**.

The SQL output showed substantially higher total completed booking value on Saturday and Sunday than on weekdays. This pattern should be validated further before drawing a definitive business conclusion about weekend ride value.

---

## Hourly Booking Demand

Booking demand varied significantly throughout the day.

### Peak Booking Hours

|  Hour | Total Bookings |
| ----: | -------------: |
| 18:00 |         12,397 |
| 19:00 |         11,047 |
| 17:00 |         11,044 |
| 16:00 |          9,633 |
| 20:00 |          9,630 |
| 10:00 |          9,577 |
| 11:00 |          8,390 |
| 09:00 |          8,234 |
| 15:00 |          8,202 |
| 21:00 |          8,103 |

* **6 PM was the busiest booking hour with 12,397 bookings**.
* Demand increased significantly during the late afternoon and early evening.
* The period between **5 PM and 7 PM** represented the strongest concentration of booking activity.
* A secondary demand period was visible during the morning hours, particularly around **9 AM to 11 AM**.
* Overnight booking activity was substantially lower than daytime and evening demand.

---

## Hourly Booking Value

* **6 PM generated the highest completed booking value at 3,908,167**, from **7,617 completed rides**.
* 5 PM ranked second with **3,522,394** in completed booking value.
* 7 PM generated **3,395,818**.
* The results demonstrate that evening peak hours are important not only for booking volume but also for completed booking value.

---

## High-Value Bookings

* The highest individual completed booking value was **4,277**.
* Several of the highest-value rides exceeded **4,000**.
* High-value bookings occurred across multiple vehicle categories, including Go Mini, Bike, Auto, Go Sedan, and eBike.
* High booking value was not limited exclusively to long-distance rides. Some high-value bookings had relatively short recorded ride distances, indicating that booking value may be influenced by factors beyond distance alone.

---

## Key Findings

* **93,000 of 150,000 bookings were completed**, resulting in an overall completion rate of **62%**.
* Completed rides generated approximately **47.26 million in booking value**.
* The average completed booking value was **508.18**.
* **Auto was the largest vehicle category** by both total bookings and completed booking value.
* **Uber XL achieved the highest vehicle completion rate at 62.55%**.
* **Go Sedan recorded the highest average booking value at 512.03**.
* **UPI dominated completed ride payments**, generating approximately **21.27 million in booking value**.
* Monthly demand and completion rates remained relatively stable throughout 2024.
* **March generated the highest monthly completed booking value**, while **April achieved the highest monthly completion rate**.
* **6 PM was the strongest hour for both booking demand and completed booking value**.
* Booking activity showed clear morning and evening demand peaks, with the strongest concentration occurring during evening commuting hours.
* Weekend booking-value results warrant additional validation before being interpreted as a confirmed weekend pricing or revenue pattern.
