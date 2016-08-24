/* CodeFluent Generated Thursday, 18 August 2016 17:41. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
ALTER TABLE [dbo].[Item] WITH NOCHECK ADD CONSTRAINT [FK_Ite_ItL_Lis_Lis] FOREIGN KEY (
 [Item_List_Id]
) REFERENCES [dbo].[List](

 [List_Id]
)
ALTER TABLE [dbo].[Item] NOCHECK CONSTRAINT [FK_Ite_ItL_Lis_Lis]
