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
CREATE TABLE dbo.Provincias
	(
	Pro_Com_FK tinyint NOT NULL,
	Pro_PK tinyint NOT NULL,
	Pro_Nom varchar(22) NOT NULL,
	Pro_Hab int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Provincias ADD CONSTRAINT
	PK_Provincias PRIMARY KEY CLUSTERED 
	(
	Pro_PK
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Provincias SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Provincias ADD CONSTRAINT
	FK_Provincias_Comunidades FOREIGN KEY (	Pro_Com_FK	) REFERENCES dbo.Comunidades (	Com_PK	) 
	ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
GO
COMMIT


