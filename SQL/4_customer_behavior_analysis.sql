# CUSTOMER BEHAVIOR ANALYSIS
# CTE: Create a temporary churn summary table by card category, then calculate churn rate from that summary
WITH churn_summary AS (
    SELECT Card_Category,
		COUNT(*) AS total_customers,
        SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_customers
    FROM credit_card_customers
    GROUP BY Card_Category
)
SELECT
    Card_Category, total_customers, churned_customers,
    ROUND(churned_customers * 100.0 / total_customers, 2) AS churn_rate
FROM churn_summary
ORDER BY churn_rate DESC;

# Window function: Rank customers by transaction amount within each income category
# This identifies top spenders in every income group
SELECT CLIENTNUM, Income_Category, Card_Category, Total_Trans_Amt,
    RANK() OVER (
        PARTITION BY Income_Category
        ORDER BY Total_Trans_Amt DESC
    ) AS spending_rank
FROM credit_card_customers;
