/* CodeFluent Generated Thursday, 18 August 2016 17:41. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* table '[dbo].[Item]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[List]' primary key is related to a clustered index and cannot be changed on SQL Azure */
GO
IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tc]') AND parent_obj = object_id(N'[dbo].[Item]'))
BEGIN
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tc]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [DF_Ite__tc]

 ALTER TABLE [dbo].[Item] ADD CONSTRAINT [DF_Ite__tc] DEFAULT (GETDATE()) FOR [_trackLastWriteTime]
END
GO
IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tk]') AND parent_obj = object_id(N'[dbo].[Item]'))
BEGIN
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Ite__tk]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [DF_Ite__tk]

 ALTER TABLE [dbo].[Item] ADD CONSTRAINT [DF_Ite__tk] DEFAULT (GETDATE()) FOR [_trackCreationTime]
END
GO
IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tc]') AND parent_obj = object_id(N'[dbo].[List]'))
BEGIN
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tc]') AND parent_obj = object_id(N'[dbo].[List]'))
 ALTER TABLE [dbo].[List] DROP CONSTRAINT [DF_Lis__tc]

 ALTER TABLE [dbo].[List] ADD CONSTRAINT [DF_Lis__tc] DEFAULT (GETDATE()) FOR [_trackLastWriteTime]
END
GO
IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tk]') AND parent_obj = object_id(N'[dbo].[List]'))
BEGIN
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[DF_Lis__tk]') AND parent_obj = object_id(N'[dbo].[List]'))
 ALTER TABLE [dbo].[List] DROP CONSTRAINT [DF_Lis__tk]

 ALTER TABLE [dbo].[List] ADD CONSTRAINT [DF_Lis__tk] DEFAULT (GETDATE()) FOR [_trackCreationTime]
END
GO
