
/*****************************************************************************************************************
NAME:    EC_IT143_FinalProject_VideoGameSales_Answers_ik.sql
PURPOSE: To answer 4 questions about the Video_Games_Sales_as_at_22_Dec_2016 dataset using SQL.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/05/2025   IKOMAROV      1. Initial version - answers to 4 questions for Final Project Video_Game_Sales.

RUNTIME: 
Varies

NOTES: 
This script answers questions based on the Video_Games_Sales_as_at_22_Dec_2016 dataset.
******************************************************************************************************************/

SET statistics time on;

SELECT GETDATE() AS my_date;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q1: How do regional sales of Xbox One and PS4 games compare across North America and Europe?                     */
/* Author: Ilia Komarov                                                                                             */
/* A1: Aggregate NA and EU sales for Xbox One and PS4 platforms.                                                     */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT 
    Platform,
    SUM(NA_Sales) AS Total_NA_Sales,
    SUM(EU_Sales) AS Total_EU_Sales
FROM Video_Games_Sales_as_at_22_Dec_2016
WHERE Platform IN ('XOne', 'PS4')
GROUP BY Platform
ORDER BY Platform;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q2: Which video game genre generated the most global revenue, and how much was generated in total by that genre?  */
/* Author: Piero Valencia — this question was asked by another student, but I found it interesting to adapt to my data set. */
/* A2: Aggregate global sales by genre and return the top genre.                                                    */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT TOP 1
    Genre,
    SUM(Global_Sales) AS Total_Global_Sales
FROM Video_Games_Sales_as_at_22_Dec_2016
GROUP BY Genre
ORDER BY Total_Global_Sales DESC;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q3: I want to understand the sales performance of top publishers. Which genre does each of the top 5 publishers   */
/* sell the most, and how much have they generated in total for that genre?                                         */
/* Author: Akan Nyong — this question was asked by another student, but I found it interesting to adapt to my data set. */
/* A3: Find top 5 publishers by global sales, then find their top genre and total sales.                            */
/* --------------------------------------------------------------------------------------------------------------- */

WITH PublisherSales AS (
    SELECT 
        Publisher,
        SUM(Global_Sales) AS Total_Global_Sales
    FROM Video_Games_Sales_as_at_22_Dec_2016
    GROUP BY Publisher
),
Top5Publishers AS (
    SELECT TOP 5 Publisher
    FROM PublisherSales
    ORDER BY Total_Global_Sales DESC
),
GenreSales AS (
    SELECT 
        Publisher,
        Genre,
        SUM(Global_Sales) AS Total_Genre_Sales
    FROM Video_Games_Sales_as_at_22_Dec_2016
    WHERE Publisher IN (SELECT Publisher FROM Top5Publishers)
    GROUP BY Publisher, Genre
),
RankedGenres AS (
    SELECT 
        Publisher,
        Genre,
        Total_Genre_Sales,
        RANK() OVER (PARTITION BY Publisher ORDER BY Total_Genre_Sales DESC) AS GenreRank
    FROM GenreSales
)
SELECT 
    Publisher,
    Genre,
    Total_Genre_Sales
FROM RankedGenres
WHERE GenreRank = 1
ORDER BY Publisher;

/* --------------------------------------------------------------------------------------------------------------- */
/* Q4: I'm interested in which game platforms have the highest total sales globally and how they compare.            */
/* Author: Evans Jango — this question was asked by another student, but I found it interesting to adapt to my data set. */
/* A4: Aggregate total global sales per platform.                                                                  */
/* --------------------------------------------------------------------------------------------------------------- */

SELECT 
    Platform,
    SUM(Global_Sales) AS Total_Global_Sales
FROM Video_Games_Sales_as_at_22_Dec_2016
GROUP BY Platform
ORDER BY Total_Global_Sales DESC;
