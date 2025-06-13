WITH NameCompare AS
(
    SELECT
        t.ContactName,
        -- Manual method using LEFT() + CHARINDEX()
        LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS First_Name_Manual,
        
        -- UDF method
        dbo.udf_parse_first_name(t.ContactName) AS First_Name_UDF
    FROM dbo.t_w3_schools_customers AS t
)
-- In Step 6 → SELECT all rows → to visually compare results side by side
SELECT 
    NameCompare.ContactName,
    NameCompare.First_Name_Manual,
    NameCompare.First_Name_UDF
FROM NameCompare
ORDER BY NameCompare.ContactName;