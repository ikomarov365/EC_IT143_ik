/*
Missing Index Details from SQLQuery37.sql - RENTAL-9GWJ733.AdventureWorks2022 (RENTAL-9GWJ733\Rental (53))
The Query Processor estimates that implementing the following index could improve the query cost by 91.0545%.
*/

/*
USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Person].[Address] ([City])

GO
*/

USE [AdventureWorks2022]
GO

CREATE NONCLUSTERED INDEX IX_my_index
ON [Person].[Address] ([City])
GO