USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSubscription](
	[MemberSubscriptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PosTransactionId] [bigint] NULL,
	[ItemDescription] [nvarchar](500) NULL,
	[ItemAmount] [decimal](18, 2) NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[SubscriptionId] [int] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[CancelledDateUtc] [datetime] NULL,
	[CancelledBy] [int] NULL,
	[CurrentAmount] [decimal](18, 2) NULL,
	[PreviousAmount] [decimal](18, 2) NULL,
	[IsOngoing] [bit] NULL,
	[UntilDateLocal] [datetime] NULL,
	[DateFromLocal] [datetime] NULL,
	[DateToLocal] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[EditedNumberOfSession] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[StoredCredit] [int] NOT NULL,
	[ExpirationDays] [int] NOT NULL,
	[PurchaseDateUtc] [datetime] NULL,
	[CompletedDateUtc] [datetime] NULL,
	[PaymentMessageId] [varchar](50) NULL,
	[SalesPersonId] [int] NULL,
 CONSTRAINT [PK_MemberSubscription] PRIMARY KEY CLUSTERED 
(
	[MemberSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberSubscription] ADD  DEFAULT ((0)) FOR [EditedNumberOfSession]
GO
ALTER TABLE [dbo].[MemberSubscription] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[MemberSubscription] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[MemberSubscription] ADD  DEFAULT ((0)) FOR [StoredCredit]
GO
ALTER TABLE [dbo].[MemberSubscription] ADD  DEFAULT ((0)) FOR [ExpirationDays]
GO
ALTER TABLE [dbo].[MemberSubscription]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscription_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberSubscription] CHECK CONSTRAINT [FK_MemberSubscription_Members]
GO
ALTER TABLE [dbo].[MemberSubscription]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscription_PosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[PosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[MemberSubscription] CHECK CONSTRAINT [FK_MemberSubscription_PosTransaction]
GO
ALTER TABLE [dbo].[MemberSubscription]  WITH CHECK ADD  CONSTRAINT [FK_MemberSubscription_Subscription] FOREIGN KEY([SubscriptionId])
REFERENCES [dbo].[Subscription] ([SubscriptionId])
GO
ALTER TABLE [dbo].[MemberSubscription] CHECK CONSTRAINT [FK_MemberSubscription_Subscription]
GO
