/*
  SELECT MIN([HireDate]), MAX([HireDate]) 
  FROM [AdventureWorks2022].[HumanResources].[Employee]

  Fecha Inicial	Fecha Final
  2006-06-30	2013-05-30

Resume todos los registros de la tabla de empleados [HumanResources].[Employee] para saber 
cuántas personas de cada género (Gender) se contratan cada mes (HireDate) 
de forma que puedas aislar el mes en el que se han contratado
menos mujeres para poder contestar a las pregunta:

¿En que mes se han contratado menos mujeres?

*/-- 01 Subtotalizar por mes cuantos hombres o mujeres se han contratado

/*SELECT MONTH(HireDate) as mes , 
	COALESCE(Gender,'Subtotal mes') as genero, 
	count(*) as totalempleados,
	GROUPING(Gender) as agrupadoPorGenero,
	GROUPING(MONTH(HireDate)) as agrupadoPorMes
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  GROUP BY rollup(MONTH(HireDate) , Gender)
  */
-- 02 En que mes se han contratado mas

SELECT TOP 1 mes FROM
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
WHERE agrupadoPorGenero = 0 and genero = 'F' and mes is not null
ORDER BY totalempleados ASC;
