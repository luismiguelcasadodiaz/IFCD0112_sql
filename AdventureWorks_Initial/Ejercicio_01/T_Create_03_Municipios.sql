/*
   sábado, 22 de marzo de 202517:32:23
   User: 
   Server: SERVIDORDELL
   Database: ejercicio_01
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Municipios
	(
	Mun_Pro_FK tinyint NOT NULL,
	Mun_Nom varchar(47) NOT NULL,
	--Mun_PK smallint identity (1,1) NOT NULL  PRIMARY KEY
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Municipios ADD CONSTRAINT
	FK_Municipios_Provincias FOREIGN KEY (	Mun_Pro_FK	) REFERENCES dbo.Provincias (	Pro_PK	) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
GO
COMMIT


