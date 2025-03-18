SELECT 
	YEAR(OrderDate) as año,
	count(*) as TotalProductosVencidos,
	SUM(TotalDue) as Totalventas,
	GROUPING(YEAR(OrderDate)) as Grupoaño
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GROUP BY ROLLUP(YEAR(OrderDate));



SELECT 
	YEAR(OrderDate) as año,
	count(*) as TotalProductosVencidos
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate);
