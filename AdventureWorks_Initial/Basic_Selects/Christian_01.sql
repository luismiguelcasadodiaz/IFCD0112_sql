-- Cuantos empleado hay por nivel organizativo y descripción del puesto de trabajo
SELECT
	[JobTitle], [OrganizationLevel],
	 count(*) as totalempleado      
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  GROUP BY ROLLUP([JobTitle], [OrganizationLevel])