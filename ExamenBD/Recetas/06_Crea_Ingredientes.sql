USE recetas_para_aprobar;
GO
CREATE TABLE Ingredientes
(
	ing_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
	ing_nom VARCHAR(14) UNIQUE NOT NULL,
	ing_tem_FK TINYINT FOREIGN KEY (ing_tem_FK) REFERENCES Temporadas(tem_PK)
)
