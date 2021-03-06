﻿/*
   20 марта 2011 г.18:10:21
   Пользователь: 
   Сервер: (local)
   База данных: Авиарейсы
   Приложение: 
*/

/* Чтобы предотвратить возможность потери данных, необходимо внимательно просмотреть этот сценарий, прежде чем запускать его вне контекста конструктора баз данных.*/
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
ALTER TABLE dbo.Авиарейс ADD CONSTRAINT
	DF_Авиарейс_Откуда DEFAULT 'Пятигорск' FOR Откуда
GO
ALTER TABLE dbo.Авиарейс ADD CONSTRAINT
	DF_Авиарейс_Куда DEFAULT 'Пятигорск' FOR Куда
GO
ALTER TABLE dbo.Авиарейс ADD CONSTRAINT
	[DF_Авиарейс_Тип самолёта] DEFAULT 'Ту-154' FOR [Тип самолёта]
GO
ALTER TABLE dbo.Авиарейс SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Авиарейс', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Авиарейс', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Авиарейс', 'Object', 'CONTROL') as Contr_Per 