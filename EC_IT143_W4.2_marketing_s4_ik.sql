DROP VIEW IF EXISTS dbo.v_marketing_monthly_spend;
GO

CREATE VIEW dbo.v_marketing_monthly_spend
AS
/*****************************************************************************************************************
NAME:    dbo.v_marketing_monthly_spend
PURPOSE: Create a view showing total online marketing spend per month

MODIFICATION LOG:
Ver      Date        Author   Description
-----   ----------   -------  -------------------------------------------------------------------------------
1.0     05/31/2025   IKOMAROV Initial creation for EC IT143

RUNTIME: 1s

NOTES: This view prepares monthly aggregated online spend for reporting and analytics.
******************************************************************************************************************/

SELECT 
    FORMAT(CAST(Date AS DATE), 'yyyy-MM') AS spend_month,
    SUM(Online_Spend) AS total_online_spend
FROM dbo.Marketing_Spend
GROUP BY FORMAT(CAST(Date AS DATE), 'yyyy-MM');