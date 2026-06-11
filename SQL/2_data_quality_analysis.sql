# DATA QUALITY
# Check the total number of customers in the dataset
SELECT COUNT(*) AS total_customers
FROM credit_card_customers;

# Check if any customer ID appears more than once
# If return no rows, then there are no duplicate customer records.
SELECT CLIENTNUM, COUNT(*) AS duplicate_count
FROM credit_card_customers
GROUP BY CLIENTNUM
HAVING COUNT(*) > 1;

# Check Missing Values, if the result is 0 then there are no missing values in that column
SELECT 
    SUM(CASE WHEN Customer_Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN Income_Category IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN Credit_Limit IS NULL THEN 1 ELSE 0 END) AS missing_credit_limit
FROM credit_card_customers; 