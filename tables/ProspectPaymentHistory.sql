USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectPaymentHistory](
	[ProspectPaymentHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[payment_date] [datetime] NOT NULL,
	[payment_amount] [money] NOT NULL,
	[gateway_message_id] [varchar](150) NOT NULL,
	[gateway_message] [varchar](1000) NOT NULL,
	[IsRefund] [bit] NOT NULL,
	[CardSurchargeFee] [money] NULL,
	[TransactionFee] [money] NULL,
	[TrainerFee] [money] NULL,
	[GatewayResponseCode] [varchar](5) NULL,
	[RefundedPaymentId] [int] NULL,
	[RefundStaffId] [int] NULL,
	[PosTransaction] [decimal](18, 2) NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[BankAccountName] [varchar](150) NULL,
	[BankBsbNumber] [varchar](50) NULL,
	[CreditCardNumber] [varchar](20) NULL,
	[NameOnCreditCard] [varchar](200) NULL,
	[CCExpiryDate] [varchar](50) NULL,
	[CardType] [varchar](20) NULL,
	[GatewayTnxReference] [nvarchar](80) NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[PaymentFor] [varchar](100) NULL,
	[PaymentForReferenceId] [varchar](200) NULL,
 CONSTRAINT [PK_ProspectPaymentHistory] PRIMARY KEY CLUSTERED 
(
	[ProspectPaymentHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectPaymentHistory] ADD  CONSTRAINT [DF_ProspectPaymentHistory_gateway_message]  DEFAULT ('-') FOR [gateway_message]
GO
ALTER TABLE [dbo].[ProspectPaymentHistory] ADD  CONSTRAINT [DF_ProspectPaymentHistory_IsRefund]  DEFAULT ((0)) FOR [IsRefund]
GO
ALTER TABLE [dbo].[ProspectPaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProspectPaymentHistory_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectPaymentHistory] CHECK CONSTRAINT [FK_ProspectPaymentHistory_Prospects]
GO
