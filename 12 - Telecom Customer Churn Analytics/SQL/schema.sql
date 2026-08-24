-- Create the main customer churn table
CREATE OR REPLACE TABLE telecom_customer_churn AS
SELECT *
FROM read_csv_auto(
    'data/telecom_customer_churn.csv',
    header = true
);

-- Create ZIP code population table
CREATE OR REPLACE TABLE zipcode_population AS
SELECT *
FROM read_csv_auto(
    'data/telecom_zipcode_population.csv',
    header = true
);

-- Verify tables
SHOW TABLES;

-- Inspect main dataset structure
DESCRIBE telecom_customer_churn;

-- Inspect population dataset
DESCRIBE zipcode_population;