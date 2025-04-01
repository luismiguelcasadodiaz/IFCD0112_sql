/*

¿Cuál es el apellido del empleado de mayor edad? -- Jiang
*/

SELECT top 1 p.LastName as apellido, E.BirthDate as Nacido
FROM [AdventureWorks2022].[HumanResources].[Employee] as E
Inner JOIN [AdventureWorks2022].[Person].[Person] as P
on P.BusinessEntityID = E.BusinessEntityID
order by Nacido