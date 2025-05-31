-- Q: What is the total global sales per platform?
-- A: Let’s run the stored procedure and review the result.

EXEC dbo.usp_global_sales_by_platform_load;

SELECT * FROM dbo.t_global_sales_by_platform;
