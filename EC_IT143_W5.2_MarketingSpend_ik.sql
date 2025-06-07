
/*****************************************************************************************************************
NAME:    EC_IT143_FinalProject_MarketingSpend_Answers_ik.sql
PURPOSE: To answer 4 questions about the Marketing_Spend dataset using SQL.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/05/2025   IKOMAROV      1. Initial version - answers to 4 questions for Final Project Marketing_Spend.

RUNTIME: 
Varies

NOTES: 
This script answers questions based on the Marketing_Spend table for the e-commerce marketing team.
******************************************************************************************************************/

SET statistics time on;

SELECT GETDATE() AS my_date;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q1: What is the total online marketing spend per month, and how does it compare with offline spend trends?       */
/* Author: Ilia Komarov                                                                                             */
/* A1: Aggregate online and offline spend by month.                                                                 */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT 
    FORMAT(Date, 'yyyy-MM') AS Month,
    SUM(Online_Spend) AS Total_Online_Spend,
    SUM(Offline_Spend) AS Total_Offline_Spend
FROM Marketing_Spend
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Month;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q2: Which specific months had the highest online marketing spend, and do those correlate with seasonal periods?   */
/* Author: Ilia Komarov                                                                                             */
/* A2: List months ordered by total online spend, descending.                                                       */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT 
    FORMAT(Date, 'yyyy-MM') AS Month,
    SUM(Online_Spend) AS Total_Online_Spend
FROM Marketing_Spend
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Total_Online_Spend DESC;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q3: What’s the average daily online spend for each quarter?                                                      */
/* Author: Ilia Komarov                                                                                             */
/* A3: Average daily online spend per quarter per year.                                                             */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT 
    DATEPART(YEAR, Date) AS Year,
    DATEPART(QUARTER, Date) AS Quarter,
    AVG(Online_Spend) AS Avg_Daily_Online_Spend
FROM Marketing_Spend
GROUP BY DATEPART(YEAR, Date), DATEPART(QUARTER, Date)
ORDER BY Year, Quarter;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q4: What percentage of marketing spend was allocated to online vs. offline channels?                              */
/* Author: Jeremy Carrera                                                                                            */
/* A4: Calculate % split between online and offline marketing spend overall.                                         */
/* --------------------------------------------------------------------------------------------------------------- */

WITH TotalSpend AS (
    SELECT 
        SUM(Online_Spend) AS Total_Online_Spend,
        SUM(Offline_Spend) AS Total_Offline_Spend
    FROM Marketing_Spend
)
SELECT 
    Total_Online_Spend,
    Total_Offline_Spend,
    ROUND(Total_Online_Spend * 100.0 / (Total_Online_Spend + Total_Offline_Spend), 2) AS Online_Spend_Percent,
    ROUND(Total_Offline_Spend * 100.0 / (Total_Online_Spend + Total_Offline_Spend), 2) AS Offline_Spend_Percent
FROM TotalSpend;
