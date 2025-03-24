USE Ejercicio_01;
SELECT Com_nombre, Prov_nom
  
FROM [dbo].[Comunidades]
  inner join [dbo].[Provincias]
on Com_PK = Prov_com_FK


