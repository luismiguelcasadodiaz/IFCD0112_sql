USE AdventureWorks2022

SELECT COUNT(*) AS EmpleadosConMasDe17Anios
FROM HumanResources.Employee
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 17;