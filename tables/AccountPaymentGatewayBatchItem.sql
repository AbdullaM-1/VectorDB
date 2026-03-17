USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountPaymentGatewayBatchItem](
	[AccountPaymentGatewayBatchItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountPaymentGatewayBatchId] [bigint] NOT NULL,
	[AccountId] [int] NOT NULL,
	[AmountToBill] [money] NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[ProcessedUTCDateTime] [datetime] NULL,
	[MessageId] [uniqueidentifier] NULL,
	[TransactionReference] [nvarchar](80) NULL,
	[TransactionStatus] [varchar](10) NULL,
	[ReturnCode] [varchar](5) NULL,
	[IsFailedPayment] [bit] NOT NULL,
 CONSTRAINT [PK_AccountPaymentGatewayBatchItem] PRIMARY KEY CLUSTERED 
(
	[AccountPaymentGatewayBatchItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountPaymentGatewayBatchItem] ADD  DEFAULT ((0)) FOR [IsFailedPayment]
GO
ALTER TABLE [dbo].[AccountPaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_AccountPaymentGatewayBatchItem_AccountPaymentGatewayBatch] FOREIGN KEY([AccountPaymentGatewayBatchId])
REFERENCES [dbo].[AccountPaymentGatewayBatch] ([AccountPaymentGatewayBatchId])
GO
ALTER TABLE [dbo].[AccountPaymentGatewayBatchItem] CHECK CONSTRAINT [FK_AccountPaymentGatewayBatchItem_AccountPaymentGatewayBatch]
GO
ALTER TABLE [dbo].[AccountPaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_AccountPaymentGatewayBatchItem_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountPaymentGatewayBatchItem] CHECK CONSTRAINT [FK_AccountPaymentGatewayBatchItem_Accounts]
GO
