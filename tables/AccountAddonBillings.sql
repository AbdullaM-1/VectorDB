USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAddonBillings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ProductCatalogId] [int] NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[Price] [money] NOT NULL,
	[IsOneOffBilling] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_AccountAddonBillings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountAddonBillings]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddonBillings_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountAddonBillings] CHECK CONSTRAINT [FK_AccountAddonBillings_Account_AccountId]
GO
