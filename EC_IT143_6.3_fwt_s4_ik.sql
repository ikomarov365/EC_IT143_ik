-- ************************************************************************************
-- NAME:    dbo.trg_hello_world_last_mod
-- PURPOSE: Hello World - Last Modified Date Trigger
--
-- MODIFICATION LOG:
-- Ver   Date        Author    Description
-- ----- ---------- --------- -------------------------------------------------------------
-- 1.9   06/12/2026  ikomar    Built this script for EC IT143
--
-- RUNTIME: 0s
-- NOTES:  Keep track of the last_modified_date for each row in the table.
-- ************************************************************************************
GO

-- drop existing if present
IF OBJECT_ID('dbo.trg_hello_world_last_mod','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_hello_world_last_mod;
GO

CREATE TRIGGER dbo.trg_hello_world_last_mod
ON dbo.t_hello_world
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.t_hello_world
       SET last_modified_date = GETDATE()
     WHERE my_message IN (
           SELECT my_message FROM inserted
     );
END;
GO