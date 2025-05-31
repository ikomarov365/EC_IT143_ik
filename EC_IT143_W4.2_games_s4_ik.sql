DROP VIEW IF EXISTS dbo.v_global_sales_by_platform;
GO

CREATE VIEW dbo.v_global_sales_by_platform
AS
/*****************************************************************************************************************
NAME:    dbo.v_global_sales_by_platform
PURPOSE: Summarize total global video game sales by platform

MODIFICATION LOG:
Ver      Date        Author      Description
-----   ----------   ----------  -------------------------------------------------------
1.0     05/31/2025   IKOMAROV    Initial version for EC IT143

RUNTIME: 1s

NOTES: This view aggregates global sales per platform across all games.
******************************************************************************************************************/
SELECT 
    Platform,
    SUM(Global_Sales) AS total_global_sales
FROM dbo.Video_Games_Sales_as_at_22_Dec_2016
GROUP BY Platform;
