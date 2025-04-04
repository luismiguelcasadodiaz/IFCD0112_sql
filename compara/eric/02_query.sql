USE AdventureWorks2022

SELECT TOP 1 p.LastName
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY e.BirthDate ASC;
