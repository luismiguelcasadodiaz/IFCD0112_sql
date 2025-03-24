DROP DATABASE IF EXISTS  Estanterias;
CREATE DATABASE Estanterias;
GO
USE Estanterias;
GO
CREATE TABLE TiposArticulos (

	TA_PK tinyint IDENTITY (1,1) PRIMARY KEY,
	TA_NOM Varchar(25) NOT NULL
)

GO
INSERT INTO TiposArticulos VALUES
('Alimentos'), 
('libros'), 
('sábanas'), 
('manteles'), 
('servilletas'), 
('chaquetas'), 
('pantalones'), 
('ollas'), 
('cuchillos')