USE AdventureWorks2022

SELECT AVG(UnitPrice) AS PrecioPromedio
FROM Purchasing.PurchaseOrderDetail pod
JOIN Purchasing.PurchaseOrderHeader poh ON pod.PurchaseOrderID = poh.PurchaseOrderID
WHERE YEAR(poh.OrderDate) = 2012;