ALTER PROCEDURE create_almacen
AS
	DECLARE @est tinyint = 1;
	DECLARE @max_est tinyint = 10;
	WHILE (@est <= @max_est)
	BEGIN
		EXEC dbo.create_estanteria @est;
		SET @est = @est + 1;
	END