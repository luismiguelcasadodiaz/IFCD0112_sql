-- Total del coste standard y toal lista de precios de producto agrupando por color y linea de producot
 
USE AdventureWorks2022;

SELECT 
	p.Color, 
	p.ProductLine,
	SUM(p.StandardCost) as TotalStdCost,
	SUM(p.ListPrice) as TotalListPrice,
	GROUPING(p.Color) as grupoColor,
	GROUPING(p.Productline) as grupoLinea
FROM Production.Product as p
GROUP By ROLLUP(p.Color, p.ProductLine)
HAVING p.color is not null and p.productline is not null


SELECT 
	p.Color, 
	p.ProductLine,
	SUM(p.StandardCost) as TotalStdCost,
	SUM(p.ListPrice) as TotalListPrice,
	GROUPING(p.Color) as grupoColor,
	GROUPING(p.Productline) as grupoLinea
FROM Production.Product as p
WHERE p.color is not null and p.productline is not null
GROUP By ROLLUP(p.Color, p.ProductLine)
