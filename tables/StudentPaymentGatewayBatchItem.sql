USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentGatewayBatchItem](
	[PaymentGatewayBatchItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentGatewayBatchId] [bigint] NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[AmountToBill] [money] NOT NULL,
	[CreatedUTCDateTime] [datetime] NOT NULL,
	[ProcessedUTCDateTime] [datetime] NULL,
	[MessageId] [uniqueidentifier] NULL,
	[TransactionReference] [nvarchar](80) NULL,
	[TransactionStatus] [varchar](10) NULL,
	[ReturnCode] [varchar](5) NULL,
	[PaymentTemplateId] [int] NOT NULL,
	[LodgementRef] [varchar](100) NULL,
 CONSTRAINT [PK_StudentPaymentGatewayBatchItem] PRIMARY KEY CLUSTERED 
(
	[PaymentGatewayBatchItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatchItem] ADD  CONSTRAINT [DF_StudentPaymentGatewayBatchItem_PaymentTemplateId]  DEFAULT ((0)) FOR [PaymentTemplateId]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentGatewayBatchItem_StudentPaymentGatewayBatch] FOREIGN KEY([PaymentGatewayBatchId])
REFERENCES [dbo].[StudentPaymentGatewayBatch] ([PaymentGatewayBatchId])
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatchItem] CHECK CONSTRAINT [FK_StudentPaymentGatewayBatchItem_StudentPaymentGatewayBatch]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatchItem]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentGatewayBatchItem_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentPaymentGatewayBatchItem] CHECK CONSTRAINT [FK_StudentPaymentGatewayBatchItem_Students]
GO
