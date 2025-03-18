
SELECT largo,clave, max(numnom) FROM
(
  SELECT LEN(FirstName) as largo, 
  FirstName,  
  count(*) as numnom,
  cast(LEN(FirstName) as varchar) + '-'+ cast(count(*) as varchar) as clave
  FROM [AdventureWorks2022].[Person].[Person]
  GROUP BY ROLLUP (LEN(FirstName), FirstName)
) as subconsulta

GROUP by largo, clave
