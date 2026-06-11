# CUSTOMER SEGMENTATION
# Segment customers into age groups and then compare customer count, credit limit, and transaction amount

SELECT
    CASE
        WHEN Customer_Age < 30 THEN 'Under 30'
        WHEN Customer_Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Customer_Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customer_count,
    ROUND(AVG(Credit_Limit), 2) AS avg_credit_limit,
    ROUND(AVG(Total_Trans_Amt), 2) AS avg_transaction_amount
FROM credit_card_customers
GROUP BY age_group
ORDER BY customer_count DESC;

# Analyze customer financial behavior by income category, Compares average credit limit, transaction amount, and utilization
SELECT
    Income_Category,
    ROUND(AVG(Credit_Limit), 2) AS avg_credit_limit,
    ROUND(AVG(Total_Trans_Amt), 2) AS avg_transaction_amount,
    ROUND(AVG(Avg_Utilization_Ratio), 2) AS avg_utilization
FROM credit_card_customers
GROUP BY Income_Category
ORDER BY avg_credit_limit DESC;
