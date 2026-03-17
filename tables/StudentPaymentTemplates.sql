USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPaymentTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[PaymentType] [int] NOT NULL,
	[MembershipStartDateTimeLocal] [datetime] NOT NULL,
	[PaymentStartDateTimeLocal] [datetime] NULL,
	[MinimumTermDateTimeLocal] [datetime] NULL,
	[MembershipExpiryDateTimeLocal] [datetime] NULL,
	[Installment] [bit] NULL,
	[NormalPaymentAmount] [money] NULL,
	[SuspensionFee] [money] NULL,
	[SuspensionDays] [smallint] NULL,
	[Renewal] [nvarchar](10) NULL,
	[PreferredBillingDayOfWeek] [int] NULL,
	[BSBNumber1] [varchar](5) NULL,
	[BSBNumber2] [varchar](5) NULL,
	[AccountName] [varchar](150) NULL,
	[AccountNumber] [varchar](50) NULL,
	[CCNumber] [varchar](20) NULL,
	[CCExpiryMonth] [int] NULL,
	[CCExpiryYear] [int] NULL,
	[CCCardType] [varchar](20) NULL,
	[PaymentSurcharge] [money] NULL,
	[IsPaymentinfoRegistered] [bit] NOT NULL,
	[NextInstallmentDateTimeLocal] [datetime] NULL,
	[HowPaid] [int] NULL,
	[ChargeTransactionFee] [bit] NOT NULL,
	[PaymentGatewayId] [int] NULL,
	[ContractPayoutUTCDateTime] [datetime] NULL,
	[JoiningFee] [money] NULL,
	[CCNameOnCard] [nvarchar](200) NULL,
	[PaymentGatewayToken] [varchar](50) NULL,
	[IsRestored] [bit] NULL,
	[MembershipTypeId] [int] NULL,
	[CreatedUtcDateTime] [datetime] NULL,
	[CancellationDateTimeLocal] [datetime] NULL,
	[OverrideProrata] [bit] NOT NULL,
	[RestoreDateTimeLocal] [datetime] NULL,
	[NumberOfPayment] [int] NULL,
	[PaymentFrequency] [varchar](50) NULL,
	[TransactionFee] [decimal](18, 2) NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[SetupFee] [money] NULL,
	[StudentSwimClassBookingDetailId] [int] NULL,
	[SwimClassTermIsExpired] [bit] NULL,
	[IsFirstPayment] [bit] NOT NULL,
	[ProratedCharge] [decimal](6, 2) NOT NULL,
	[AddOnAmount] [money] NOT NULL,
	[AddOnDateFrom] [datetime] NULL,
	[AddOnDateTo] [datetime] NULL,
	[AddOnReason] [nvarchar](100) NULL,
	[IsOngoingAddOnAmount] [bit] NOT NULL,
	[ClassPreviousAmount] [decimal](18, 2) NULL,
	[ClassAmountIsOngoing] [bit] NULL,
	[ClassAmountDateFromLocal] [datetime] NULL,
	[ClassAmountDateToLocal] [datetime] NULL,
	[ClassAmountReason] [varchar](max) NULL,
	[PaymentGatewayRefId] [varchar](50) NULL,
	[NextSuspensionInstallmentDate] [datetime] NULL,
	[SuspensionPaymentType] [int] NULL,
	[PaymentGatewayRefPaymentType] [int] NULL,
	[PaymentBreakUntilDateLocal] [datetime] NULL,
	[AutoRenew] [bit] NOT NULL,
	[TokenProviderId] [int] NOT NULL,
	[TokenReference] [varchar](100) NULL,
	[NetworkToken] [varchar](30) NULL,
 CONSTRAINT [PK_StudentPaymentTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF_StudentPaymentTemplates_PaymentType]  DEFAULT ((0)) FOR [PaymentType]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF_StudentPaymentTemplates_IsPaymentinfoRegistered]  DEFAULT ((0)) FOR [IsPaymentinfoRegistered]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF_StudentPaymentTemplates_ChargeTransactionFee]  DEFAULT ((1)) FOR [ChargeTransactionFee]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF__StudentPa__Contr__035C66C6]  DEFAULT (NULL) FOR [ContractPayoutUTCDateTime]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF__StudentPa__Joini__04508AFF]  DEFAULT (NULL) FOR [JoiningFee]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF_StudentPaymentTemplates_CreatedDateDefault]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF__StudentPa__Overr__0638D371]  DEFAULT ('0') FOR [OverrideProrata]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF__StudentPa__Trans__072CF7AA]  DEFAULT ((0)) FOR [TransactionFee]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF__StudentPa__Acces__08211BE3]  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((0)) FOR [SwimClassTermIsExpired]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((1)) FOR [IsFirstPayment]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((0)) FOR [ProratedCharge]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  CONSTRAINT [DF_StudentPaymentTemplates_AddOnAmount]  DEFAULT ((0)) FOR [AddOnAmount]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((0)) FOR [IsOngoingAddOnAmount]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((0)) FOR [AutoRenew]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] ADD  DEFAULT ((3)) FOR [TokenProviderId]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentTemplates_PaymentGateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] CHECK CONSTRAINT [FK_StudentPaymentTemplates_PaymentGateway]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentTemplates_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] CHECK CONSTRAINT [FK_StudentPaymentTemplates_Students]
GO
ALTER TABLE [dbo].[StudentPaymentTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StudentPaymentTemplates_StudentSwimClassBookingDetail] FOREIGN KEY([StudentSwimClassBookingDetailId])
REFERENCES [dbo].[StudentSwimClassBookingDetail] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentPaymentTemplates] CHECK CONSTRAINT [FK_StudentPaymentTemplates_StudentSwimClassBookingDetail]
GO
