-- Customer Churn Analysis Project
-- Author: Fartoon Mohammed
-- Purpose: Identify patterns in customer churn using SQL


-- 1. Total Customers and Churn Count
SELECT 
COUNT(*) AS total_customers,
SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS churned_customers
FROM customers;

-- 2. Churn Rate by Contract Type
SELECT
Contract, 
COUNT(*) AS total_customers,
SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(100.0 * SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Contract;

-- 3. Average Monthly Charges by Customer Status
SELECT
Customer_Status,
AVG(Monthly_Charge) AS avg_month_charge
FROM customers
GROUP BY Customer_Status;

-- 4. Churn by Tenure Group
SELECT
CASE
WHEN Tenure_in_Months < 12 THEN '0-1 year'
WHEN Tenure_in_Months BETWEEN 12 AND 24 THEN '1-2 years'
ELSE '2+ years'
END AS tenure_group,
COUNT(*) AS total_customers,
SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY tenure_group;
