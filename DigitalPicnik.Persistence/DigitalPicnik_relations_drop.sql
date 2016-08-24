/* CodeFluent Generated Thursday, 18 August 2016 17:41. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* no fk for 'FK_Ite_ItL_Lis_Lis', tableName='Item' table='Item' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Ite_ItL_Lis_Lis]') AND parent_obj = object_id(N'[dbo].[Item]'))
 ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Ite_ItL_Lis_Lis]
GO
