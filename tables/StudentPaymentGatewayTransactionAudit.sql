USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentGatewayTransactionAudit](
	[StudentPaymentGatewayTransactionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageId] [varchar](50) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[PaymentGatewayId] [int] NOT NULL,
	[RequestUTCDateTime] [datetime] NOT NULL,
	[ResponseUTCDateTime] [datetime] NULL,
	[RequestRawData] [nvarchar](max) NOT NULL,
	[ResponseRawData] [nvarchar](max) NULL,
	[BilledMembershipFee] [money] NULL,
	[BilledCardSurchargeFee] [money] NULL,
	[BilledArrearsFee] [money] NULL,
	[BilledSetupFee] [money] NULL,
	[BilledJoiningFee] [money] NULL,
	[BilledDishonourFee] [money] NULL,
	[BillingTransactionFee] [money] NULL,
	[BilledTotalAmount] [money] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ResponseCode] [varchar](5) NULL,
	[ResponseText] [varchar](150) NULL,
	[BillingFrequency] [varchar](20) NULL,
	[PaymentType] [varchar](5) NULL,
	[IsOnline] [bit] NULL,
	[TransactionTypeId] [int] NULL,
	[OrderId] [varchar](50) NOT NULL,
	[SettlementDate] [datetime] NULL,
	[SettlementId] [bigint] NULL,
	[CreditRef] [nvarchar](20) NULL,
	[IdempotencyKey] [varchar](50) NULL,
	[TransactionStatus] [varchar](200) NULL,
	[FailureReason] [varchar](200) NULL,
 CONSTRAINT [PK_StudentPaymentGatewayTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[StudentPaymentGatewayTransactionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayTransactionAudit] ADD  DEFAULT ('0') FOR [OrderId]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentGatewayTransactionAudit_PaymentGateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[StudentPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_StudentPaymentGatewayTransactionAudit_PaymentGateway]
GO
ALTER TABLE [dbo].[StudentPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentGatewayTransactionAudit_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_StudentPaymentGatewayTransactionAudit_Students]
GO
