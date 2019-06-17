CREATE TABLE [dbo].[ReferenceDeleted]
(
[RefDelId] [int] NOT NULL IDENTITY(1, 1),
[RefId] [int] NOT NULL,
[RefDescription] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[IsDeleted] [bit] NULL CONSTRAINT [DF__Reference__IsDel__5165187F] DEFAULT ('1'),
[DateDeleted] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReferenceDeleted] ADD CONSTRAINT [PK_ReferenceDeleted] PRIMARY KEY CLUSTERED  ([RefDelId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReferenceDeleted] ADD CONSTRAINT [FK_ReferenceDeleted_Reference] FOREIGN KEY ([RefId]) REFERENCES [dbo].[Reference] ([RefId])
GO
