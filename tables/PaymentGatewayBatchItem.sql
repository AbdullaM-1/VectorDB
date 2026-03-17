USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGatewayBatchItem](
	[PaymentGatewayBatchItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentGatewayBatchId] [bigint] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[AmountToBill] [money] NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[ProcessedUTCDateTime] [datetime] NULL,
	[MessageId] [uniqueidentifier] NULL,
	[TransactionReference] [nvarchar](80) NULL,
	[TransactionStatus] [varchar](10) NULL,
	[ReturnCode] [varchar](5) NULL,
 CONSTRAINT [PK_PaymentGatewayBatchItem] PRIMARY KEY CLUSTERED 
(
	[PaymentGatewayBatchItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_PaymentGatewayBatchItem_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[PaymentGatewayBatchItem] CHECK CONSTRAINT [FK_PaymentGatewayBatchItem_Members]
GO
ALTER TABLE [dbo].[PaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_PaymentGatewayBatchItem_PaymentGatewayBatch] FOREIGN KEY([PaymentGatewayBatchId])
REFERENCES [dbo].[PaymentGatewayBatch] ([PaymentGatewayBatchId])
GO
ALTER TABLE [dbo].[PaymentGatewayBatchItem] CHECK CONSTRAINT [FK_PaymentGatewayBatchItem_PaymentGatewayBatch]
GO
