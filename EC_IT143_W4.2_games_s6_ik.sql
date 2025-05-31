TRUNCATE TABLE dbo.t_global_sales_by_platform;

INSERT INTO dbo.t_global_sales_by_platform (Platform, total_global_sales)
SELECT 
    Platform,
    total_global_sales
FROM dbo.v_global_sales_by_platform;
