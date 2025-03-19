USE AdventureWorks2022;

Select s.Name 

FROM 
Sales.Store as S
inner join sales.SalesPerson as SP
on sp.BusinessEntityID = s.BusinessEntityID
inner join sales.SalesTerritory as ST
on ST.TerritoryID = SP.TerritoryID
WHERE ST.CountryRegionCode = 'CA'


Select s.Name , count(*) as Direcciones
FROM 
Sales.Store as S
inner join Person.BusinessEntity as BE
on BE.BusinessEntityID = s.BusinessEntityID
inner join Person.BusinessEntityAddress as BEA
on BEA.BusinessEntityID = BE.BusinessEntityID
inner join Person.Address as A
on A.AddressID = BEA.AddressID
inner join person.StateProvince as SP
on SP.StateProvinceID = A.StateProvinceID
inner join Person.CountryRegion as CR
on CR.CountryRegionCode = SP.CountryRegionCode
WHERE CR.Name = 'Canada'
group by  s.Name
Having count(*) > 1
