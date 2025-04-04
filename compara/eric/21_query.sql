USE AdventureWorks2022

SELECT CustomerID, SUM(TotalDue) AS SumaVentas
FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING SUM(TotalDue) BETWEEN 19000 AND 19500;