
BEGIN TRANSACTION

BULK INSERT dbo.Comunidades
FROM 'C:\Users\lcasado\OneDrive\Documents\GitHub\uc049x\uc09492_3\uf1845\Enunciados_ejercicios_db\Comunidades.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Specify the field delimiter (comma for CSV)
    ROWTERMINATOR = '\n',   -- Specify the row delimiter (new line)
    FIRSTROW = 2,           -- Skip the header row, if any
	CODEPAGE = '1252'      -- Set UTF-8 encoding
);



BULK INSERT dbo.Provincias
FROM 'C:\Users\lcasado\OneDrive\Documents\GitHub\uc049x\uc09492_3\uf1845\Enunciados_ejercicios_db\Provincias.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Specify the field delimiter (comma for CSV)
    ROWTERMINATOR = '\n',   -- Specify the row delimiter (new line)
    FIRSTROW = 2,           -- Skip the header row, if any
	CODEPAGE = '65001'      -- Set UTF-8 encoding
);


BULK INSERT dbo.Municipios
FROM 'C:\Users\lcasado\OneDrive\Documents\GitHub\uc049x\uc09492_3\uf1845\Enunciados_ejercicios_db\Municipios_VSC.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Specify the field delimiter (comma for CSV)
    ROWTERMINATOR = '\n',   -- Specify the row delimiter (new line)
    FIRSTROW = 2,           -- Skip the header row, if any
	CODEPAGE = '65001'      -- Set UTF-8 encoding
);

Select * from dbo.Comunidades;

Select * from dbo.Provincias;
Select * from dbo.Municipios;
ROLLBACK

--delete from dbo.Provincias;

--Select * from dbo.Provincias