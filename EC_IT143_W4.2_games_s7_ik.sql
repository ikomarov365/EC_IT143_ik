CREATE OR ALTER PROCEDURE dbo.usp_global_sales_by_platform_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_global_sales_by_platform_load
PURPOSE: Load summarized global sales per platform into the destination table

MODIFICATION LOG:
Ver      Date        Author      Description
-----   ----------   ----------  -----------------------------------------
1.0     05/31/2025   IKOMAROV    Initial version for EC IT143 Step 7

RUNTIME: 1s

NOTES: This procedure supports refresh of global sales summary by platform.
******************************************************************************************************************/
BEGIN
    TRUNCATE TABLE dbo.t_global_sales_by_platform;

    INSERT INTO dbo.t_global_sales_by_platform (Platform, total_global_sales)
    SELECT 
        Platform,
        total_global_sales
    FROM dbo.v_global_sales_by_platform;
END;
