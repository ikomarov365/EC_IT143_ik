DROP FUNCTION IF EXISTS dbo.udf_parse_first_name;
GO

CREATE FUNCTION dbo.udf_parse_first_name
(
    @FullName VARCHAR(500)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(100);

    -- Extract first name = everything before first space
    SET @FirstName = LEFT(@FullName, CHARINDEX(' ', @FullName + ' ') - 1);

    RETURN @FirstName;
END;
GO