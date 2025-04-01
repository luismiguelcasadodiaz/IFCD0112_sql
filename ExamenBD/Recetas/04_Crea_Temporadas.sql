USE recetas_para_aprobar;
GO
CREATE TABLE Temporadas
(
	tem_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
	tem_nom VARCHAR(9) UNIQUE
)