CREATE TABLE dbo.new_continentes (
cont_PK tinyint NOT NULL PRIMARY KEY,
cont_nom CHAR(7)
)



/*

INSERT INTO table_name (column1, column2, column3, ...)
VALUES
    (value1_1, value1_2, value1_3, ...),
    (value2_1, value2_2, value2_3, ...),
    (value3_1, value3_2, value3_3, ...);


*/
INSERT INTO dbo.new_continentes (cont_nom, cont_PK)
	VALUES
	('África',		1),
	('América',		2),
	('Oceanía',		3),
	('Europa',		4),
	('Asia',	5);


/*

Continente	Continente_PK
(África		1),
(América		2),
(Oceanía		3),
(Europa		4),
(Asia		5);
*/