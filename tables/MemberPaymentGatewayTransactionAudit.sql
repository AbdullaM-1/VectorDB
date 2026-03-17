USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPaymentGatewayTransactionAudit](
	[MemberPaymentGatewayTransactionAuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageId] [varchar](50) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[PaymentGatewayId] [int] NOT NULL,
	[RequestUTCDateTime] [datetime] NOT NULL,
	[ResponseUTCDateTime] [datetime] NULL,
	[ResponseRawData] [varchar](200) NULL,
	[BilledMembershipFee] [money] NULL,
	[BilledCardSurchargeFee] [money] NULL,
	[BilledArrearsFee] [money] NULL,
	[BilledSetupFee] [money] NULL,
	[BilledJoiningFee] [money] NULL,
	[BilledDishonourFee] [money] NULL,
	[BillingTransactionFee] [money] NULL,
	[BilledTotalAmount] [money] NULL,
	[ResponseCode] [varchar](5) NULL,
	[ResponseText] [varchar](160) NULL,
	[BillingFrequency] [varchar](20) NULL,
	[PaymentType] [varchar](20) NULL,
	[IsOnline] [bit] NULL,
	[TransactionTypeId] [int] NULL,
	[MembershipTypeId] [int] NULL,
	[OrderId] [varchar](50) NOT NULL,
	[SettlementDate] [datetime] NULL,
	[CreditRef] [nvarchar](20) NULL,
	[SettlementId] [bigint] NULL,
	[IdempotencyKey] [varchar](50) NULL,
	[TransactionStatus] [varchar](200) NULL,
	[FailureReason] [varchar](200) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_MemberPaymentGatewayTransactionAudit] PRIMARY KEY CLUSTERED 
(
	[MemberPaymentGatewayTransactionAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit] ADD  DEFAULT ('0') FOR [OrderId]
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_Members]
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_MembershipTypes]
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_PaymentGateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[MemberPaymentGatewayTransactionAudit] CHECK CONSTRAINT [FK_MemberPaymentGatewayTransactionAudit_PaymentGateway]
GO
