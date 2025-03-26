
USE Estanterias;

CREATE TABLE TiposArticulos (
	TA_PK tinyint IDENTITY(1,1) PRIMARY KEY,
	TA_NOM VARCHAR(25) NOT NULL
);


CREATE TABLE Espacios (
	ES_PK tinyint IDENTITY(1,1) PRIMARY KEY,
	ES_est tinyint NOT NULL CHECK (ES_est between 1 and 10),
	ES_alt tinyint NOT NULL CHECK (ES_alt between 1 and 3),
	ES_lar tinyint NOT NULL CHECK (ES_lar between 1 and 20)
);

CREATE TABLE Articulos (
	AR_PK smallint IDENTITY(1,1) PRIMARY KEY,
	AR_Nom varchar(50) NOT NULL,
	AR_Val money not null DEFAULT 0,
	AR_Esp_FK tinyint not null,
	AR_Tar_FK tinyint not null,

	CONSTRAINT FK_Articulos_Espaces FOREIGN KEY (AR_Esp_FK) REFERENCES Espacios (ES_PK),
	CONSTRAINT FK_Articulos_Tipos FOREIGN KEY (AR_Tar_FK) REFERENCES TiposArticulos (TA_PK)
);
