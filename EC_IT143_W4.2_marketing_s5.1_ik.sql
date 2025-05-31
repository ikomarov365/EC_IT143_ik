SELECT 
    spend_month,
    total_online_spend
INTO dbo.t_marketing_monthly_spend
FROM dbo.v_marketing_monthly_spend;