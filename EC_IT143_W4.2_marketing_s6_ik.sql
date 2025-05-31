TRUNCATE TABLE dbo.t_marketing_monthly_spend;

INSERT INTO dbo.t_marketing_monthly_spend (spend_month, total_online_spend)
SELECT 
    spend_month,
    total_online_spend
FROM dbo.v_marketing_monthly_spend;