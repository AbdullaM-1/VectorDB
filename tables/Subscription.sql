USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionName] [nvarchar](1000) NOT NULL,
	[NumberOfSession] [int] NOT NULL,
	[TotalCost] [decimal](18, 2) NOT NULL,
	[SubscriptionType] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedUtcDateTime] [datetime] NULL,
	[ClassScheduleIds] [nvarchar](100) NULL,
	[PtFrequency] [int] NOT NULL,
	[ContractType] [int] NOT NULL,
	[IsUnlimitedSession] [bit] NOT NULL,
	[IsWebPurchasable] [bit] NOT NULL,
	[AccountId] [int] NOT NULL,
	[PtSessionDuration] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
	[OnlineBodyDescription] [nvarchar](500) NULL,
	[OnlineFooterDescription] [nvarchar](1000) NULL,
	[IsGstRequired] [bit] NOT NULL,
	[ExpirationDays] [int] NOT NULL,
	[SubscriptionImage] [varchar](200) NULL,
	[OnlineFrequency] [int] NOT NULL,
	[MinimumTermEnabled] [bit] NOT NULL,
	[MinimumTermInDays] [int] NOT NULL,
	[SubscriptionCategoryId] [int] NULL,
	[AllowedOtherAccount] [varchar](500) NULL,
	[PtFrequencyAcrossAllClub] [bit] NOT NULL,
	[IsEnableExpiryDays] [bit] NOT NULL,
	[ExpiryDays] [int] NOT NULL,
	[DiscountCouponId] [bigint] NULL,
	[ShowWexerTileInApp] [bit] NOT NULL,
	[IsCommissionable] [bit] NOT NULL,
	[CommissionAmount] [decimal](18, 2) NOT NULL,
	[IsOnlineUpfrontPayment] [bit] NOT NULL,
	[AllowStoredCredits] [bit] NOT NULL,
	[AllowedDigitalDoorRelays] [varchar](50) NULL,
	[MobileAccess] [int] NOT NULL,
	[CancelSubscriptionWhenMembershipRenewed] [bit] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_PtFrequency]  DEFAULT ((0)) FOR [PtFrequency]
GO
ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_ContractType]  DEFAULT ((0)) FOR [ContractType]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [IsUnlimitedSession]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [IsWebPurchasable]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [PtSessionDuration]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((1)) FOR [IsGstRequired]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [ExpirationDays]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [OnlineFrequency]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [MinimumTermEnabled]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [MinimumTermInDays]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((1)) FOR [PtFrequencyAcrossAllClub]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [IsEnableExpiryDays]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [ExpiryDays]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [ShowWexerTileInApp]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [IsCommissionable]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [CommissionAmount]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [IsOnlineUpfrontPayment]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((1)) FOR [AllowStoredCredits]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [MobileAccess]
GO
ALTER TABLE [dbo].[Subscription] ADD  DEFAULT ((0)) FOR [CancelSubscriptionWhenMembershipRenewed]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_DiscountCoupon_DiscountCouponId] FOREIGN KEY([DiscountCouponId])
REFERENCES [dbo].[DiscountCoupons] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_DiscountCoupon_DiscountCouponId]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Lookup_Type_Items] FOREIGN KEY([SubscriptionCategoryId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Lookup_Type_Items]
GO
