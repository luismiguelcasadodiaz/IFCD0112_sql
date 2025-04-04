USE AdventureWorks2022

SELECT d.Name AS Departamento,
       STRING_AGG(p.LastName + ', ' + p.FirstName, ' | ') AS Empleados
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
GROUP BY d.Name
HAVING COUNT(e.BusinessEntityID) < 4;