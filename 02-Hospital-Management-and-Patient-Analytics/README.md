# Hospital Management and Patient Analytics using SQL

## Project Overview

Healthcare organizations generate large amounts of data every day through patient registrations, appointments, treatments, and billing activities. The goal of this project is to analyze hospital operations and uncover meaningful insights using SQL.

In this project, I worked with multiple healthcare datasets to understand patient behavior, doctor performance, appointment trends, treatment patterns, and revenue generation. The analysis was performed using DuckDB and SQL, with results documented through screenshots and business insights.

This project helped strengthen my SQL skills while demonstrating how data can be used to support operational and financial decision making in a healthcare environment.

---

## Dataset Information

The project consists of five datasets that represent different areas of hospital operations.

### Patients

Contains patient demographic details, contact information, registration dates, and insurance information.

### Doctors

Contains doctor details including specialization, years of experience, hospital branch, and contact information.

### Appointments

Stores appointment records, appointment status, visit reasons, and doctor-patient interactions.

### Treatments

Contains treatment details, treatment types, descriptions, costs, and treatment dates.

### Billing

Stores billing information including payment amounts, payment methods, and payment status.

---

## Business Questions Answered

During this project, I focused on answering questions such as:

* How many patients are registered in the hospital?
* What does the patient demographic distribution look like?
* Which insurance providers are most commonly used?
* Which doctor specializations are most represented?
* What are the most common reasons for hospital visits?
* Which doctors handle the highest appointment volume?
* Which hospital branches receive the most appointments?
* Which treatment types are performed most frequently?
* Which treatments generate the highest revenue?
* How do patients prefer to make payments?
* Which patients contribute the highest revenue?
* Which doctors generate the most treatment revenue?

---

## SQL Skills Demonstrated

### Data Exploration

* Data validation
* Record counting
* Descriptive analysis

### Aggregation and Grouping

* COUNT()
* SUM()
* AVG()
* GROUP BY
* ORDER BY

### Joins

* Inner Joins
* Multi-table joins across patients, appointments, treatments, and billing data

### Advanced SQL

* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* Running Totals
* Top-N Analysis

---

## Analysis Performed

### Patient and Doctor Analytics

* Patient demographic analysis
* Gender distribution analysis
* Insurance provider analysis
* Doctor specialization analysis
* Experience analysis
* Hospital branch distribution

### Appointment Analytics

* Appointment status analysis
* Visit reason analysis
* Doctor workload analysis
* Branch-level appointment analysis
* Patient appointment frequency analysis
* Appointment trend analysis

### Treatment Analytics

* Treatment distribution analysis
* Treatment cost analysis
* High-cost treatment identification

### Revenue Analytics

* Revenue by treatment type
* Revenue by payment method
* Payment status analysis
* Revenue trend analysis
* Top revenue-generating patients
* Doctor revenue analysis

### Advanced SQL Analytics

* Patient spending analysis using CTEs
* Revenue ranking analysis
* Patient ranking analysis
* Treatment ranking analysis
* Running revenue calculations
* Revenue contribution analysis

---

## Key Insights

Some of the key observations from the analysis include:

* Patient records were distributed across multiple insurance providers.
* Appointment activity revealed patterns in patient engagement and attendance.
* Certain treatment types generated significantly higher revenue than others.
* Revenue contribution varied across doctors and treatment categories.
* Advanced SQL techniques helped identify high-value patients and top-performing doctors.

---

## Project Structure

```text
02-Hospital-Management-and-Patient-Analytics
│
├── Outputs
├── appointments.csv
├── billing.csv
├── doctors.csv
├── patients.csv
├── treatments.csv
├── queries.sql
├── insights.md
├── README.md
└── .gitignore
```

---

## Tools Used

* SQL
* DuckDB
* Visual Studio Code
* Git
* GitHub

---

## What I Learned

This project gave me hands-on experience working with healthcare-related datasets and applying SQL to solve real business problems.

It also helped me gain deeper experience with joins, aggregations, window functions, ranking techniques, and revenue analysis. Most importantly, it reinforced how SQL can be used not just to retrieve data, but to generate actionable business insights.

