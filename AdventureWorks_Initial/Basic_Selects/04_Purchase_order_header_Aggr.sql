/*






*/
SELECT SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder;
Calcula la suma total de los valores de SubTotal.

sql
SELECT AVG(TaxAmt) AS AverageTax
FROM PurchaseOrder;
Calcula el promedio del impuesto TaxAmt.

sql
SELECT MAX(Freight) AS MaxFreight
FROM PurchaseOrder;
Encuentra el valor máximo de Freight.

sql
SELECT MIN(TotalDue) AS MinTotalDue
FROM PurchaseOrder;
Encuentra el valor mínimo de TotalDue.

sql
SELECT COUNT(*) AS TotalOrders
FROM PurchaseOrder;
Cuenta el total de registros en la tabla.

sql
SELECT EmployeeID, COUNT(*) AS OrdersPerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID;
Cuenta cuántas órdenes realizó cada empleado.

sql
SELECT ShipMethodID, SUM(TotalDue) AS TotalByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Calcula la suma total de TotalDue para cada método de envío.

sql
SELECT VendorID, MAX(SubTotal) AS MaxSubTotalPerVendor
FROM PurchaseOrder
GROUP BY VendorID;
Encuentra el valor máximo de SubTotal para cada proveedor.

sql
SELECT Status, AVG(Freight) AS AvgFreightByStatus
FROM PurchaseOrder
GROUP BY Status;
Calcula el promedio de Freight para cada estado.

sql
SELECT EmployeeID, SUM(TotalDue) AS TotalDuePerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID
HAVING SUM(TotalDue) > 50000;
Encuentra los empleados cuyo total de TotalDue supera los 50,000.

sql
SELECT YEAR(OrderDate) AS Year, COUNT(*) AS OrdersPerYear
FROM PurchaseOrder
GROUP BY YEAR(OrderDate);
Cuenta el número de órdenes por año basado en OrderDate.

sql
SELECT ShipMethodID, MIN(Freight) AS MinFreightByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Encuentra el valor mínimo de Freight para cada método de envío.

sql
SELECT VendorID, COUNT(*) AS TotalOrdersPerVendor
FROM PurchaseOrder
GROUP BY VendorID;
Cuenta el número de órdenes por proveedor.

sql
SELECT Status, MAX(TaxAmt) AS MaxTaxByStatus
FROM PurchaseOrder
GROUP BY Status;
Encuentra el valor máximo de TaxAmt para cada estado.

sql
SELECT EmployeeID, COUNT(*) AS OrdersPerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID
HAVING COUNT(*) > 10;
Muestra empleados con más de 10 órdenes.

sql
SELECT ShipMethodID, AVG(TotalDue) AS AvgTotalDueByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Calcula el promedio de TotalDue para cada método de envío.

sql
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalDue) AS TotalSales
FROM PurchaseOrder
GROUP BY YEAR(OrderDate), MONTH(OrderDate);
Calcula las ventas totales por mes y año.

sql
SELECT EmployeeID, VendorID, SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder
GROUP BY EmployeeID, VendorID;
Encuentra la suma de SubTotal por empleado y proveedor.

sql
SELECT ShipDate, COUNT(*) AS OrdersPerShipDate
FROM PurchaseOrder
GROUP BY ShipDate;
Cuenta cuántas órdenes se enviaron en cada fecha.

sql
SELECT YEAR(OrderDate) AS Year, MAX(TotalDue) AS MaxTotalDue
FROM PurchaseOrder
GROUP BY YEAR(OrderDate);
Encuentra el valor máximo de TotalDue para cada año.

sql
SELECT VendorID, SUM(Freight) AS TotalFreightPerVendor
FROM PurchaseOrder
GROUP BY VendorID
HAVING SUM(Freight) > 1000;
Encuentra proveedores cuyo total de Freight supera los 1,000.

sql
SELECT Status, COUNT(DISTINCT EmployeeID) AS EmployeesPerStatus
FROM PurchaseOrder
GROUP BY Status;
Cuenta cuántos empleados diferentes trabajan en órdenes con cada estado.

sql
SELECT MONTH(OrderDate) AS Month, AVG(TaxAmt) AS AvgTaxAmt
FROM PurchaseOrder
GROUP BY MONTH(OrderDate);
Calcula el promedio de TaxAmt por mes.

sql
SELECT VendorID, COUNT(*) AS Orders, SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder
GROUP BY VendorID
ORDER BY TotalSubTotal DESC;
Ordena los proveedores por su total de SubTotal en orden descendente.

sql
SELECT EmployeeID, MIN(Freight) AS MinFreight, MAX(Freight) AS MaxFreight
FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader
	
GROUP BY EmployeeID;
Encuentra el Freight mínimo y máximo por empleado.


/*


¿Cuál es la suma total de SubTotal para todos los registros?

¿Cuál es el valor promedio de TaxAmt en la tabla?

¿Cuántos registros tienen un Status igual a 4?

¿Cuál es el TotalDue más alto en la tabla?

¿Cuál es el SubTotal más bajo en la tabla?

¿Cuál es la cantidad de órdenes por cada EmployeeID?

¿Qué ShipMethodID tiene el promedio más alto de Freight?

¿Cuántos registros hay en la tabla que tengan un VendorID mayor que 1600?

¿Cuál es la suma de TotalDue para cada ShipMethodID?

¿Cuál es el número total de órdenes realizadas en cada año (basándote en OrderDate)?

¿Qué VendorID tiene la mayor cantidad de registros asociados?

¿Cuál es la suma total de Freight por cada Status?

¿Cuál es la cantidad de órdenes realizadas por cada ShipDate?

¿Qué EmployeeID generó el mayor TotalDue en suma?

¿Cuál es el valor promedio de SubTotal para las órdenes con un TaxAmt superior a 50?

¿Cuál es el valor máximo de TaxAmt para cada ShipMethodID?

¿Cuántos registros hay por cada combinación de EmployeeID y ShipMethodID?

¿Cuál es el valor mínimo de Freight para los registros con un SubTotal mayor a 20,000?

¿Cuál es el promedio de TotalDue para cada año basado en OrderDate?

¿Qué PurchaseOrderID tiene el mayor valor de Freight asociado?

¿Cuál es la suma total de TaxAmt por cada combinación de Status y ShipMethodID?

¿Cuántos registros tienen un OrderDate en cada mes del año 2011?

¿Cuál es el valor promedio de Freight para los registros donde EmployeeID es mayor que 255?

¿Cuál es el menor SubTotal registrado por cada ShipMethodID?

¿Cuántos registros tienen un ShipDate anterior al ModifiedDate?

*/