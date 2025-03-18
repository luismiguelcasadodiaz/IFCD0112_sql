-- ¿Que departamenteo tiene un turno de noche desde el 2009?

SELECT 
DepartmentID as departamento, 
ShiftID as  turno, 
YEAR(StartDate) as fechaInicio,
count(*)
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
WHERE  YEAR(StartDate) = 2009
GROUP BY ROLLUP(DepartmentID,  ShiftID, YEAR(StartDate));


SELECT 
DepartmentID as departamento, 
ShiftID as  turno, 
YEAR(StartDate) as año,
count(*) as totalregistros,
GROUPING(DepartmentID) as grupoA,
GROUPING(ShiftID) as grupoA,
GROUPING(YEAR(StartDate)) as grupoA
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
WHERE  YEAR(StartDate) BETWEEN 2009 AND 2011
GROUP BY CUBE(DepartmentID,  ShiftID, YEAR(StartDate));


SET STATISTICS TIME ON
SELECT 
DepartmentID as departamento, 
ShiftID as  turno, 
YEAR(StartDate) as año,
count(*) as totalregistros,
GROUPING(DepartmentID) as grupoA,
GROUPING(ShiftID) as grupoB,
GROUPING(YEAR(StartDate)) as grupoC
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
WHERE  YEAR(StartDate) BETWEEN 2009 AND 2011
GROUP BY CUBE(DepartmentID,  ShiftID, YEAR(StartDate));



SELECT SUM(grupoA), sum(grupoB), SUM(grupoC) 
FROM
(
SELECT 
DepartmentID as departamento, 
ShiftID as  turno, 
YEAR(StartDate) as año,
count(*) as totalregistros,
GROUPING(DepartmentID) as grupoA,
GROUPING(ShiftID) as grupoB,
GROUPING(YEAR(StartDate)) as grupoC
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
WHERE  YEAR(StartDate) BETWEEN 2009 AND 2011
GROUP BY CUBE(DepartmentID,  ShiftID, YEAR(StartDate))

) as subquery

SELECT DISTINCT   DepartmentID FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
SELECT DISTINCT   ShiftID FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]
SELECT DISTINCT   YEAR(StartDate) FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory]