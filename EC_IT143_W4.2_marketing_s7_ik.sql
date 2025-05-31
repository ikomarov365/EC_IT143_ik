CREATE OR ALTER PROCEDURE dbo.usp_marketing_monthly_spend_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_marketing_monthly_spend_load
PURPOSE: Load total monthly online marketing spend into a table from a view

MODIFICATION LOG:
Ver      Date        Author   Description
-----   ----------   -------  -------------------------------------------------------------------------------
1.0     05/31/2025   IKOMAROV Initial version for EC IT143 - Step 7

RUNTIME: 1s

NOTES: This stored procedure supports regular refresh of marketing analytics summary table.
******************************************************************************************************************/
BEGIN
    TRUNCATE TABLE dbo.t_marketing_monthly_spend;

    INSERT INTO dbo.t_marketing_monthly_spend (spend_month, total_online_spend)
    SELECT 
        spend_month,
        total_online_spend
    FROM dbo.v_marketing_monthly_spend;
END;