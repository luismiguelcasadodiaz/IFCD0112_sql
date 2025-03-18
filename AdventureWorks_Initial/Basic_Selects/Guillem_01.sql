-- cuantas personas tiene middleName una 'A'
  SELECT count(*) 
  FROM [AdventureWorks2022].[Person].[Person]
  WHERE MiddleName = 'A';

-- Cuantas personas hay para cada letra del abecedario en middleName
  SELECT MiddleName, count(*) 
  FROM [AdventureWorks2022].[Person].[Person]
  WHERE LEN(MiddleName) = 1
  GROUP BY MiddleName
  ORDER BY MiddleName

    SELECT MiddleName, count(*) 
  FROM [AdventureWorks2022].[Person].[Person]
  WHERE MiddleName LIKE '_'
  GROUP BY MiddleName