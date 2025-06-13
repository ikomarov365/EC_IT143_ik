-- Q1: How to keep track of when a record was last modified?
-- A1: This works for the initial INSERT...

-- clean up old objects
IF OBJECT_ID('dbo.trg_hello_world_last_mod','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_hello_world_last_mod;
GO
IF OBJECT_ID('dbo.t_hello_world','U') IS NOT NULL
    DROP TABLE dbo.t_hello_world;
GO

-- 1) create table with only my_message + current_date_time
CREATE TABLE dbo.t_hello_world
(
    my_message        VARCHAR(25) NOT NULL PRIMARY KEY,
    current_date_time DATETIME    NOT NULL DEFAULT GETDATE(),
    -- we'll add last_modified_date next
    last_modified_date DATETIME   NULL,
    -- last_modified_by will come in step 6
    last_modified_by   VARCHAR(50) NULL
);
GO

-- 2) insert our existing “Hello World1” row *before* adding the DEFAULT
INSERT INTO dbo.t_hello_world(my_message)
VALUES ('Hello World1');
GO

-- 3) now add a DEFAULT so *future* INSERTs get GETDATE()
ALTER TABLE dbo.t_hello_world
    ADD DEFAULT GETDATE() FOR last_modified_date;
GO