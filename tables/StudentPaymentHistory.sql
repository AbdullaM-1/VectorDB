USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentHistory](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
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
	[StudentPaymentTemplateId] [int] NOT NULL,
	[PosTransaction] [decimal](18, 2) NOT NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[BankAccountName] [varchar](150) NULL,
	[BankBsbNumber] [varchar](50) NULL,
	[CreditCardNumber] [varchar](20) NULL,
	[NameOnCreditCard] [varchar](200) NULL,
	[CCExpiryDate] [varchar](50) NULL,
	[CardType] [varchar](20) NULL,
	[TransactionId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentPaymentHistory] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  CONSTRAINT [DF_StudentPaymentHistory_gateway_message]  DEFAULT ('-') FOR [gateway_message]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  CONSTRAINT [DF_StudentPaymentHistory_IsRefund]  DEFAULT ((0)) FOR [IsRefund]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  DEFAULT (NULL) FOR [JoiningFee]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  DEFAULT ((0)) FOR [StudentPaymentTemplateId]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  DEFAULT ((0)) FOR [PosTransaction]
GO
ALTER TABLE [dbo].[StudentPaymentHistory] ADD  DEFAULT ('0') FOR [TransactionId]
GO
ALTER TABLE [dbo].[StudentPaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentHistory_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentPaymentHistory] CHECK CONSTRAINT [FK_StudentPaymentHistory_Students]
GO
