USE Apol_Excel_02;
alter table dbo.Continentes alter column Continente_PK tinyint;


alter table dbo.Categorias alter column Categoría_PK tinyint;




alter table dbo.Continentes
alter column  Continente_PK tinyint NOT NULL;
alter table dbo.Continentes
ADD CONSTRAINT Continente_PK PRIMARY KEY (Continente_PK);

alter table dbo.Paises
alter column  Pais_PK char(3) NOT NULL;
alter table dbo.Paises
alter column  Continente_FK tinyint NOT NULL;
alter table dbo.Paises
ADD CONSTRAINT Paises_PK PRIMARY KEY (Pais_PK);


alter table dbo.Categorias
alter column Categoria_PK tinyint NOT NULL;
alter table dbo.Categorias
ADD CONSTRAINT Categoria_PK PRIMARY KEY (Categoria_PK);

/*
ALTER TABLE dbo.Paises
ADD CONSTRAINT Paises_Continent_FK
FOREIGN KEY (Continente_FK)
REFERENCES dbo.Continentes.Continente_PK;
*/