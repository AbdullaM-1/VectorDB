USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOtherMembership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[SalesPerson] [int] NULL,
	[MembershipTypeId] [int] NULL,
	[PaymentStartDateLocal] [datetime] NULL,
	[MembershipExpiryDateLocal] [datetime] NULL,
	[HowPaid] [int] NULL,
	[JoiningFee] [money] NULL,
	[TransactionFee] [decimal](18, 2) NULL,
	[PaymentFrequency] [varchar](50) NULL,
	[Duration] [int] NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[CreatedUtcDateTime] [datetime] NULL,
	[UpdateUtcDateTime] [datetime] NULL,
	[IsUse] [bit] NULL,
	[MembershipOptionType] [int] NULL,
	[Visit] [int] NULL,
	[RemainingVisit] [int] NULL,
	[VisitDuration] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CompletedDateUtc] [datetime] NULL,
	[CancelledUtcDateTime] [datetime] NULL,
	[CancelledBy] [int] NULL,
	[PaymentHistoryId] [int] NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaymentMessageId] [varchar](100) NULL,
 CONSTRAINT [PK_MemberOtherMembership] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberOtherMembership] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[MemberOtherMembership] ADD  CONSTRAINT [MemberOtherMembership_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[MemberOtherMembership] ADD  CONSTRAINT [MemberOtherMembership_UpdateUtcDateTime]  DEFAULT (getutcdate()) FOR [UpdateUtcDateTime]
GO
ALTER TABLE [dbo].[MemberOtherMembership] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[MemberOtherMembership]  WITH CHECK ADD  CONSTRAINT [FK_MemberOtherMembership_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberOtherMembership] CHECK CONSTRAINT [FK_MemberOtherMembership_Members]
GO
ALTER TABLE [dbo].[MemberOtherMembership]  WITH CHECK ADD  CONSTRAINT [FK_MemberOtherMembership_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[MemberOtherMembership] CHECK CONSTRAINT [FK_MemberOtherMembership_MembershipTypes]
GO
ALTER TABLE [dbo].[MemberOtherMembership]  WITH CHECK ADD  CONSTRAINT [FK_MemberOtherMembership_PaymentHistory_PaymentHistoryId] FOREIGN KEY([PaymentHistoryId])
REFERENCES [dbo].[PaymentHistory] ([payment_id])
GO
ALTER TABLE [dbo].[MemberOtherMembership] CHECK CONSTRAINT [FK_MemberOtherMembership_PaymentHistory_PaymentHistoryId]
GO
