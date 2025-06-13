DROP FUNCTION IF EXISTS dbo.udf_parse_last_name;
GO

CREATE FUNCTION dbo.udf_parse_last_name
(
    @FullName VARCHAR(500)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @LastName VARCHAR(100);
    DECLARE @FirstSpacePos INT;

    -- Find position of first space
    SET @FirstSpacePos = CHARINDEX(' ', @FullName);

    IF @FirstSpacePos = 0
    BEGIN
        -- No space → return empty string
        SET @LastName = '';
    END
    ELSE
    BEGIN
        -- Use SUBSTRING to safely take everything after the first space
        SET @LastName = LTRIM(SUBSTRING(@FullName, @FirstSpacePos + 1, LEN(@FullName)));
    END

    RETURN @LastName;
END;
GO

SELECT
    t.CustomerID,
    t.CustomerName,
    t.ContactName,
    dbo.udf_parse_first_name(t.ContactName) AS ContactName_First_Name,  -- Extract First Name using UDF
    dbo.udf_parse_last_name(t.ContactName)  AS ContactName_Last_Name,   -- Extract Last Name using UDF
    t.Address,
    t.City,
    t.Country
FROM dbo.t_w3_schools_customers AS t
ORDER BY t.ContactName;