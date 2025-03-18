-- 01 Subtotalizar por mes cuantos hombres o mujeres se han contratado

SELECT MONTH(HireDate) as mes , 
	COALESCE(Gender,'Subtotal mes') as genero, 
	count(*) as totalempleados,
	GROUPING(Gender) as agrupadoPorGenero,
	GROUPING(MONTH(HireDate)) as agrupadoPorMes
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  GROUP BY rollup(MONTH(HireDate) , Gender)

-- 02 En que mes se han contratado mas

SELECT TOP 1 * FROM
(
	SELECT MONTH(HireDate) as mes , 
		COALESCE(Gender,'Subtotal mes') as genero, 
		count(*) as totalempleados,
		GROUPING(Gender) as agrupadoPorGenero,
		GROUPING(MONTH(HireDate)) as agrupadoPorMes
	FROM [AdventureWorks2022].[HumanResources].[Employee]
	GROUP BY ROLLUP(MONTH(HireDate) , Gender)
) 
as subconsulta
WHERE agrupadoPorGenero = 1 and mes is not null
ORDER BY totalempleados DESC;


SELECT top 1 mes, max(totalempleados) as Maximo FROM
(
	SELECT MONTH(HireDate) as mes , 
		COALESCE(Gender,'Subtotal mes') as genero, 
		count(*) as totalempleados,
		GROUPING(Gender) as agrupadoPorGenero,
		GROUPING(MONTH(HireDate)) as agrupadoPorMes
	  FROM [AdventureWorks2022].[HumanResources].[Employee]
	  GROUP BY ROLLUP(MONTH(HireDate) , Gender)

) 
as subconsulta
WHERE mes is not null
GROUP BY mes;