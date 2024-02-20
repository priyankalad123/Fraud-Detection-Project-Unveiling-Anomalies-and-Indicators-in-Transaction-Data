create database fraud_detection;
use fraud_detection;
show tables;
DESCRIBE fraud1;
SELECT * FROM fraud1 WHERE amount IS NULL LIMIT 0, 1000;
SELECT DISTINCT * FROM fraud1;

##### What is the distribution of transaction amounts?
SELECT MIN(amount) AS min_amount, MAX(amount) AS max_amount, AVG(amount) AS avg_amount
FROM fraud1;

#### Are there any unusual patterns in transaction frequency or amounts?
SELECT DATE(step) AS transaction_day, COUNT(*) AS transaction_count
FROM fraud1
GROUP BY transaction_day
ORDER BY transaction_day
LIMIT 1000;

#### Which customers have the highest number of transactions?
SELECT nameOrig AS customer_id, COUNT(*) AS transaction_count
FROM fraud1
GROUP BY nameOrig
ORDER BY transaction_count DESC
LIMIT 10;

#### What is the average transaction amount for each customer?
SELECT nameOrig AS customer_id, AVG(amount) AS avg_transaction_amount
FROM fraud1
GROUP BY nameOrig
LIMIT 1000;

#### How do transaction patterns vary by time of day, day of the week, or month?
SELECT HOUR(step) AS hour_of_day, COUNT(*) AS transaction_count
FROM fraud1
GROUP BY hour_of_day
LIMIT 1000;

#### Are there any geographical regions with higher incidences of fraud?
SELECT nameDest AS destination_region, COUNT(*) AS transaction_count
FROM fraud1
WHERE isFraud = 1
GROUP BY nameDest
LIMIT 1000;

#### How do transaction patterns differ across different locations?
SELECT nameDest, AVG(amount) AS avg_transaction_amount
FROM fraud1
GROUP BY nameDest
LIMIT 1000;
