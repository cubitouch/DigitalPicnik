/* CodeFluent Generated Thursday, 18 August 2016 17:40. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Item]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[List]
GO

/* no fk for 'PK_Ite_Ite_Ite', tableName='Item' table='Item' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Ite_Ite_Ite]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [PK_Ite_Ite_Ite]
GO
/* no fk for 'DF_Ite__tc', tableName='Item' table='Item' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tc]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [DF_Ite__tc]
GO
/* no fk for 'DF_Ite__tk', tableName='Item' table='Item' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tk]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [DF_Ite__tk]
GO
CREATE TABLE [dbo].[Item] (
 [Item_Id] [uniqueidentifier] NOT NULL,
 [Item_Label] [nvarchar] (256) NULL,
 [Item_Quantity] [int] NULL,
 [Item_Name] [nvarchar] (256) NULL,
 [Item_List_Id] [uniqueidentifier] NULL,
 [_trackLastWriteTime] [datetime] NOT NULL CONSTRAINT [DF_Ite__tc] DEFAULT (GETDATE()),
 [_trackCreationTime] [datetime] NOT NULL CONSTRAINT [DF_Ite__tk] DEFAULT (GETDATE()),
 [_trackLastWriteUser] [nvarchar] (64) NOT NULL,
 [_trackCreationUser] [nvarchar] (64) NOT NULL,
 [_rowVersion] [rowversion] NOT NULL,
 CONSTRAINT [PK_Ite_Ite_Ite] PRIMARY KEY CLUSTERED
 (

  [Item_Id]
 )
)
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Ite_ItL_Lis_Lis]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Ite_ItL_Lis_Lis]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Lis_Lis_Lis]') AND parent_obj = object_id(N'[dbo].[List]'))
 ALTER TABLE [dbo].[List] DROP CONSTRAINT [PK_Lis_Lis_Lis]
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Ite_ItL_Lis_Lis]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Ite_ItL_Lis_Lis]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tc]') AND parent_obj = object_id(N'[dbo].[List]'))
 ALTER TABLE [dbo].[List] DROP CONSTRAINT [DF_Lis__tc]
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Ite_ItL_Lis_Lis]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Ite_ItL_Lis_Lis]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tk]') AND parent_obj = object_id(N'[dbo].[List]'))
 ALTER TABLE [dbo].[List] DROP CONSTRAINT [DF_Lis__tk]
GO
CREATE TABLE [dbo].[List] (
 [List_Id] [uniqueidentifier] NOT NULL,
 [List_Title] [nvarchar] (256) NULL,
 [List_Description] [nvarchar] (256) NULL,
 [_trackLastWriteTime] [datetime] NOT NULL CONSTRAINT [DF_Lis__tc] DEFAULT (GETDATE()),
 [_trackCreationTime] [datetime] NOT NULL CONSTRAINT [DF_Lis__tk] DEFAULT (GETDATE()),
 [_trackLastWriteUser] [nvarchar] (64) NOT NULL,
 [_trackCreationUser] [nvarchar] (64) NOT NULL,
 [_rowVersion] [rowversion] NOT NULL,
 CONSTRAINT [PK_Lis_Lis_Lis] PRIMARY KEY CLUSTERED
 (

  [List_Id]
 )
)
GO

