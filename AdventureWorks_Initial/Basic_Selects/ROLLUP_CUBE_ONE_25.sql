1. Table: Sales.SalesOrderHeader
Question: What is the total sales amount for each year, with a subtotal for all years?

sql
SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP(YEAR(OrderDate));
2. Table: Production.Product
Question: What is the total number of products by product category and subcategory, with subtotals at each level?

sql
SELECT ProductCategoryID, ProductSubcategoryID, COUNT(*) AS ProductCount
FROM Production.Product
GROUP BY CUBE(ProductCategoryID, ProductSubcategoryID);
3. Table: Sales.Customer
Question: How many customers are there in each territory, including a grand total?

sql
SELECT TerritoryID, COUNT(*) AS CustomerCount
FROM Sales.Customer
GROUP BY ROLLUP(TerritoryID);
4. Table: Purchasing.PurchaseOrderHeader
Question: What is the total freight cost by order year and month, with totals at each level?

sql
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(Freight) AS TotalFreight
FROM Purchasing.PurchaseOrderHeader
GROUP BY ROLLUP(YEAR(OrderDate), MONTH(OrderDate));
5. Table: HumanResources.Employee
Question: How many employees are there by gender and by salaried status?

sql
SELECT Gender, SalariedFlag, COUNT(*) AS EmployeeCount
FROM HumanResources.Employee
GROUP BY CUBE(Gender, SalariedFlag);
6. Table: Production.TransactionHistory
Question: What is the total quantity of transactions by product, including a grand total?

sql
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM Production.TransactionHistory
GROUP BY ROLLUP(ProductID);
7. Table: Sales.SalesOrderHeader
Question: What is the total tax amount grouped by territory and year, with subtotals?

sql
SELECT TerritoryID, YEAR(OrderDate) AS Year, SUM(TaxAmt) AS TotalTax
FROM Sales.SalesOrderHeader
GROUP BY CUBE(TerritoryID, YEAR(OrderDate));
8. Table: Production.ProductInventory
Question: What is the average quantity on hand for each location and product?

sql
SELECT LocationID, ProductID, AVG(Quantity) AS AvgQuantity
FROM Production.ProductInventory
GROUP BY CUBE(LocationID, ProductID);
9. Table: Sales.SalesPerson
Question: What is the total sales quota by salesperson and year?

sql
SELECT BusinessEntityID AS SalesPersonID, YEAR(SalesQuotaDate) AS Year, SUM(SalesQuota) AS TotalQuota
FROM Sales.SalesPerson
GROUP BY ROLLUP(BusinessEntityID, YEAR(SalesQuotaDate));
10. Table: Sales.SalesOrderHeader
Question: What is the average total due for orders grouped by territory and month?

sql
SELECT TerritoryID, MONTH(OrderDate) AS Month, AVG(TotalDue) AS AvgTotalDue
FROM Sales.SalesOrderHeader
GROUP BY CUBE(TerritoryID, MONTH(OrderDate));
11. Table: Production.BillOfMaterials
Question: What is the total quantity for each component and assembly combination?

sql
SELECT ComponentID, AssemblyID, SUM(PerAssemblyQty) AS TotalQuantity
FROM Production.BillOfMaterials
GROUP BY CUBE(ComponentID, AssemblyID);
12. Table: Purchasing.Vendor
Question: How many vendors are there in each credit rating group?

sql
SELECT CreditRating, COUNT(*) AS VendorCount
FROM Purchasing.Vendor
GROUP BY ROLLUP(CreditRating);
13. Table: Sales.SalesOrderHeader
Question: What is the maximum order amount by shipping method?

sql
SELECT ShipMethodID, MAX(TotalDue) AS MaxOrderAmount
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP(ShipMethodID);
14. Table: Production.WorkOrder
Question: What is the total stock quantity by work order and status?

sql
SELECT WorkOrderID, ScrapReasonID, SUM(OrderQty) AS TotalOrderQty
FROM Production.WorkOrder
GROUP BY CUBE(WorkOrderID, ScrapReasonID);
15. Table: Purchasing.ProductVendor
Question: What is the average lead time by product and vendor?

sql
SELECT ProductID, BusinessEntityID AS VendorID, AVG(LeadTime) AS AvgLeadTime
FROM Purchasing.ProductVendor
GROUP BY CUBE(ProductID, BusinessEntityID);
16. Table: Sales.SalesOrderHeader
Question: What is the count of orders grouped by status?

sql
SELECT Status, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP(Status);
17. Table: Purchasing.PurchaseOrderHeader
Question: What is the minimum freight amount by vendor?

sql
SELECT VendorID, MIN(Freight) AS MinFreight
FROM Purchasing.PurchaseOrderHeader
GROUP BY ROLLUP(VendorID);
18. Table: Production.Product
Question: How many products are there by safety stock level?

sql
SELECT SafetyStockLevel, COUNT(*) AS ProductCount
FROM Production.Product
GROUP BY ROLLUP(SafetyStockLevel);
19. Table: Sales.CreditCard
Question: How many credit cards are used by type?

sql
SELECT CardType, COUNT(*) AS CardCount
FROM Sales.CreditCard
GROUP BY ROLLUP(CardType);
20. Table: Production.Product
Question: What is the total weight of products grouped by style and class?

sql
SELECT Style, Class, SUM(Weight) AS TotalWeight
FROM Production.Product
GROUP BY CUBE(Style, Class);
21. Table: Sales.SalesOrderHeader
Question: What is the average discount by shipping method?

sql
SELECT ShipMethodID, AVG(Freight) AS AvgDiscount
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP(ShipMethodID);
22. Table: Purchasing.ProductVendor
Question: What is the maximum standard price by vendor?

sql
SELECT BusinessEntityID AS VendorID, MAX(StandardPrice) AS MaxStandardPrice
FROM Purchasing.ProductVendor
GROUP BY ROLLUP(BusinessEntityID);
23. Table: HumanResources.Employee
Question: How many employees are there by job title?

sql
SELECT JobTitle, COUNT(*) AS EmployeeCount
FROM HumanResources.Employee
GROUP BY ROLLUP(JobTitle);
24. Table: Sales.Territory
Question: What is the total sales by region?

sql
SELECT Name AS Region, SUM(SalesYTD) AS TotalSales
FROM Sales.SalesTerritory
GROUP BY ROLLUP(Name);
25. Table: Production.TransactionHistory
Question: What is the total cost by year of transaction?

sql
SELECT YEAR(TransactionDate) AS Year, SUM(TransactionCost) AS TotalCost
FROM Production.TransactionHistory
GROUP BY ROLLUP(YEAR(TransactionDate));


/*  ========================================================== */

-- 01 ¿Cuál es el monto total de ventas y el monto promedio de ventas de cada producto,
-- y cómo se acumulan estos totales en todos los productos?

SELECT 
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(ProductID);
-- Explicación: Esta consulta resume los datos de la tabla SalesOrderDetail. 
-- Calcula las ventas totales y promedio (LineTotal) de cada producto (ProductID) 
-- y utiliza ROLLUP para incluir una fila de resumen que agrega todos los productos.


-- 02 ¿Cuál es el monto de ventas total y promedio de cada producto y pedido de venta, 
-- incluidos los totales acumulados entre productos y pedidos?

SELECT 
    SalesOrderID,
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(SalesOrderID, ProductID);
-- Explicación: Esta consulta resume la tabla SalesOrderDetail calculando el total y
-- el promedio de LineTotal para las combinaciones de SalesOrderID y ProductID. 
-- El uso de ROLLUP proporciona subtotales para cada SalesOrderID y 
-- totales generales de todos los pedidos de venta y productos.


-- 03 ¿Cuáles son los montos de ventas totales y promedio para cada 
-- combinación de producto y pedido, incluidos los subtotales y los totales generales?

SELECT 
    SalesOrderID,
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    CUBE(SalesOrderID, ProductID);
-- Explicación: Esta consulta también calcula las ventas totales y promedio (LineTotal) 
-- para todas las combinaciones de SalesOrderID y ProductID, pero utiliza CUBE para 
-- incluir subtotales para ambas columnas de forma independiente, 
-- así como sus totales combinados y generales.


-- 04 ¿Cuál es la cantidad total y el precio unitario promedio de cada producto y subcategoría,
-- incluidos los totales acumulados en todas las subcategorías?

Query:

sql
SELECT 
    ProductSubcategoryID,
    ProductID,
    SUM(OrderQty) AS TotalQuantity,
    AVG(UnitPrice) AS AverageUnitPrice
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(ProductSubcategoryID, ProductID);
Explanation: This query calculates the total quantity ordered (OrderQty) and average unit price (UnitPrice) for each combination of ProductSubcategoryID and ProductID. The ROLLUP adds subtotals for each subcategory and a grand total.

SELECT 
*
FROM 
    Production.TransactionHistory

5. Question:
What is the total and average sales amount for each transaction date and product, including cube totals?


SELECT 
    ModifiedDate,
    ProductID,
    SUM(Quantity) AS cantidadtotal,
    AVG(Quantity) AS cantidadmedia
FROM 
    Production.TransactionHistory
GROUP BY 
    CUBE(ModifiedDate, ProductID);

SELECT 
*
FROM 
    Production.TransactionHistory

Explanation: This query calculates total and average sales (LineTotal) by transaction date and product. The CUBE includes subtotals and totals for each column independently, as well as their combinations and a grand total.

6. Question:
What are the maximum and minimum list prices for each product and its subcategory, along with rollup totals?

Query:

sql
SELECT 
    ProductSubcategoryID,
    ProductID,
    MAX(ListPrice) AS MaxListPrice,
    MIN(ListPrice) AS MinListPrice
FROM 
    Production.Product
GROUP BY 
    ROLLUP(ProductSubcategoryID, ProductID);
Explanation: This query calculates the highest and lowest list prices (ListPrice) for each product (ProductID) under its subcategory (ProductSubcategoryID). The ROLLUP provides subtotals for each subcategory and an overall total.

7. Question:
What is the total number of purchase orders and the average quantity ordered for each vendor and their product?

Query:

sql
SELECT 
    VendorID,
    ProductID,
    COUNT(PurchaseOrderID) AS TotalOrders,
    AVG(OrderQty) AS AverageQuantity
FROM 
    Purchasing.PurchaseOrderDetail
GROUP BY 
    CUBE(VendorID, ProductID);
Explanation: This query counts the total number of purchase orders and calculates the average quantity ordered for every combination of VendorID and ProductID. The CUBE generates subtotals for each dimension and a grand total.

8. Question:
What is the total stock quantity and average reorder point for each product category and product?

Query:

sql
SELECT 
    ProductCategoryID,
    ProductID,
    SUM(SafetyStockLevel) AS TotalStockQuantity,
    AVG(ReorderPoint) AS AverageReorderPoint
FROM 
    Production.ProductInventory
GROUP BY 
    ROLLUP(ProductCategoryID, ProductID);
Explanation: This query calculates the total stock quantity (SafetyStockLevel) and average reorder point (ReorderPoint) for each ProductID grouped under ProductCategoryID. The ROLLUP generates subtotals for each category and the overall totals.



¿Cuál es el monto total de ventas y el promedio de ventas para cada producto, y cómo se resumen estos totales para todos los productos?

Sentencia SQL:

sql
SELECT 
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(ProductID);
Explicación: Esta consulta resume los datos de la tabla Sales.SalesOrderDetail. Calcula el total (SUM) y el promedio (AVG) de las ventas (LineTotal) para cada producto (ProductID) y utiliza ROLLUP para incluir una fila de resumen que agrega todos los productos.

2. Pregunta:
¿Cuál es el monto total y promedio de ventas para cada producto y pedido de venta, incluyendo totales acumulados para productos y pedidos?

Sentencia SQL:

sql
SELECT 
    SalesOrderID,
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(SalesOrderID, ProductID);
Explicación: Esta consulta resume la tabla Sales.SalesOrderDetail calculando el total (SUM) y el promedio (AVG) de las ventas (LineTotal) para cada combinación de SalesOrderID y ProductID. El uso de ROLLUP proporciona subtotales para cada pedido y totales generales.

3. Pregunta:
¿Cuáles son los montos totales y promedios de ventas para cada combinación de producto y pedido, incluyendo subtotales y totales generales?

Sentencia SQL:

sql
SELECT 
    SalesOrderID,
    ProductID,
    SUM(LineTotal) AS TotalSalesAmount,
    AVG(LineTotal) AS AverageSalesAmount
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    CUBE(SalesOrderID, ProductID);
Explicación: Esta consulta calcula el total (SUM) y promedio (AVG) de las ventas (LineTotal) para todas las combinaciones de SalesOrderID y ProductID, pero utiliza CUBE para incluir subtotales de cada columna de forma independiente, sus combinaciones y un total general.

4. Pregunta:
¿Cuál es la cantidad total y el precio unitario promedio para cada producto, incluyendo totales acumulados?

Sentencia SQL:

sql
SELECT 
    ProductID,
    SUM(OrderQty) AS TotalQuantity,
    AVG(UnitPrice) AS AverageUnitPrice
FROM 
    Sales.SalesOrderDetail
GROUP BY 
    ROLLUP(ProductID);
Explicación: Esta consulta calcula la cantidad total (SUM(OrderQty)) y el precio unitario promedio (AVG(UnitPrice)) para cada producto (ProductID). El uso de ROLLUP agrega un total general para todas las filas.

5. Pregunta:
¿Cuál es el monto total y promedio de ventas para cada fecha de transacción y producto, incluyendo totales acumulados con CUBE?

Sentencia SQL:

sql
SELECT 
    COALESCE(ModifiedDate, 'Subtotal Producto ==>'),
    ProductID,
    SUM(Quantity) AS TotalQuantity,
    AVG(Quantity) AS AverageQuantity
FROM 
    Production.TransactionHistory
WHERE Year(ModifiedDate) = 2013 and month(ModifiedDate) = 8
GROUP BY 
    CUBE(ModifiedDate, ProductID);

Explicación: Esta consulta calcula el total (SUM) y promedio (AVG) de ventas (LineTotal) por fecha de modificación (ModifiedDate) y producto (ProductID). El uso de CUBE incluye subtotales de cada columna, combinaciones y un total general.