USE AdventureWorks2022

SELECT 
    d.Name AS Departamento,
    STUFF((
        SELECT ' | ' + p.LastName + ', ' + p.FirstName
        FROM HumanResources.EmployeeDepartmentHistory edh2
        JOIN Person.Person p ON edh2.BusinessEntityID = p.BusinessEntityID
        WHERE edh2.DepartmentID = d.DepartmentID
        FOR XML PATH('')
    ), 1, 3, '') AS Empleados
FROM HumanResources.Department d
WHERE (
    SELECT COUNT(DISTINCT BusinessEntityID)
    FROM HumanResources.EmployeeDepartmentHistory edh
    WHERE edh.DepartmentID = d.DepartmentID
) < 4;