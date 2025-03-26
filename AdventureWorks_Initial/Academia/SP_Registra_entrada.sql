ALTER PROCEDURE registra_entrada
(
	@alumno varchar(15),
	@aula char(10)
)
AS
	-- Verfica la existencia del alumno
	IF NOT EXISTS (SELECT TOP 1 Alum_nom FROM alumnos WHERE Alum_nom = @alumno)
	BEGIN
		PRINT 'El alumno ' + @alumno + ' no está matriculado';
		RETURN;
	END
	-- Verifica le existencia del aula
	IF NOT EXISTS (SELECT TOP 1 Aula_PK FROM aulas WHERE Aula_nom = @aula)
	BEGIN
		PRINT 'El Aula ' + @aula + ' no existe';
		RETURN;
	END
	-- Obtencion de la PK del aula
	DECLARE @Aula_key tinyint
	SELECT @Aula_key = Aula_PK FROM aulas WHERE Aula_nom = @aula

	-- Asingma el aula al alumno
	UPDATE alumnos 
	SET Alum_aula_FK = @Aula_key
	WHERE Alum_nom = @alumno;

	