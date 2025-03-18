SELECT   
Title, 
PersonType, 
YEAR(ModifiedDate) as año, 
count(BusinessEntityID) as TotalEmpleados
FROM [AdventureWorks2022].[Person].[Person]
WHERE Title in ('Mr.', 'Ms.') and PersonType = 'EM' and YEAR(ModifiedDate) between 2009 AND 2013
GROUP BY ROLLUP(Title, PersonType, YEAR(ModifiedDate)) 

