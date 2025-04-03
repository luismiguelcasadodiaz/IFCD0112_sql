/*
Crea una tabla de dos columnas. 
La primera columna es el nombre del departamento (HumanResources.Department).
La segunda consulta es la lista, separando cada empleado con una barra verticale "|", 
del apellido y el nombre (Person.Person), separados por una coma,  de cada empleado del departamento.

La tabla mostrará los datos de los departamentos con menos de 4 empleados.

*/

SELECT 
    d.Name AS Departamento,
    STRING_AGG(p.FirstName + ', ' + p.LastName, ' | ') AS Empleados,
	Count (*) as empleados
FROM HumanResources.EmployeeDepartmentHistory dh
JOIN Person.Person p ON dh.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.Department d ON dh.DepartmentID = d.DepartmentID
GROUP BY dh.DepartmentID, d.Name
HAVING Count (*) < 4;


SELECT ps.ProductCategoryID
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.ListPrice > 0
GROUP BY ps.ProductCategoryID
HAVING AVG(p.ListPrice) BETWEEN 100 AND 150 
       AND COUNT(p.ProductID) >= 5;
