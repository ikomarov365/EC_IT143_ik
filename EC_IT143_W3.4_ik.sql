/******************************************************************************
**************************************************************************
NAME: 3.4AdventureWorks_Answers.sql
PURPOSE: SQL answers to selected user questions using the AdventureWorks database

MODIFICATION LOG:
Ver     Date        Author      Description
-----   ----------  ----------  ----------------------------------------------
1.0     05/24/2025  IliaKomarov Script to answer 8 AdventureWorks questions

RUNTIME:
Xm Xs

NOTES:
This script answers selected questions using AdventureWorks database.
**************************************************************************
******************************************************************************/

/* 
-- Q1: Which five helmet products record the highest ListPrice values in the Production.Product table?
-- A1: This query returns the top 5 helmet products by list price.
-- Author: IliaKomarov
*/
SELECT TOP 5 Name, ListPrice
FROM Production.Product
WHERE Name LIKE '%Helmet%'
ORDER BY ListPrice DESC;
/* 
-- Q2: Which SalesPersonID has the most orders in the Sales.SalesOrderHeader table?
-- A2: Finds the salesperson with the most sales orders.
-- Author: IliaKomarov
*/
SELECT TOP 1 SalesPersonID, COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID
ORDER BY TotalOrders DESC;

/* 
-- Q3: Which three employees have the highest salaries? Show name and salary.
-- A3: This query shows the top 3 employees with the highest base rates.
-- Author: CHUKWUKA BOSAH
*/
SELECT TOP 3 p.FirstName + ' ' + p.LastName AS FullName, e.Rate AS Salary
FROM HumanResources.EmployeePayHistory e
JOIN HumanResources.Employee emp ON e.BusinessEntityID = emp.BusinessEntityID
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID
ORDER BY e.Rate DESC;


/* 
-- Q4: How many orders were made in 2021, and what is the total revenue?
-- A4: Returns count and total due for all orders placed in 2021.
-- Author: CHUKWUKA BOSAH
*/
SELECT COUNT(*) AS TotalOrders, SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2021;


/* 
-- Q5: List the top 10 customers who purchased the most in 2022, with their names, number of orders, and total amount spent.
-- A5: Shows the top 10 customers by order count and total due.
-- Author: CHUKWUKA BOSAH
*/
SELECT TOP 10 p.FirstName + ' ' + p.LastName AS FullName, 
       COUNT(h.SalesOrderID) AS NumberOfOrders,
       SUM(h.TotalDue) AS TotalSpent
FROM Sales.SalesOrderHeader h
JOIN Sales.Customer c ON h.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE YEAR(h.OrderDate) = 2022
GROUP BY p.FirstName, p.LastName
ORDER BY TotalSpent DESC;


/* 
-- Q6: Find all territories with sales below $100,000 last year, and break them down by quarter and product category.
-- A6: Aggregates revenue by territory, quarter, and category, filtered to those under $100k.
-- Author: CHUKWUKA BOSAH
*/
SELECT t.Name AS Territory,
       DATEPART(QUARTER, h.OrderDate) AS Quarter,
       pc.Name AS ProductCategory,
       SUM(d.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader h
JOIN Sales.SalesOrderDetail d ON h.SalesOrderID = d.SalesOrderID
JOIN Sales.SalesTerritory t ON h.TerritoryID = t.TerritoryID
JOIN Production.Product p ON d.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE YEAR(h.OrderDate) = 2024
GROUP BY t.Name, DATEPART(QUARTER, h.OrderDate), pc.Name
HAVING SUM(d.LineTotal) < 100000;


/* 
-- Q7: Which tables contain a column named 'ProductID'?
-- A7: Lists all tables that have a column called 'ProductID' using INFORMATION_SCHEMA.
-- Author: CHUKWUKA BOSAH
*/
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID';
/* 
-- Q8: List all views in the AdventureWorks database that include the word 'Sales'.
-- A8: Finds views that contain 'Sales' in their name using INFORMATION_SCHEMA.
-- Author: CHUKWUKA BOSAH
*/
SELECT TABLE_NAME AS ViewName
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME LIKE '%Sales%';