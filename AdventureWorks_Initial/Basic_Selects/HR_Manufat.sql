SELECT TOP (1000) [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2022].[HumanResources].[Department]
  WHERE [GroupName] = 'Manufacturing'
