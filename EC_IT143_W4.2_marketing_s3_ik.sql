SELECT 
    FORMAT(CAST(Date AS DATE), 'yyyy-MM') AS spend_month,
    SUM(Online_Spend) AS total_online_spend
FROM dbo.Marketing_Spend
GROUP BY FORMAT(CAST(Date AS DATE), 'yyyy-MM');