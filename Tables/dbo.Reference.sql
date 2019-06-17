CREATE TABLE [dbo].[Reference]
(
[RefId] [int] NOT NULL IDENTITY(1, 1),
[RefDescription] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Reference__IsDel__145C0A3F] DEFAULT ('0'),
[DateDeleted] [date] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Softdelete] 
ON [dbo].[Reference] 
INSTEAD OF DELETE
AS

DECLARE @RefId int
DECLARE @RefDescription VARCHAR(50)
DECLARE @IsDeleted bit
DECLARE @DateDeleted date

    SELECT  RefId = @RefId
    FROM    sys.dm_exec_sessions
    WHERE   session_id = @@SPID
	SET @IsDeleted = '1'

     IF EXISTS ( SELECT 0 FROM Deleted )
        BEGIN
            IF EXISTS ( SELECT 0 FROM Inserted )
                BEGIN
                    INSERT  INTO dbo.ReferenceDeleted  ( RefId,RefDescription, IsDeleted, DateDeleted )
                            SELECT  RefId , D.RefDescription ,  @IsDeleted ,  GETDATE()   'U'
                            FROM    Deleted D
                END
            ELSE
                BEGIN
                    INSERT  INTO dbo.ReferenceDeleted ( RefId, RefDescription, IsDeleted, DateDeleted )
                            SELECT  RefId , D.RefDescription , @IsDeleted , GETDATE()   'D'
                            FROM    Deleted D
                END  
        END
    ELSE
        BEGIN
            INSERT  INTO dbo.ReferenceDeleted  ( RefId, RefDescription,  IsDeleted, DateDeleted )
                            SELECT  RefId , I.RefDescription , @IsDeleted , GETDATE()     'I'
                            FROM    Inserted I
        END

	--clean up references
	UPDATE u SET u.RefDescription = NULL, u.IsDeleted = '1', u.DateDeleted = CONVERT(CHAR(20), GETDATE() )
		FROM dbo.Reference AS u
		INNER JOIN deleted as d
		ON u.RefId = d.RefId
GO
ALTER TABLE [dbo].[Reference] ADD CONSTRAINT [PK_Reference] PRIMARY KEY CLUSTERED  ([RefId]) ON [PRIMARY]
GO
