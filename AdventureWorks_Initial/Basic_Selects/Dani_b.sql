-- agrupar por año y estado de la venta el total de la factura


SELECT 
	YEAR(OrderDate) as año, 
	[status] as estadoorden,
	count(SalesOrderID) as TotalOrdenes,
	Sum(TotalDue) as Totalvendido
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GRoup by YEAR(OrderDate), [status] WITH ROLLUP;


SELECT 
	YEAR(OrderDate) as año, 
	[status] as estadoorden,
	count(SalesOrderID) as TotalOrdenes,
	Sum(TotalDue) as Totalvendido
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GRoup by ROLLUP(YEAR(OrderDate), [status]);