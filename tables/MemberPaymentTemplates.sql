USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPaymentTemplates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NULL,
	[payment_type] [int] NOT NULL,
	[membership_start_date] [datetime] NOT NULL,
	[payment_start_date] [datetime] NULL,
	[minimum_term_date] [datetime] NULL,
	[membership_expiry_date] [datetime] NULL,
	[installment] [bit] NOT NULL,
	[normal_payment_amount] [money] NOT NULL,
	[suspension_fee] [money] NOT NULL,
	[suspension_days] [smallint] NOT NULL,
	[renewal] [nvarchar](10) NULL,
	[preferred_billing_day_of_week] [int] NULL,
	[BSBNumber1] [varchar](5) NULL,
	[BSBNumber2] [varchar](5) NULL,
	[AccountName] [varchar](150) NULL,
	[AccountNumber] [varchar](50) NULL,
	[CCNumber] [varchar](20) NULL,
	[CCExpiryMonth] [int] NULL,
	[CCExpiryYear] [int] NULL,
	[CCCardType] [varchar](20) NULL,
	[payment_surcharge] [money] NOT NULL,
	[is_paymentinfo_registered] [bit] NOT NULL,
	[next_installment_date] [datetime] NULL,
	[how_paid] [int] NOT NULL,
	[charge_transaction_fee] [bit] NOT NULL,
	[PaymentGatewayId] [int] NULL,
	[ContractPayoutUTCDateTime] [datetime] NULL,
	[JoiningFee] [money] NULL,
	[CCNameOnCard] [nvarchar](200) NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[IsRestored] [bit] NOT NULL,
	[MembershipTypeId] [int] NULL,
	[CancellationDate] [datetime] NULL,
	[CreatedUtcDateTime] [datetime] NULL,
	[OverrideProrata] [bit] NOT NULL,
	[RestoreDate] [datetime] NULL,
	[NumberOfPayment] [int] NOT NULL,
	[PaymentFrequency] [varchar](50) NULL,
	[TransactionFee] [decimal](18, 2) NOT NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[SetupFee] [money] NULL,
	[AddOnAmount] [decimal](18, 2) NULL,
	[IsOngoingAddOnAmount] [bit] NULL,
	[AddOnBillUntilDate] [datetime] NULL,
	[IsNotifyDueToExpire] [bit] NOT NULL,
	[AddOnDateFrom] [datetime] NULL,
	[AddOnDateTo] [datetime] NULL,
	[AddOnReason] [varchar](max) NULL,
	[IsOnlinePifPaid] [bit] NULL,
	[DiscountCouponId] [bigint] NULL,
	[ProratedCharge] [decimal](6, 2) NOT NULL,
	[IsJoiningFeePaidViaPos] [bit] NOT NULL,
	[IsAccessCardFeePaidViaPos] [bit] NOT NULL,
	[ContractAmount] [decimal](18, 2) NOT NULL,
	[ChargeCardSurcharge] [bit] NOT NULL,
	[IsNotifyCCDueToExpire] [bit] NOT NULL,
	[ContractSpecialCondition] [varchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsRenewed] [bit] NOT NULL,
	[MembershipSaleDate] [datetime] NOT NULL,
	[MobileAccess] [int] NOT NULL,
	[PaymentGatewayRefId] [varchar](50) NULL,
	[NextSuspensionInstallmentDate] [datetime] NULL,
	[SuspensionPaymentType] [int] NULL,
	[PaymentGatewayRefPaymentType] [int] NULL,
	[PaymentBreakUntilDateLocal] [datetime] NULL,
	[PaymentAccountBlockUtcDateTime] [datetime] NULL,
	[TokenProviderId] [int] NOT NULL,
	[TokenReference] [varchar](100) NULL,
	[NetworkToken] [varchar](30) NULL,
 CONSTRAINT [PK_MemberPaymentTemplates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_payment_type]  DEFAULT ((0)) FOR [payment_type]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_installment]  DEFAULT ((0)) FOR [installment]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_normal_payment_amount]  DEFAULT ((0)) FOR [normal_payment_amount]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_suspension_fee]  DEFAULT ((0)) FOR [suspension_fee]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_suspension_days]  DEFAULT ((0)) FOR [suspension_days]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_payment_surcharge]  DEFAULT ((0)) FOR [payment_surcharge]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_is_paymentinfo_registered]  DEFAULT ((0)) FOR [is_paymentinfo_registered]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_how_paid]  DEFAULT ((0)) FOR [how_paid]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_charge_transaction_fee]  DEFAULT ((1)) FOR [charge_transaction_fee]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT (NULL) FOR [ContractPayoutUTCDateTime]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT (NULL) FOR [JoiningFee]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_charge_IsRestored]  DEFAULT ((0)) FOR [IsRestored]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_CreatedDateDefault]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ('0') FOR [OverrideProrata]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_NumberOfPayment]  DEFAULT ((0)) FOR [NumberOfPayment]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_TransactionFee]  DEFAULT ((0)) FOR [TransactionFee]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [AddOnAmount]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_charge_IsNotifyDueToExpire]  DEFAULT ((0)) FOR [IsNotifyDueToExpire]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [ProratedCharge]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsJoiningFeePaidViaPos]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsAccessCardFeePaidViaPos]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [ContractAmount]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((1)) FOR [ChargeCardSurcharge]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsNotifyCCDueToExpire]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsRenewed]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  CONSTRAINT [DF_MemberPaymentTemplates_MembershipSaleDate]  DEFAULT (getutcdate()) FOR [MembershipSaleDate]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((0)) FOR [MobileAccess]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] ADD  DEFAULT ((3)) FOR [TokenProviderId]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentTemplates_DiscountCoupons] FOREIGN KEY([DiscountCouponId])
REFERENCES [dbo].[DiscountCoupons] ([Id])
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] CHECK CONSTRAINT [FK_MemberPaymentTemplates_DiscountCoupons]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentTemplates_Members1] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] CHECK CONSTRAINT [FK_MemberPaymentTemplates_Members1]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentTemplates_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] CHECK CONSTRAINT [FK_MemberPaymentTemplates_MembershipTypes]
GO
ALTER TABLE [dbo].[MemberPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentTemplates_PaymentGateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[MemberPaymentTemplates] CHECK CONSTRAINT [FK_MemberPaymentTemplates_PaymentGateway]
GO
