CREATE TABLE [dbo].[Associations]
(
[AssocId] [int] NOT NULL IDENTITY(1, 1),
[Client1] [int] NOT NULL,
[AssocRefId] [int] NOT NULL,
[Client2] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [Check_Association] CHECK (([Client1]<>[Client2]))
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [PK_Associations] PRIMARY KEY CLUSTERED  ([AssocId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [Unique_Association] UNIQUE NONCLUSTERED  ([Client1], [AssocRefId], [Client2]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [FK_Associations_Clients1] FOREIGN KEY ([Client1]) REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [FK_Associations_Clients2] FOREIGN KEY ([Client2]) REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [fk_Associations_Reference] FOREIGN KEY ([AssocRefId]) REFERENCES [dbo].[Reference] ([RefId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Customers Associations', 'SCHEMA', N'dbo', 'TABLE', N'Associations', NULL, NULL
GO
