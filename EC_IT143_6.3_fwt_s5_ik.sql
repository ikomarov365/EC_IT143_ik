-- Q3: Did it work?
-- A3: Well, let's see... yup

DELETE FROM dbo.t_hello_world
 WHERE my_message IN ('Hello World2','Hello World3','Hello World4');
GO

--  insert two new rows
INSERT INTO dbo.t_hello_world(my_message)
VALUES ('Hello World2'),('Hello World3');
GO

-- inspect after INSERT
SELECT * 
  FROM dbo.t_hello_world AS t;
GO

--  update one of them
UPDATE dbo.t_hello_world
   SET my_message = 'Hello World4'
 WHERE my_message = 'Hello World3';
GO

--  inspect after UPDATE
SELECT *
  FROM dbo.t_hello_world AS t;
GO