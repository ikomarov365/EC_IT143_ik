SELECT 
  t.ContactName,
  LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS First_Name_Manual
FROM dbo.t_w3_schools_customers AS t
ORDER BY t.ContactName;