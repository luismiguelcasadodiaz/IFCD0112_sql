/*�Cual ah sido precio promedio unitario [UnitPrice] 
de los productos comprados [Purchasing].[PurchaseOrderDetail] 
en el a�os 2012
*/
SELECT
	AVG([UnitPrice]) as CosteUnitariomedio
FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderDetail]
GROUP BY YEAR(DueDate)
Having YEAR(DueDate) = 2012