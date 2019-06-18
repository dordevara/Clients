CREATE TABLE [dbo].[Accounts]
(
[AccountId] [int] NOT NULL IDENTITY(1, 1),
[AccRefId] [int] NOT NULL,
[Balance] [decimal] (18, 2) NULL,
[ClientId] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF__Accounts__IsActi__182C9B23] DEFAULT ((1)),
[DateCreated] [datetime2] (0) NULL CONSTRAINT [DF__Accounts__DateCr__1920BF5C] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED  ([AccountId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD CONSTRAINT [FK_Accounts_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Accounts] ADD CONSTRAINT [fk_Accounts_Reference] FOREIGN KEY ([AccRefId]) REFERENCES [dbo].[Reference] ([RefId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Customers Accounts', 'SCHEMA', N'dbo', 'TABLE', N'Accounts', NULL, NULL
GO
