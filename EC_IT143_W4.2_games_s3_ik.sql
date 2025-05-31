SELECT 
    Platform,
    SUM(Global_Sales) AS total_global_sales
FROM dbo.Video_Games_Sales_as_at_22_Dec_2016
GROUP BY Platform;
