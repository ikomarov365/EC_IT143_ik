SELECT 
    Platform,
    total_global_sales
INTO dbo.t_global_sales_by_platform
FROM dbo.v_global_sales_by_platform;
