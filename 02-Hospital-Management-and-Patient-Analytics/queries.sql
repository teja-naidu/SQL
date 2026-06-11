-- =====================================================
-- Hospital Management and Patient Analytics
-- SQL Project #2
-- Author: Teja
-- =====================================================

-- Query 1: Total Patients
SELECT COUNT(*) AS total_patients
FROM patients;

-- Query 2: Patients by Gender
SELECT gender,
       COUNT(*) AS patient_count
FROM patients
GROUP BY gender
ORDER BY patient_count DESC;

-- Query 3: Patients by Insurance Provider
SELECT insurance_provider,
       COUNT(*) AS patient_count
FROM patients
GROUP BY insurance_provider
ORDER BY patient_count DESC;

-- Query 4: Doctors by Specialization
SELECT specialization,
       COUNT(*) AS doctor_count
FROM doctors
GROUP BY specialization
ORDER BY doctor_count DESC;

-- Query 5: Average Experience by Specialization
SELECT specialization,
       ROUND(AVG(years_experience),2) AS avg_experience
FROM doctors
GROUP BY specialization
ORDER BY avg_experience DESC;

-- Query 6: Total Doctors
SELECT COUNT(*) AS total_doctors
FROM doctors;

-- Query 7: Total Appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- Query 8: Total Treatments
SELECT COUNT(*) AS total_treatments
FROM treatments;

-- Query 9: Total Billing Records
SELECT COUNT(*) AS total_billing_records
FROM billing;

-- Query 10: Doctors by Hospital Branch
SELECT
    hospital_branch,
    COUNT(*) AS doctor_count
FROM doctors
GROUP BY hospital_branch
ORDER BY doctor_count DESC;

-- Query 11: Appointment Status Distribution
SELECT
    status,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY status
ORDER BY appointment_count DESC;

-- Query 12: Most Common Visit Reasons
SELECT
    reason_for_visit,
    COUNT(*) AS visit_count
FROM appointments
GROUP BY reason_for_visit
ORDER BY visit_count DESC;

-- Query 13: Top Doctors by Appointment Count
SELECT
    d.first_name || ' ' || d.last_name AS doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    d.first_name,
    d.last_name,
    d.specialization
ORDER BY total_appointments DESC;

-- Query 14: Appointment Volume by Hospital Branch
SELECT
    d.hospital_branch,
    COUNT(a.appointment_id) AS appointment_count
FROM appointments a
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY d.hospital_branch
ORDER BY appointment_count DESC;

-- Query 15: Patient Appointment Frequency
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY total_appointments DESC;

-- Query 16: Monthly Appointment Trend
SELECT
    strftime(appointment_date, '%Y-%m') AS month,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY month
ORDER BY month;

-- Query 17: Treatment Type Distribution
SELECT
    treatment_type,
    COUNT(*) AS treatment_count
FROM treatments
GROUP BY treatment_type
ORDER BY treatment_count DESC;

-- Query 18: Revenue by Treatment Type
SELECT
    treatment_type,
    ROUND(SUM(cost),2) AS total_revenue
FROM treatments
GROUP BY treatment_type
ORDER BY total_revenue DESC;

-- Query 19: Most Expensive Treatments
SELECT
    treatment_id,
    treatment_type,
    cost
FROM treatments
ORDER BY cost DESC
LIMIT 10;

-- Query 20: Revenue by Payment Method
SELECT
    payment_method,
    ROUND(SUM(amount),2) AS total_revenue
FROM billing
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Query 21: Payment Status Analysis
SELECT
    payment_status,
    COUNT(*) AS bill_count,
    ROUND(SUM(amount),2) AS total_amount
FROM billing
GROUP BY payment_status
ORDER BY total_amount DESC;

-- Query 22: Top Revenue Generating Patients
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    ROUND(SUM(b.amount),2) AS total_spent
FROM patients p
JOIN billing b
    ON p.patient_id = b.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY total_spent DESC
LIMIT 10;

-- Query 23: Monthly Revenue Trend
SELECT
    strftime(bill_date, '%Y-%m') AS month,
    ROUND(SUM(amount),2) AS monthly_revenue
FROM billing
GROUP BY month
ORDER BY month;

-- Query 24: Doctor Revenue Analysis
SELECT
    d.first_name || ' ' || d.last_name AS doctor_name,
    d.specialization,
    ROUND(SUM(t.cost),2) AS total_revenue
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
GROUP BY
    d.first_name,
    d.last_name,
    d.specialization
ORDER BY total_revenue DESC;

-- Query 25: Top Spending Patients Using CTE

WITH patient_spending AS (
    SELECT
        patient_id,
        SUM(amount) AS total_spent
    FROM billing
    GROUP BY patient_id
)
SELECT *
FROM patient_spending
ORDER BY total_spent DESC;

-- Query 26: Doctor Revenue Ranking

SELECT
    d.first_name || ' ' || d.last_name AS doctor_name,
    ROUND(SUM(t.cost),2) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(t.cost) DESC
    ) AS revenue_rank
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
GROUP BY
    d.first_name,
    d.last_name
ORDER BY revenue_rank;

-- Query 27: Patient Revenue Ranking

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    ROUND(SUM(b.amount),2) AS total_spent,
    DENSE_RANK() OVER(
        ORDER BY SUM(b.amount) DESC
    ) AS spending_rank
FROM patients p
JOIN billing b
    ON p.patient_id = b.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY spending_rank;

-- Query 28: Most Expensive Treatment Per Type

WITH treatment_rank AS (
    SELECT
        treatment_type,
        treatment_id,
        cost,
        ROW_NUMBER() OVER(
            PARTITION BY treatment_type
            ORDER BY cost DESC
        ) AS rn
    FROM treatments
)
SELECT *
FROM treatment_rank
WHERE rn = 1;

-- Query 29: Running Revenue Trend

SELECT
    bill_date,
    amount,
    SUM(amount) OVER(
        ORDER BY bill_date
    ) AS running_revenue
FROM billing
ORDER BY bill_date
LIMIT 10;

-- Query 30: Revenue Contribution by Treatment Type

SELECT
    treatment_type,
    ROUND(SUM(cost),2) AS revenue,
    ROUND(
        SUM(cost) * 100.0 /
        (SELECT SUM(cost) FROM treatments),
        2
    ) AS revenue_percentage
FROM treatments
GROUP BY treatment_type
ORDER BY revenue DESC;

-- Query 31: Top 5 Doctors by Revenue

SELECT
    d.first_name || ' ' || d.last_name AS doctor_name,
    d.specialization,
    ROUND(SUM(t.cost),2) AS total_revenue
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
GROUP BY
    d.first_name,
    d.last_name,
    d.specialization
ORDER BY total_revenue DESC
LIMIT 5;

-- Query 32: Top 5 Patients by Spending

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    ROUND(SUM(b.amount),2) AS total_spent
FROM patients p
JOIN billing b
    ON p.patient_id = b.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY total_spent DESC
LIMIT 5;