-- Diferencias entres GRUOPU BY con ROLLUP() y sin ROLLUP()

SELECT Gender, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY Gender;


SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY Gender, MaritalStatus;




SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM  [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (Gender, MaritalStatus);
