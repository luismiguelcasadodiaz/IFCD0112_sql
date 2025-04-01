/*
¿Cuál es el apellido(Person.person) del empleado (HumanResources.Employee) con el segundo salario base más alto (HumanResources.EmployeePayHistory.Rate)?
==> Hamilton
*/

SELECT P.LastName as apellido, EPH.Rate as salario FROM HumanResources.Employee as E
INNER JOIN HumanResources.EmployeePayHistory as EPH
ON EPH.BusinessEntityID = E.BusinessEntityID
INNER JOIN Person.Person as P
ON P.BusinessEntityID = E.BusinessEntityID
ORDER BY salario DESC;