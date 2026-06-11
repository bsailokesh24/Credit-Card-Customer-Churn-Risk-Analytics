# RISK SCORING
# Assign each customer a risk segment based on behavior 
# High Risk includes attrited customers and inactive low-transaction customers

SELECT
    CLIENTNUM,
    Customer_Age,
    Income_Category,
    Card_Category,
    Months_Inactive_12_mon,
    Contacts_Count_12_mon,
    Total_Trans_Ct,
    Total_Trans_Amt,
    CASE
        WHEN Attrition_Flag = 'Attrited Customer' THEN 'High Risk'
        WHEN Months_Inactive_12_mon >= 3 AND Total_Trans_Ct < 40 THEN 'High Risk'
        WHEN Months_Inactive_12_mon >= 2 OR Contacts_Count_12_mon >= 3 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS customer_risk_segment
FROM credit_card_customers;

# Summarize how many customers fall into each risk segment
SELECT
    customer_risk_segment,
    COUNT(*) AS customer_count
FROM (
    SELECT
        CASE
            WHEN Attrition_Flag = 'Attrited Customer' THEN 'High Risk'
            WHEN Months_Inactive_12_mon >= 3 AND Total_Trans_Ct < 40 THEN 'High Risk'
            WHEN Months_Inactive_12_mon >= 2 OR Contacts_Count_12_mon >= 3 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS customer_risk_segment
    FROM credit_card_customers
) AS risk_table
GROUP BY customer_risk_segment
ORDER BY customer_count DESC;
