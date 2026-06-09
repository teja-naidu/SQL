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