USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocktakes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[StaffId] [int] NOT NULL,
	[ExpectedStockLevel] [int] NOT NULL,
	[ActualStockLevel] [int] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_Stocktakes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stocktakes]  WITH CHECK ADD  CONSTRAINT [FK_Stocktakes_AccountProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
GO
ALTER TABLE [dbo].[Stocktakes] CHECK CONSTRAINT [FK_Stocktakes_AccountProduct]
GO
ALTER TABLE [dbo].[Stocktakes]  WITH CHECK ADD  CONSTRAINT [FK_Stocktakes_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Stocktakes] CHECK CONSTRAINT [FK_Stocktakes_Accounts]
GO
ALTER TABLE [dbo].[Stocktakes]  WITH CHECK ADD  CONSTRAINT [FK_Stocktakes_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Stocktakes] CHECK CONSTRAINT [FK_Stocktakes_Staff]
GO
