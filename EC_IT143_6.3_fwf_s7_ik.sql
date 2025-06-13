WITH NameCompare AS
(
    SELECT 
        t.ContactName,
        LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS First_Name_Manual,
        dbo.udf_parse_first_name(t.ContactName) AS First_Name_UDF
    FROM dbo.t_w3_schools_customers AS t
)
SELECT * 
FROM NameCompare
WHERE First_Name_Manual <> First_Name_UDF;  -- Expect 0 rows