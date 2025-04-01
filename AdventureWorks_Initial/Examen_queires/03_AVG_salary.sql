/*
¿Cuál es el valor promedio del salario base (Rate) de todos los empleados de la tabla HumanResources.EmployeePayHistory? Opciones:
==> 17,7588

*/

USE AdventureWorks2022;


SELECT * FROM HumanResources.EmployeePayHistory;
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory;

