USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NULL,
	[payment_date] [datetime] NOT NULL,
	[payment_amount] [money] NOT NULL,
	[gateway_message_id] [varchar](50) NOT NULL,
	[gateway_message] [varchar](1000) NOT NULL,
	[IsRefund] [bit] NOT NULL,
	[RegPaymentFee] [money] NULL,
	[CardSurchargeFee] [money] NULL,
	[TransactionFee] [money] NULL,
	[DishonourFee] [money] NULL,
	[ArrearsFee] [money] NULL,
	[SetupFee] [money] NULL,
	[GatewayResponseCode] [varchar](5) NULL,
	[JoiningFee] [money] NULL,
	[RefundedPaymentId] [int] NULL,
	[RefundStaffId] [int] NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[AddOnAmount] [decimal](18, 2) NULL,
	[PosTransaction] [decimal](18, 2) NULL,
	[Prorata] [decimal](18, 2) NULL,
	[Adjustment] [decimal](18, 2) NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[BankAccountName] [varchar](150) NULL,
	[BankBsbNumber] [varchar](50) NULL,
	[CreditCardNumber] [varchar](20) NULL,
	[NameOnCreditCard] [varchar](200) NULL,
	[CCExpiryDate] [varchar](50) NULL,
	[CardType] [varchar](20) NULL,
	[IsOngoingAddOnAmount] [bit] NULL,
	[AddOnBillUntilDate] [datetime] NULL,
	[AddOnDateFrom] [datetime] NULL,
	[AddOnDateTo] [datetime] NULL,
	[AddOnReason] [varchar](200) NULL,
	[SuspensionFee] [decimal](18, 2) NULL,
	[SubscriptionFee] [decimal](18, 2) NULL,
	[GatewayTnxReference] [nvarchar](80) NULL,
	[SubscriptionId] [int] NULL,
	[CancellationLateFee] [decimal](18, 2) NULL,
	[MaintenanceFee] [decimal](18, 2) NULL,
	[ClassNoShowFee] [decimal](18, 2) NULL,
	[PtNoShowFee] [decimal](18, 2) NULL,
	[IsOverduePaidOnline] [bit] NOT NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[TransactionId] [varchar](50) NOT NULL,
	[PaymentType] [varchar](5) NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CrecheClassNoShowFee] [decimal](8, 2) NULL,
	[PaymentFor] [varchar](100) NULL,
	[PaymentForReferenceId] [varchar](200) NULL,
	[ErrorDetail] [varchar](150) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  CONSTRAINT [DF_PaymentHistory_gateway_message]  DEFAULT ('-') FOR [gateway_message]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  CONSTRAINT [DF_PaymentHistory_IsRefund]  DEFAULT ((0)) FOR [IsRefund]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT (NULL) FOR [JoiningFee]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [AddOnAmount]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [PosTransaction]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [Prorata]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [Adjustment]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [IsOverduePaidOnline]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ('0') FOR [TransactionId]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHistory_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHistory_Members]
GO
