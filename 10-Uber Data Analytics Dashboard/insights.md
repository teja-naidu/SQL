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


---

# Vehicle & Location Analytics

## Vehicle Demand Analysis

* **Auto** was the most frequently booked vehicle type with **37,419 total bookings** and **23,155 completed rides**.
* Go Mini ranked second with **29,806 bookings** and **18,549 completed rides**.
* Go Sedan recorded **27,141 bookings** and **16,676 completed rides**.
* Bike accounted for **22,517 bookings** and **14,034 completed rides**.
* Uber XL had the lowest booking volume with **4,449 bookings** and **2,783 completed rides**.
* Vehicle demand is therefore concentrated primarily around Auto, Go Mini, and Go Sedan.

---

## Ride Distance by Vehicle Type

| Vehicle Type  | Completed Rides | Avg. Ride Distance | Total Ride Distance |
| ------------- | --------------: | -----------------: | ------------------: |
| Auto          |          23,155 |              25.99 |          601,788.90 |
| Go Mini       |          18,549 |              25.99 |          482,085.62 |
| Go Sedan      |          16,676 |              25.98 |          433,203.25 |
| Bike          |          14,034 |              26.00 |          364,866.60 |
| Premier Sedan |          11,252 |              25.95 |          291,946.14 |
| eBike         |           6,551 |              26.34 |          172,567.43 |
| Uber XL       |           2,783 |              25.72 |           71,587.90 |

* **Auto generated the highest total ride distance at 601,788.90**, mainly because of its larger ride volume.
* **eBike recorded the highest average ride distance at 26.34**.
* Uber XL recorded the lowest average distance at **25.72**.
* Average ride distances are remarkably similar across vehicle categories, generally remaining around **26 distance units**.

---

## Booking Value per Distance

| Vehicle Type  | Booking Value per KM |
| ------------- | -------------------: |
| Go Sedan      |                19.71 |
| Premier Sedan |                19.64 |
| Uber XL       |                19.64 |
| Bike          |                19.58 |
| Go Mini       |                19.52 |
| Auto          |                19.49 |
| eBike         |                19.11 |

* **Go Sedan recorded the highest booking value per distance unit at 19.71**.
* Premier Sedan and Uber XL followed at **19.64**.
* eBike recorded the lowest value at **19.11**.
* The relatively narrow range indicates similar booking-value efficiency across vehicle categories.

---

## Pickup Location Analysis

* **Khandsa** recorded the highest overall pickup demand with **949 bookings**.
* Barakhamba Road followed with **946 bookings**, while Saket recorded **931 bookings**.
* For completed rides, Khandsa remained the leading pickup location with **600 completed rides**.
* Barakhamba Road ranked second with **594 completed rides**.
* Subhash Chowk ranked third with **582 completed rides**.

### Top Pickup Locations by Completed Booking Value

| Pickup Location | Completed Rides | Booking Value |
| --------------- | --------------: | ------------: |
| Barakhamba Road |             594 |       309,713 |
| Khandsa         |             600 |       309,041 |
| Pataudi Chowk   |             556 |       306,774 |
| Tughlakabad     |             552 |       299,419 |
| Subhash Chowk   |             582 |       299,023 |
| Badarpur        |             567 |       298,309 |
| Inderlok        |             559 |       296,487 |
| AIIMS           |             562 |       296,028 |
| ITO             |             551 |       292,168 |
| Saidulajab      |             543 |       291,251 |

* **Barakhamba Road generated the highest completed booking value among pickup locations at 309,713**.
* Khandsa followed extremely closely at **309,041**.
* High booking volume does not always translate directly into the highest booking value, as demonstrated by Pataudi Chowk and Tughlakabad.

---

## Drop Location Analysis

* **Ashram** was the most frequent overall drop location with **936 bookings**.
* Basai Dhankot ranked second with **917 bookings**, followed by Lok Kalyan Marg with **916 bookings**.
* Ashram also led completed drop-offs with **592 completed rides**.
* Preet Vihar followed with **589 completed rides**, while Sultanpur recorded **584**.

### Top Drop Locations by Completed Booking Value

| Drop Location   | Completed Rides | Booking Value |
| --------------- | --------------: | ------------: |
| Narsinghpur     |             574 |       325,331 |
| Mayur Vihar     |             569 |       301,869 |
| Sultanpur       |             584 |       299,292 |
| Lajpat Nagar    |             572 |       298,564 |
| Sarojini Nagar  |             551 |       298,015 |
| Sarai Kale Khan |             573 |       297,659 |
| Noida Extension |             579 |       296,588 |
| Gwal Pahari     |             558 |       294,219 |
| Lok Kalyan Marg |             560 |       292,900 |
| Punjabi Bagh    |             561 |       292,034 |

* **Narsinghpur generated the highest completed booking value among drop locations at 325,331**.
* Mayur Vihar ranked second with **301,869**.
* Sultanpur combined strong completed ride volume with **299,292 in booking value**.

---

## Route Analysis

### Most Popular Routes

* **DLF City Court → Bhiwadi** was the most frequently booked route with **17 bookings**.
* Janakpuri → Faridabad Sector 15 and Akshardham → RK Puram each recorded **16 bookings**.
* The relatively small counts for even the most popular routes indicate that rides are distributed across a large number of pickup-drop combinations.

### Most Popular Completed Routes

* **Rohini West → Sohna Road** and **DLF City Court → Bhiwadi** each recorded **13 completed rides**.
* Lok Kalyan Marg → Jhilmil, Ambience Mall → Akshardham, Sushant Lok → Sarai Kale Khan, Noida Sector 62 → Sarai Kale Khan, Rithala → Udyog Vihar Phase 4, and Subhash Chowk → IGNOU Road each recorded **11 completed rides**.
* This reinforces the highly distributed nature of route demand.

---

## Highest-Value Routes

* **Nirman Vihar → Vatika Chowk** generated the highest total completed booking value among the ranked routes at **9,284**, across 5 completed rides.
* Ashok Vihar → Basai Dhankot followed closely with **9,280** across 9 completed rides.
* Anand Vihar ISBT → Noida Film City generated **8,960** across 7 completed rides.
* Nirman Vihar → Vatika Chowk also had a particularly high average booking value of **1,856.80**.

High-value routes are not necessarily the routes with the largest booking volumes, highlighting the difference between demand concentration and booking-value contribution.

---

## Long-Distance Route Analysis

Among routes with at least five completed rides:

* **Shivaji Park → Ashram** recorded the highest average ride distance at **43.69**.
* Inderlok → ITO followed at **43.59**.
* IMT Manesar → Subhash Nagar averaged **42.95**.
* Tughlakabad → Inderlok averaged **42.73**.
* Meerut → Connaught Place averaged **42.71**.

The longest recurring routes averaged more than **40 distance units**, substantially above the overall completed-ride average of approximately 26.

---

## Pickup Location Completion Performance

Among pickup locations with at least 500 bookings:

### Highest Completion Rates

| Pickup Location | Total Bookings | Completed Rides | Completion Rate |
| --------------- | -------------: | --------------: | --------------: |
| Welcome         |            836 |             554 |          66.27% |
| Subhash Chowk   |            887 |             582 |          65.61% |
| Yamuna Bank     |            824 |             534 |          64.81% |
| IMT Manesar     |            840 |             544 |          64.76% |
| RK Puram        |            850 |             550 |          64.71% |

* **Welcome recorded the highest pickup-location completion rate at 66.27%**.
* This is more than four percentage points above the overall dataset completion rate of 62%.

### Lowest Completion Rates

| Pickup Location | Total Bookings | Completed Rides | Completion Rate |
| --------------- | -------------: | --------------: | --------------: |
| Vinobapuri      |            823 |             450 |          54.68% |
| Akshardham      |            839 |             471 |          56.14% |
| Chhatarpur      |            829 |             482 |          58.14% |
| Badshahpur      |            868 |             506 |          58.29% |
| Pragati Maidan  |            920 |             538 |          58.48% |

* **Vinobapuri recorded the lowest completion rate at 54.68%**.
* Akshardham followed at **56.14%**.
* The gap between the highest and lowest observed pickup-location completion rates is approximately **11.6 percentage points**.
* These differences suggest that booking completion performance varies meaningfully by pickup location and warrants deeper cancellation analysis.

---

## Distance Segment Analysis

| Distance Category    | Completed Rides | Avg. Booking Value | Total Booking Value |
| -------------------- | --------------: | -----------------: | ------------------: |
| Short (1–10 km)      |          15,524 |             503.34 |           7,813,891 |
| Medium (11–25 km)    |          28,983 |             508.71 |          14,743,954 |
| Long (26–40 km)      |          29,245 |             508.30 |          14,865,125 |
| Very Long (41–50 km) |          19,248 |             511.10 |           9,837,604 |

* **Long-distance rides between 26–40 km formed the largest segment with 29,245 completed rides**.
* This segment also generated the highest booking value at **14,865,125**.
* Medium-distance rides were close behind with **28,983 completed rides** and **14,743,954 in booking value**.
* Very long rides recorded the highest average booking value at **511.10**.
* Short rides had the lowest average booking value at **503.34**.
* Average booking value increases only modestly across distance categories, indicating that distance alone may not fully explain booking-value variation.

---

## Vehicle Booking Value Ranking

Based on completed booking value:

1. **Auto — 11,727,615**
2. **Go Mini — 9,411,418**
3. **Go Sedan — 8,538,560**
4. **Bike — 7,144,913**
5. **Premier Sedan — 5,733,655**
6. **eBike — 3,298,157**
7. **Uber XL — 1,406,256**

Auto clearly leads total booking value due to its substantially larger completed ride volume.

---

## Key Findings

* **Auto is the dominant vehicle category**, leading both booking volume and completed booking value.
* Average ride distance is remarkably consistent across vehicle types at approximately **26 distance units**.
* **Go Sedan generated the highest booking value per distance unit at 19.71**.
* **Khandsa leads overall pickup demand**, while **Barakhamba Road leads pickup-location completed booking value**.
* **Ashram is the most common drop location**, while **Narsinghpur generates the highest completed booking value among drop locations**.
* Route demand is highly fragmented, with even the most frequently booked individual route recording only **17 bookings**.
* **Welcome achieved the highest pickup-location completion rate at 66.27%**, while **Vinobapuri recorded the lowest at 54.68%** among locations meeting the 500-booking threshold.
* Long rides between **26–40 km** represent the largest distance segment and generate the highest total booking value.
* Very long rides have the highest average booking value at **511.10**.
* Location-level completion-rate differences indicate potential operational opportunities that can be investigated further through cancellation and driver-performance analysis.

---

# Cancellation, Driver & Customer Experience Analytics

## Overall Booking Outcome

- Total Bookings: **150,000**
- Completed Rides: **93,000**
- Driver Cancellations: **27,000**
- Customer Cancellations: **10,500**
- No Driver Found: **10,500**
- Incomplete Rides: **9,000**
- Average Driver Rating: **4.23**
- Average Customer Rating: **4.40**

The overall ride completion rate remained at **62%**, while driver cancellations accounted for **18%** of all bookings. Customer cancellations and no-driver-found bookings each represented **7%**, while incomplete rides accounted for **6%**.

---

## Customer Cancellation Analysis

Customer cancellations totaled **10,500 bookings**.

### Customer Cancellation Reasons

| Cancellation Reason | Cancelled Bookings | Percentage |
|---|---:|---:|
| Wrong Address | 2,362 | 22.50% |
| Change of plans | 2,353 | 22.41% |
| Driver is not moving towards pickup location | 2,335 | 22.24% |
| Driver asked to cancel | 2,295 | 21.86% |
| AC is not working | 1,155 | 11.00% |

- **Wrong Address** was the most common customer cancellation reason, accounting for **22.50%** of customer cancellations.
- Change of plans followed closely at **22.41%**.
- Driver movement toward the pickup location contributed to **22.24%** of cancellations.
- Customers reporting that the driver asked them to cancel accounted for **21.86%**.
- AC-related issues were less common but still represented **11%** of customer cancellations.
- The relatively even distribution across the four largest reasons indicates that customer cancellations are driven by multiple factors rather than one dominant issue.

---

## Driver Cancellation Analysis

Driver cancellations totaled **27,000 bookings**, making them the largest unsuccessful booking category.

### Driver Cancellation Reasons

| Cancellation Reason | Cancelled Bookings | Percentage |
|---|---:|---:|
| Customer related issue | 6,837 | 25.32% |
| The customer was coughing/sick | 6,751 | 25.00% |
| Personal & Car related issues | 6,726 | 24.91% |
| More than permitted people in there | 6,686 | 24.76% |

- **Customer related issues** were the most frequently recorded driver cancellation reason at **25.32%**.
- Customer illness-related cancellations represented **25.00%**.
- Personal or vehicle-related issues accounted for **24.91%**.
- Passenger-capacity issues represented **24.76%**.
- Driver cancellation reasons are distributed almost equally across the four recorded categories.

---

## Incomplete Ride Analysis

A total of **9,000 rides** were classified as incomplete.

| Incomplete Ride Reason | Rides | Percentage |
|---|---:|---:|
| Customer Demand | 3,040 | 33.78% |
| Vehicle Breakdown | 3,012 | 33.47% |
| Other Issue | 2,948 | 32.76% |

- **Customer Demand** was the largest incomplete-ride reason at **33.78%**.
- Vehicle breakdowns accounted for **33.47%**.
- Other issues represented **32.76%**.
- All three categories contributed almost equally to incomplete rides.

---

## Driver Cancellation Rate by Vehicle Type

| Vehicle Type | Total Bookings | Driver Cancellations | Cancellation Rate |
|---|---:|---:|---:|
| Go Sedan | 27,141 | 5,031 | 18.54% |
| Bike | 22,517 | 4,077 | 18.11% |
| eBike | 10,557 | 1,907 | 18.06% |
| Premier Sedan | 18,111 | 3,250 | 17.94% |
| Go Mini | 29,806 | 5,330 | 17.88% |
| Auto | 37,419 | 6,643 | 17.75% |
| Uber XL | 4,449 | 762 | 17.13% |

- **Go Sedan had the highest driver cancellation rate at 18.54%**.
- Bike and eBike followed at **18.11% and 18.06%**, respectively.
- **Uber XL had the lowest driver cancellation rate at 17.13%**.
- Driver cancellation rates are relatively close across vehicle categories.

---

## Customer Cancellation Rate by Vehicle Type

- **Uber XL recorded the highest customer cancellation rate at 7.35%**.
- Auto followed at **7.16%**.
- Go Mini recorded **7.04%**.
- **Go Sedan had the lowest customer cancellation rate at 6.75%**.
- Overall customer cancellation rates remained close to the platform-wide rate of approximately 7%.

---

## No Driver Found Analysis

- **Go Sedan had the highest no-driver-found rate at 7.22%**.
- Auto followed at **7.16%**.
- Uber XL recorded **7.08%**.
- **Bike had the lowest rate at 6.67%**.
- Differences across vehicle categories were relatively small, indicating that driver availability issues are not isolated to a single vehicle category.

---

## Monthly Cancellation Trends

### Driver Cancellations

- **August recorded the highest number of driver cancellations with 2,351**.
- July followed with **2,332**, while January recorded **2,324**.
- **September had the lowest driver cancellation count at 2,165**.
- Monthly driver cancellations remained relatively stable throughout the year.

### Customer Cancellations

- **July recorded the highest customer cancellation count with 932**.
- May followed with **919**, while March recorded **906**.
- **April had the lowest customer cancellation count at 779**.
- Similar to driver cancellations, customer cancellations did not show extreme month-to-month volatility.

---

## Hourly Cancellation Analysis

### Driver Cancellations

- **6 PM recorded the highest number of driver cancellations with 2,257**.
- 5 PM followed with **2,003**.
- 7 PM recorded **1,998 driver cancellations**.
- The strongest concentration of driver cancellations occurred during the evening demand peak.

### Customer Cancellations

- **6 PM also recorded the highest customer cancellations with 889**.
- 7 PM followed with **822**.
- 5 PM recorded **746 customer cancellations**.

The concentration of both driver and customer cancellations around **5 PM–7 PM** corresponds with the peak booking-demand period identified earlier in the analysis.

---

## Pickup Location Cancellation Analysis

### Highest Driver Cancellation Counts

- Nehru Place: **190**
- Shivaji Park: **185**
- GTB Nagar: **183**
- Pragati Maidan: **179**
- Saket: **179**

### Highest Driver Cancellation Rates

Among pickup locations with at least 500 bookings:

| Pickup Location | Total Bookings | Driver Cancellations | Cancellation Rate |
|---|---:|---:|---:|
| Nehru Place | 885 | 190 | 21.47% |
| Vinobapuri | 823 | 176 | 21.39% |
| GTB Nagar | 872 | 183 | 20.99% |
| Munirka | 815 | 171 | 20.98% |
| Qutub Minar | 823 | 172 | 20.90% |
| Chhatarpur | 829 | 173 | 20.87% |
| Rajouri Garden | 852 | 176 | 20.66% |
| Shivaji Park | 900 | 185 | 20.56% |
| Shahdara | 820 | 168 | 20.49% |
| Vatika Chowk | 833 | 170 | 20.41% |

- **Nehru Place had the highest driver cancellation rate at 21.47%**, substantially above the overall driver cancellation rate of 18%.
- Vinobapuri followed closely at **21.39%**.
- These locations may represent areas where driver availability, pickup conditions, traffic, or other operational factors deserve further investigation.

---

## Driver Rating Analysis

- Overall Average Driver Rating: **4.23**
- Driver ratings ranged from **3.0 to 5.0**.
- **Uber XL recorded the highest average driver rating at 4.24**.
- All other vehicle categories averaged approximately **4.23**.
- Driver-rating performance was therefore highly consistent across vehicle categories.

The most frequently observed driver ratings included:

- **4.3 — 14,081 ratings**
- **4.2 — 13,841 ratings**
- **4.6 — 9,368 ratings**
- **4.4 — 7,018 ratings**
- **4.1 — 6,966 ratings**

---

## Customer Rating Analysis

- Overall Average Customer Rating: **4.40**
- Customer ratings ranged from **3.0 to 5.0**.
- **Go Sedan recorded the highest average customer rating at 4.41**.
- All remaining vehicle categories averaged approximately **4.40**.

Frequently observed customer ratings included:

- **4.9 — 11,642 ratings**
- **4.6 — 11,533 ratings**
- **4.3 — 10,995 ratings**
- **4.2 — 10,697 ratings**
- **4.5 — 5,890 ratings**

---

## Driver vs Customer Ratings

Across every vehicle category, average customer ratings were higher than average driver ratings.

- Go Sedan: **4.23 driver vs 4.41 customer**
- Go Mini: **4.23 vs 4.40**
- eBike: **4.23 vs 4.40**
- Uber XL: **4.24 vs 4.40**
- Premier Sedan: **4.23 vs 4.40**
- Bike: **4.23 vs 4.40**
- Auto: **4.23 vs 4.40**

The difference was approximately **0.17–0.18 rating points** across vehicle categories.

---

## Low Rating Analysis

### Driver Ratings Below 4.0

- Auto: **5,188 rides**
- Go Mini: **4,261 rides**
- Go Sedan: **3,762 rides**
- Bike: **3,195 rides**
- Premier Sedan: **2,504 rides**
- eBike: **1,500 rides**
- Uber XL: **611 rides**

### Customer Ratings Below 4.0

- Auto: **3,199 rides**
- Go Mini: **2,645 rides**
- Go Sedan: **2,212 rides**
- Bike: **1,976 rides**
- Premier Sedan: **1,603 rides**
- eBike: **901 rides**
- Uber XL: **367 rides**

Auto has the largest number of low-rated rides, but it also has the highest overall ride volume. Therefore, these counts should not be interpreted as evidence that Auto has worse rating performance without comparing rates.

---

## Key Findings

- **Driver cancellations are the largest operational issue**, accounting for 27,000 bookings and **18% of total demand**.
- Customer cancellation reasons are diverse, with Wrong Address being the largest individual reason at **22.50%**.
- Driver cancellation reasons are almost evenly distributed across four major categories.
- **Go Sedan has the highest driver cancellation rate at 18.54%**, while Uber XL has the lowest at 17.13%.
- Both driver and customer cancellations peak around **6 PM**, coinciding with the platform's highest-demand period.
- **Nehru Place has the highest driver cancellation rate among high-volume pickup locations at 21.47%**.
- Average ratings remain strong, with **4.23 for drivers and 4.40 for customers**.
- Rating performance varies very little across vehicle categories.
- Customer ratings are consistently around **0.17–0.18 points higher than driver ratings**.
- The combination of high evening demand and elevated cancellation counts suggests that peak-hour operational capacity should be investigated further.