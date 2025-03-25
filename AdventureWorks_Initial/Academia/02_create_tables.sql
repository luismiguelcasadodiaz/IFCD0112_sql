CREATE TABLE aulas
(
	PRIMARY KEY (Aula_PK),
	Aula_PK		tinyint		NOT NULL constraint Aula_PK_range CHECK (Aula_PK between 1 and 12 ),
	Aula_nom	char (10)	NOT NULL constraint Aula_nom_values 
							CHECK (Aula_nom 
							IN ('Enero','Febrero','Marzo','Abril','Mayo','Junio',
							'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'))
);

-- CREATE TABLE paises con el asistente de importación el fichero csv descargado desde https://datahub.io/core/country-list 

CREATE TABLE alumnos
(
	PRIMARY KEY		(Alum_PK),
	Alum_PK			tinyint	NOT NULL IDENTITY(1,1),
	Alum_nom		varchar(15) NOT NULL, 
	Alum_pais_FK	char(2) NOT NULL 
					CONSTRAINT FK_alumno_pais FOREIGN KEY (Alum_pais_fk) REFERENCES paises (Pais_PK),
	Alum_aula_FK	tinyint DEFAULT NULL
					CONSTRAINT FK_alumno_aula FOREIGN KEY (Alum_aula_FK) REFERENCES aulas (Aula_PK)
);


