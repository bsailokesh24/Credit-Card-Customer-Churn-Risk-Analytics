# CHURN ANALYSIS
# Calculate the Overall Churn Rate. This shows the percentage of existing customers VS attrited customers
SELECT Attrition_Flag, COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*) FROM credit_card_customers),2) AS percentage
FROM credit_card_customers
GROUP BY Attrition_Flag;

# Calculate the Churn Rate by Income. This helps to understand which income groups have higher attrition
SELECT Income_Category, COUNT(*) AS total_customers,
	SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_customers,
	ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM credit_card_customers
GROUP BY Income_Category
ORDER BY churn_rate DESC;

# Calculate the churn rate by card category. This helps to identify which cards types have higher attrition risk
SELECT Card_Category, COUNT(*) AS total_customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM credit_card_customers
GROUP BY Card_Category
ORDER BY churn_rate DESC;
