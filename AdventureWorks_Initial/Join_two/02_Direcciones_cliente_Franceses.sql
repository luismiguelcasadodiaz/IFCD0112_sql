USE AdventureWorks2022;

-- DiDac ha sugerido empezar sin los alias en le primer ejemplo de Joins.
-- Es mejor tras ver todo lo que hay que escribir, pner los alias como ejemplo de simplificacion

set statistics time on
Select 
P.LastName + ', ' + P.FirstName as Persona,
A.AddressLine1 as Direccion,
A.City as ciudad,
A.PostalCode as codigo_postal,
SP.Name as Provincia
from Person.Person as P
inner join  Person.BusinessEntity as BE
on BE.BusinessEntityID = P.BusinessEntityID
inner join Person.BusinessEntityAddress as BEA
on BEA.BusinessEntityID = BE.BusinessEntityID
inner join Person.Address as A
on A.AddressID = BEA.AddressID
inner join Person.StateProvince as SP
on SP.StateProvinceID = A.StateProvinceID
inner join Person.CountryRegion as CR
on CR.CountryRegionCode = SP.CountryRegionCode
Where CR.CountryRegionCode = 'FR';




-- Erik sugiere usar los Joins Implicitos 
set statistics time on
Select 
p.LastName + ', ' + P.FirstName as Persona,
A.AddressLine1 as Direccion,
A.City as ciudad,
A.PostalCode as codigo_postal,
SP.Name as Provincia
from 
  Person.Person as P, 
  Person.BusinessEntity as BE, 
  Person.BusinessEntityAddress as BEA,  
  Person.Address as A, 
  Person.StateProvince as SP,
  Person.CountryRegion as CR
WHERE 
	BE.BusinessEntityID = P.BusinessEntityID AND 
	BEA.BusinessEntityID = BE.BusinessEntityID AND
	A.AddressID = BEA.AddressID AND
	SP.StateProvinceID = A.StateProvinceID AND
	CR.CountryRegionCode = SP.CountryRegionCode AND
	CR.CountryRegionCode = 'FR';
-- No hay diferencias de velocidad significativas entre los join implicitos y los explicitos
/*
JOIN EXPLICITO
SQL Server parse and compile time: 
   CPU time = 16 ms, elapsed time = 41 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

(1811 rows affected)

 SQL Server Execution Times:
   CPU time = 16 ms,  elapsed time = 73 ms.
--------------^^


Completion time: 2025-03-19T10:58:50.4281235+01:00

JOIN IMPLICITOS
(1811 rows affected)

 SQL Server Execution Times:
   CPU time = 15 ms,  elapsed time = 91 ms.
--------------^^

   */