USE AdventureWorks2022

SELECT TOP 2 p.LastName
FROM HumanResources.EmployeePayHistory eph
JOIN HumanResources.Employee e ON eph.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY eph.Rate DESC;