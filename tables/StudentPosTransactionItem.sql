USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosTransactionItem](
	[PosTransactionItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemTaxAmount] [decimal](18, 2) NOT NULL,
	[ItemPriceExTax] [decimal](18, 2) NOT NULL,
	[ItemPriceIncTax] [decimal](18, 2) NOT NULL,
	[IsRefunded] [bit] NOT NULL,
	[PosTransactionRefItemId] [bigint] NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[CreditAmountUsed] [money] NOT NULL,
	[IsUsedCreditAmount] [bit] NOT NULL,
	[ItemType] [int] NOT NULL,
 CONSTRAINT [PK_StudentPosTransactionItem] PRIMARY KEY CLUSTERED 
(
	[PosTransactionItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] ADD  DEFAULT ((0)) FOR [IsRefunded]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] ADD  DEFAULT ((0)) FOR [CreditAmountUsed]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] ADD  DEFAULT ((0)) FOR [IsUsedCreditAmount]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] ADD  DEFAULT ((0)) FOR [ItemType]
GO
ALTER TABLE [dbo].[StudentPosTransactionItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentPosTransactionItem_StudentPosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentPosTransactionItem] CHECK CONSTRAINT [FK_StudentPosTransactionItem_StudentPosTransaction]
GO
