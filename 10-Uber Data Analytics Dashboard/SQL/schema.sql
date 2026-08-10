-- ============================================================
-- Uber Ride Bookings Analytics
-- Database Schema
-- ============================================================

CREATE OR REPLACE TABLE uber_bookings AS
SELECT *
FROM read_csv_auto('Datasets/ncr_ride_bookings.csv');

-- Verify table creation
DESCRIBE uber_bookings;