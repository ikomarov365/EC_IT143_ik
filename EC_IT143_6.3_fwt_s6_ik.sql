-- Q4: How to keep track of who last modified a record?
-- A4: This works for the initial INSERT (server user)...

-- add our “who” column default
ALTER TABLE dbo.t_hello_world
    ADD DEFAULT SUSER_NAME() FOR last_modified_by;
GO

-- clean up test rows again (leave Hello World1)
DELETE 
  FROM dbo.t_hello_world
 WHERE my_message IN ('Hello World2','Hello World4');
GO

-- re-insert
INSERT INTO dbo.t_hello_world(my_message)
VALUES ('Hello World2'),('Hello World3');
GO

SELECT * 
  FROM dbo.t_hello_world AS t;
GO

-- update one
UPDATE dbo.t_hello_world
   SET my_message = 'Hello World4'
 WHERE my_message = 'Hello World3';
GO

SELECT * 
  FROM dbo.t_hello_world AS t;
GO