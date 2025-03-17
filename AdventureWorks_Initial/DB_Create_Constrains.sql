USE Apol_Excel_02;
alter table dbo.Continentes alter column Continente_PK tinyint;


alter table dbo.Categorias alter column Categoría_PK tinyint;





ALTER TABLE dbo.Paises
ADD CONSTRAINT Paises_Continent_FK
FOREIGN KEY (Continente_FK)
REFERENCES dbo.Continentes.Continente_PK;
