USE AdventureWorks2022

SELECT COUNT(*) AS NumEmpleados
FROM HumanResources.Employee
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 17;