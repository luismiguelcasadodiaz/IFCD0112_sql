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
CREATE TABLE dbo.Comunidades
	(
	Com_PK tinyint NOT NULL,
	Com_Nom varchar(27) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Comunidades ADD CONSTRAINT
	PK_Comunidades PRIMARY KEY CLUSTERED 
	(
	Com_PK
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Comunidades SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


