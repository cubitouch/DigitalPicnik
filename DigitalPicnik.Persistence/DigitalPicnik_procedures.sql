/* CodeFluent Generated Thursday, 18 August 2016 17:41. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[List_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[List_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Item_LoadByList]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Item_LoadByList]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[List_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[List_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[List_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[List_LoadById]
GO

CREATE PROCEDURE [dbo].[Item_Delete]
(
 @Item_Id [uniqueidentifier],
 @_rowVersion [rowversion]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Item] FROM [Item] 
    WHERE (([Item].[Item_Id] = @Item_Id) AND ([Item].[_rowVersion] = @_rowVersion))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@rowcount = 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RAISERROR ('Concurrency error in procedure %s', 16, 1, 'Item_Delete')
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Item_Save]
(
 @Item_Id [uniqueidentifier],
 @Item_Label [nvarchar] (256) = NULL,
 @Item_Quantity [int] = NULL,
 @Item_Name [nvarchar] (256) = NULL,
 @Item_List_Id [uniqueidentifier] = NULL,
 @_trackLastWriteUser [nvarchar] (64) = NULL,
 @_rowVersion [rowversion] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
IF(@_trackLastWriteUser IS NULL)
BEGIN
    SELECT DISTINCT @_trackLastWriteUser = SYSTEM_USER  
END
IF(@_rowVersion IS NOT NULL)
BEGIN
    UPDATE [Item] SET
     [Item].[Item_Label] = @Item_Label,
     [Item].[Item_Quantity] = @Item_Quantity,
     [Item].[Item_Name] = @Item_Name,
     [Item].[Item_List_Id] = @Item_List_Id,
     [Item].[_trackLastWriteUser] = @_trackLastWriteUser,
     [Item].[_trackLastWriteTime] = GETDATE()
        WHERE (([Item].[Item_Id] = @Item_Id) AND ([Item].[_rowVersion] = @_rowVersion))
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RAISERROR ('Concurrency error in procedure %s', 16, 1, 'Item_Save')
        RETURN
    END
    SELECT DISTINCT [Item].[_rowVersion] 
        FROM [Item] 
        WHERE ([Item].[Item_Id] = @Item_Id)
END
ELSE
BEGIN
    INSERT INTO [Item] (
        [Item].[Item_Id],
        [Item].[Item_Label],
        [Item].[Item_Quantity],
        [Item].[Item_Name],
        [Item].[Item_List_Id],
        [Item].[_trackCreationUser],
        [Item].[_trackLastWriteUser])
    VALUES (
        @Item_Id,
        @Item_Label,
        @Item_Quantity,
        @Item_Name,
        @Item_List_Id,
        @_trackLastWriteUser,
        @_trackLastWriteUser)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    SELECT DISTINCT [Item].[_rowVersion] 
        FROM [Item] 
        WHERE ([Item].[Item_Id] = @Item_Id)
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[List_Delete]
(
 @List_Id [uniqueidentifier],
 @_rowVersion [rowversion]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Item] SET
 [Item].[Item_List_Id] = NULL
    WHERE ([Item].[Item_List_Id] = @List_Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
DELETE [List] FROM [List] 
    WHERE (([List].[List_Id] = @List_Id) AND ([List].[_rowVersion] = @_rowVersion))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@rowcount = 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RAISERROR ('Concurrency error in procedure %s', 16, 1, 'List_Delete')
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[List_Save]
(
 @List_Id [uniqueidentifier],
 @List_Title [nvarchar] (256) = NULL,
 @List_Description [nvarchar] (256) = NULL,
 @_trackLastWriteUser [nvarchar] (64) = NULL,
 @_rowVersion [rowversion] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
IF(@_trackLastWriteUser IS NULL)
BEGIN
    SELECT DISTINCT @_trackLastWriteUser = SYSTEM_USER  
END
IF(@_rowVersion IS NOT NULL)
BEGIN
    UPDATE [List] SET
     [List].[List_Title] = @List_Title,
     [List].[List_Description] = @List_Description,
     [List].[_trackLastWriteUser] = @_trackLastWriteUser,
     [List].[_trackLastWriteTime] = GETDATE()
        WHERE (([List].[List_Id] = @List_Id) AND ([List].[_rowVersion] = @_rowVersion))
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RAISERROR ('Concurrency error in procedure %s', 16, 1, 'List_Save')
        RETURN
    END
    SELECT DISTINCT [List].[_rowVersion] 
        FROM [List] 
        WHERE ([List].[List_Id] = @List_Id)
END
ELSE
BEGIN
    INSERT INTO [List] (
        [List].[List_Id],
        [List].[List_Title],
        [List].[List_Description],
        [List].[_trackCreationUser],
        [List].[_trackLastWriteUser])
    VALUES (
        @List_Id,
        @List_Title,
        @List_Description,
        @_trackLastWriteUser,
        @_trackLastWriteUser)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    SELECT DISTINCT [List].[_rowVersion] 
        FROM [List] 
        WHERE ([List].[List_Id] = @List_Id)
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Item_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Item].[Item_Id], [Item].[Item_Label], [Item].[Item_Quantity], [Item].[Item_Name], [Item].[Item_List_Id], [Item].[_trackLastWriteTime], [Item].[_trackCreationTime], [Item].[_trackLastWriteUser], [Item].[_trackCreationUser], [Item].[_rowVersion] 
    FROM [Item] 
    WHERE ([Item].[Item_Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Item_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Item].[Item_Id], [Item].[Item_Label], [Item].[Item_Quantity], [Item].[Item_Name], [Item].[Item_List_Id], [Item].[_trackLastWriteTime], [Item].[_trackCreationTime], [Item].[_trackLastWriteUser], [Item].[_trackCreationUser], [Item].[_rowVersion] 
    FROM [Item] 

RETURN
GO

CREATE PROCEDURE [dbo].[Item_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Item].[Item_Id], [Item].[Item_Label], [Item].[Item_Quantity], [Item].[Item_Name], [Item].[Item_List_Id], [Item].[_trackLastWriteTime], [Item].[_trackCreationTime], [Item].[_trackLastWriteUser], [Item].[_trackCreationUser], [Item].[_rowVersion] 
    FROM [Item] 
    WHERE ([Item].[Item_Id] = @Id)

RETURN
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

RETURN
GO

CREATE PROCEDURE [dbo].[List_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [List].[List_Id], [List].[List_Title], [List].[List_Description], [List].[_trackLastWriteTime], [List].[_trackCreationTime], [List].[_trackLastWriteUser], [List].[_trackCreationUser], [List].[_rowVersion] 
    FROM [List] 
    WHERE ([List].[List_Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[List_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [List].[List_Id], [List].[List_Title], [List].[List_Description], [List].[_trackLastWriteTime], [List].[_trackCreationTime], [List].[_trackLastWriteUser], [List].[_trackCreationUser], [List].[_rowVersion] 
    FROM [List] 

RETURN
GO

CREATE PROCEDURE [dbo].[List_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [List].[List_Id], [List].[List_Title], [List].[List_Description], [List].[_trackLastWriteTime], [List].[_trackCreationTime], [List].[_trackLastWriteUser], [List].[_trackCreationUser], [List].[_rowVersion] 
    FROM [List] 
    WHERE ([List].[List_Id] = @Id)

RETURN
GO

