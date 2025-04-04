
/*

¿Que número de cliente (CustomerID) tiene una suma de las ventas (TotalDue) para 
aquellos pedidos (Sales.SalesOrderHeader) realizados después del 1 de enero de 2012 en el rango 19 000 y 19 500?

*/
SELECT CustomerID, 
       SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING 19000 < SUM(TotalDue)  and SUM(TotalDue) < 19500
ORDER BY TotalSales;


SELECT CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING SUM(TotalDue) BETWEEN 19000 AND 19500;
