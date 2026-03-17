USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosTransactionItem](
	[PosTransactionItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemTaxAmount] [decimal](18, 2) NOT NULL,
	[ItemPriceExTax] [decimal](18, 2) NOT NULL,
	[ItemPriceIncTax] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[IsRefunded] [bit] NOT NULL,
	[PosTransactionRefItemId] [bigint] NULL,
	[ItemDescription] [nvarchar](500) NULL,
	[IsVoided] [bit] NOT NULL,
 CONSTRAINT [PK_PosTransactionItem] PRIMARY KEY CLUSTERED 
(
	[PosTransactionItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosTransactionItem] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[PosTransactionItem] ADD  DEFAULT ((0)) FOR [IsRefunded]
GO
ALTER TABLE [dbo].[PosTransactionItem] ADD  DEFAULT ((0)) FOR [IsVoided]
GO
ALTER TABLE [dbo].[PosTransactionItem]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionItem_AccountProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[AccountProduct] ([AccountProductId])
GO
ALTER TABLE [dbo].[PosTransactionItem] CHECK CONSTRAINT [FK_PosTransactionItem_AccountProduct]
GO
ALTER TABLE [dbo].[PosTransactionItem]  WITH CHECK ADD  CONSTRAINT [FK_PosTransactionItem_PosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[PosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[PosTransactionItem] CHECK CONSTRAINT [FK_PosTransactionItem_PosTransaction]
GO
