-- What is the total online marketing spend per month?
-- Let’s run the stored procedure to update and review the table

EXEC dbo.usp_marketing_monthly_spend_load;

SELECT * FROM dbo.t_marketing_monthly_spend;