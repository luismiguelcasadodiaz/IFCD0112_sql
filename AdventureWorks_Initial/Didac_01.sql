-- 01 Subtotalizar por mes cuantos hombres o mejeres se han contratado

SELECT MONTH(HireDate) as mes , 
	COALESCE(Gender,'Subtotal mes') as genero, 
	count(*) as totalempleados,
	GROUPING(Gender) as agrupadoPorGenero,
	GROUPING(MONTH(HireDate)) as agrupadoPorMes
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  GROUP BY ROLLUP(MONTH(HireDate) , Gender)

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