CREATE PROCEDURE create_espace
(
	   @est tinyint
	 , @fil tinyint
	 , @col tinyint
	 )
AS
	INSERT INTO Espacios (ES_est, ES_alt, ES_lar) VALUES (@est, @fil, @col);