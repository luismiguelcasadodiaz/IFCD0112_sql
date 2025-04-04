/*
21-Para los pedidos (Sales.SalesOrderHeader) realizados despu�s del 1 de enero de 2012 (OrderDate)
�Qu� n�mero de cliente (CustomerID) tiene una suma de las ventas (TotalDue)
en el rango 19 000 y 19 500? 

*/
SELECT CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING SUM(TotalDue) BETWEEN 19000 AND 19500;

