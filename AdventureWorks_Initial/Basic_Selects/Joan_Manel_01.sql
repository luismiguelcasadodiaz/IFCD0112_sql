-- Promedio de los impuestos diarios por territorio


SELECT 
YEAR(OrderDate), 
MONTH(OrderDate), 
DAY(OrderDate),
TerritoryID,
AVG(TaxAmt) as promediofiscal
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GROUP By ROLLUP(YEAR(OrderDate), MONTH(OrderDate), DAY(OrderDate),TerritoryID)
