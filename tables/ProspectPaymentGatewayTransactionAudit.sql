USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPaymentGatewayTransactionAudit](
	[ProspectPaymentGatewayTransactionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageId] [varchar](50) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[PaymentGatewayId] [int] NOT NULL,
	[RequestUTCDateTime] [datetime] NOT NULL,
	[ResponseUTCDateTime] [datetime] NULL,
	[ResponseRawData] [varchar](500) NULL,
	[TrainerFee] [money] NULL,
	[TransactionFee] [money] NULL,
	[CardSurchargeFee] [money] NULL,
	[BilledTotalAmount] [money] NULL,
	[ResponseCode] [varchar](5) NULL,
	[ResponseText] [varchar](500) NULL,
	[BillingFrequency] [varchar](20) NULL,
	[PaymentType] [varchar](5) NULL,
	[IsOnline] [bit] NULL,
	[SettlementDate] [datetime] NULL,
 CONSTRAINT [PK_ProspectPaymentGatewayTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[ProspectPaymentGatewayTransactionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPaymentGatewayTransactionAudit_PaymentGateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[ProspectPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_ProspectPaymentGatewayTransactionAudit_PaymentGateway]
GO
ALTER TABLE [dbo].[ProspectPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPaymentGatewayTransactionAudit_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_ProspectPaymentGatewayTransactionAudit_Prospects]
GO
