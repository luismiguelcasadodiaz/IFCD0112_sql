-- Cuantos empleado de segundo nivel tiene 40 horas de vaciones

SELECT 
	count(*) as TotalEmpleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
WHERE OrganizationLevel = 4 AND	VacationHours = 40 

SET STATISTICS TIME ON

-- que combinaciones de organizationLevel y horas de vacaciones tiene tres trabajadores
SELECT 
	OrganizationLevel, 
	VacationHours, 
	count(*) as TotalEmpleados,
	GROUPING(organizationlevel) as agrupadoNivel,
	GROUPING(VacationHours) as agrupadoHoras
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (OrganizationLevel, 	VacationHours)
HAVING count(*) = 3;


