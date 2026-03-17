USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineShopTransactionItem](
	[OnlineShopTransactionItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[OnlineShopTransactionId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemTaxAmount] [decimal](18, 2) NOT NULL,
	[ItemPriceExTax] [decimal](18, 2) NOT NULL,
	[ItemPriceIncTax] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[IsRefunded] [bit] NOT NULL,
	[ItemDescription] [nvarchar](500) NULL,
	[IsVoided] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](20) NULL,
	[DeletedOnUtc] [datetime] NULL,
	[SellIncTaxPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OnlineShopTransactionItem] PRIMARY KEY CLUSTERED 
(
	[OnlineShopTransactionItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem] ADD  DEFAULT ((0)) FOR [SellIncTaxPrice]
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem]  WITH CHECK ADD  CONSTRAINT [FK_OnlineShopTransactionItem_AccountProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem] CHECK CONSTRAINT [FK_OnlineShopTransactionItem_AccountProduct]
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem]  WITH CHECK ADD  CONSTRAINT [FK_OnlineShopTransactionItem_OnlineShopTransaction] FOREIGN KEY([OnlineShopTransactionId])
REFERENCES [dbo].[OnlineShopTransaction] ([OnlineShopTransactionId])
GO
ALTER TABLE [dbo].[OnlineShopTransactionItem] CHECK CONSTRAINT [FK_OnlineShopTransactionItem_OnlineShopTransaction]
GO
