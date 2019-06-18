CREATE TABLE [dbo].[Securities]
(
[SecurityId] [int] NOT NULL IDENTITY(1, 1),
[SecurityRefId] [int] NOT NULL,
[AccountId] [int] NOT NULL,
[Value] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Securities] ADD CONSTRAINT [PK_Securities] PRIMARY KEY CLUSTERED  ([SecurityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Securities] ADD CONSTRAINT [FK_Securities_Accounts] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Securities] ADD CONSTRAINT [fk_Securities_Reference] FOREIGN KEY ([SecurityRefId]) REFERENCES [dbo].[Reference] ([RefId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Securities table', 'SCHEMA', N'dbo', 'TABLE', N'Securities', NULL, NULL
GO
