-- search Online for the solution , Google and Stack Overflow
SELECT 
  t.ContactName,
  LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS First_Name_Manual,
  dbo.udf_parse_first_name(t.ContactName) AS First_Name_UDF  -- UDF to be created next
FROM dbo.t_w3_schools_customers AS t
ORDER BY t.ContactName;