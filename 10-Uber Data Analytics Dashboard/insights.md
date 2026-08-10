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
