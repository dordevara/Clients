CREATE TABLE [dbo].[Clients]
(
[ClientId] [int] NOT NULL IDENTITY(1, 1),
[ClientRefId] [int] NOT NULL,
[FName] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[LName] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[DateOfBirth] [date] NULL,
[CompanyName] [varchar] (50) COLLATE Latin1_General_CI_AS NULL,
[City] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Country] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[PhoneNo] [varchar] (10) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients] ADD CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED  ([ClientId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients] ADD CONSTRAINT [fk_Clients_Reference] FOREIGN KEY ([ClientRefId]) REFERENCES [dbo].[Reference] ([RefId])
GO
