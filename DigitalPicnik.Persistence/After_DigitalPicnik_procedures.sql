
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_LoadByList]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_LoadByList]
GO

CREATE PROCEDURE [dbo].[Item_LoadByList]
(
 @ListId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Item].[Item_Id], [Item].[Item_Label], [Item].[Item_Quantity], [Item].[Item_Name], [Item].[Item_List_Id], [Item].[_trackLastWriteTime], [Item].[_trackCreationTime], [Item].[_trackLastWriteUser], [Item].[_trackCreationUser], [Item].[_rowVersion] 
    FROM [Item] 
    WHERE ([Item].[Item_List_Id] = @ListId)
    ORDER BY [Item].[_trackCreationTime]

RETURN
GO