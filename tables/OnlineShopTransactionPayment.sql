USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineShopTransactionPayment](
	[OnlineShopTransactionPaymentId] [bigint] IDENTITY(1,1) NOT NULL,
	[OnlineShopTransactionId] [bigint] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDateUtc] [datetime] NULL,
 CONSTRAINT [PK_OnlineShopTransactionPayment] PRIMARY KEY CLUSTERED 
(
	[OnlineShopTransactionPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineShopTransactionPayment]  WITH CHECK ADD  CONSTRAINT [FK_OnlineShopTransactionPayment_OnlineShopTransaction] FOREIGN KEY([OnlineShopTransactionId])
REFERENCES [dbo].[OnlineShopTransaction] ([OnlineShopTransactionId])
GO
ALTER TABLE [dbo].[OnlineShopTransactionPayment] CHECK CONSTRAINT [FK_OnlineShopTransactionPayment_OnlineShopTransaction]
GO
