/*
 Nombre: 05_resumiendo con ROLLUP()
 Autor: Luis MIguel Casado Díaz
 Created: 2025-03-15
 Last Modified: 2025-03-15 by Jane Smith
 Propósito: Explicar el funcionamiento de la cluausula ROLLUP().
 Version: 1.1

Finalidad de ROLLUP() en SQL Server
La función ROLLUP() se utiliza en la cláusula GROUP BY.
La usamos para generar subtotales y totales acumulativos en un conjunto de resultados.

Permite analizar datos en múltiples niveles de agregación, lo que es útil para 
informes y análisis de datos.

La syntaxis es 
SELECT columna1, columna2, ..., función_agregada(columna_agregada)
FROM tabla
GROUP BY ROLLUP (columna1, columna2, ...);


Considerando solo dos columnas estado_civil y género

Tenemos estas combinaciones
SELECT		GROUP BY ROLLUP()
G M			G M
G M			M G
M G			M G
M G			G M
*/

SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (Gender, MaritalStatus);

/*
Gender	MaritalStatus	TotalVentas
F		M				49
F		S				35
F		NULL			84
M		M				97
M		S				109
M		NULL			206
NULL	NULL			290
*/
SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender);

/*
Gender	MaritalStatus	Empleados
F		M				49
M		M				97
NULL	M				146
F		S				35
M		S				109
NULL	S				144
NULL	NULL			290
*/

SELECT MaritalStatus, Gender, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender);

/*
MaritalStatus	Gender	TotalVentas
M				F		49
M				M		97
M				NULL	146
S				F		35
S				M		109
S				NULL	144
NULL			NULL	290
*/

SELECT MaritalStatus, Gender, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (Gender, MaritalStatus);


/*
MaritalStatus	Gender	TotalVentas
M				F		49
S				F		35
NULL			F		84
M				M		97
S				M	1	09
NULL			M	2	06
NULL			NULL	290
*/

/*
Para ayudarnos a identificar qué fila es un subtotal, podemos añadir
columnas al resultado de nuestra consulta con la función GROUPING( columna)
QUe nos marcará con un uno la fila que sitei un sibtotal para la columna
*/

SELECT MaritalStatus, Gender, count(*) AS TotalVentas,
    GROUPING(MaritalStatus) as Grupo_EstadoCivil,
    GROUPING(Gender) as Grupo_genero
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender)

SELECT  Gender, MaritalStatus,count(*) AS TotalVentas,
    GROUPING(MaritalStatus) as Grupo_EstadoCivil,
    GROUPING(Gender) as Grupo_genero
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP ( Gender, MaritalStatus)


/* veamos un ejemplo con tres columnas de resumen */

/*suma las ventas diarias y calcula el subtotal por mes y por año
SELECT 
	YEAR(OrderDate) AS año, 
	MONTH(OrderDate) AS Mes, 
	DAY(OrderDate) AS día,
	FORMAT(SUM(TotalDue), 'C', 'en-US') AS TotalVentas,
    GROUPING(YEAR(OrderDate)) as AgrupandoAño,
    GROUPING(MONTH(OrderDate)) as AgrupandoMes, 
	GROUPING(DAY(orderdate)) as Agrupandoday
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP (YEAR(OrderDate), MONTH(OrderDate), Day(orderDate))
ORDER BY YEAR(OrderDate), MONTH(OrderDate), DAY(orderdate);