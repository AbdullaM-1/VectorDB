USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimStocktakes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[StaffId] [int] NOT NULL,
	[ExpectedStockLevel] [int] NOT NULL,
	[ActualStockLevel] [int] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_SwimStocktakes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimStocktakes]  WITH CHECK ADD  CONSTRAINT [FK_SwimStocktakes_AccountProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
GO
ALTER TABLE [dbo].[SwimStocktakes] CHECK CONSTRAINT [FK_SwimStocktakes_AccountProduct]
GO
ALTER TABLE [dbo].[SwimStocktakes]  WITH CHECK ADD  CONSTRAINT [FK_SwimStocktakes_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[SwimStocktakes] CHECK CONSTRAINT [FK_SwimStocktakes_Accounts]
GO
ALTER TABLE [dbo].[SwimStocktakes]  WITH CHECK ADD  CONSTRAINT [FK_SwimStocktakes_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[SwimStocktakes] CHECK CONSTRAINT [FK_SwimStocktakes_Staff]
GO
