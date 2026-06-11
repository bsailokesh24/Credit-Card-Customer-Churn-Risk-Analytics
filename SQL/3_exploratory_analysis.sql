# EXPLORATORY ANALYSIS
# Count the customers by attrition status. This analysis shows how many customers stayed and how many left
SELECT Attrition_Flag, COUNT(*) AS customer_count
FROM credit_card_customers
GROUP BY Attrition_Flag;

# Count the customers by Gender
SELECT Gender, COUNT(*) AS customer_count
FROM credit_card_customers
GROUP BY Gender;

# Count the customers by there income category. This helps to understand the financial distibutation of customers.
SELECT Income_Category, COUNT(*) AS customer_count
FROM credit_card_customers
GROUP BY Income_Category
ORDER BY customer_count DESC;

# Count the Customers by Credit Card Category. This divides the customers using blue, silver, gold and platinium cards.
SELECT Card_Category, COUNT(*) AS customer_count
FROM credit_card_customers
GROUP BY Card_Category
ORDER BY customer_count DESC;