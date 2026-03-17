USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTypes](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_type_id] [int] NULL,
	[description] [varchar](50) NULL,
	[payment_frequency] [varchar](50) NULL,
	[duration] [int] NULL,
	[no_of_payment] [int] NULL,
	[UFN] [bit] NULL,
	[membership_total] [money] NULL,
	[joining_fee] [money] NULL,
	[suspension_days] [int] NULL,
	[individual_payment_price] [money] NOT NULL,
	[DaysNoticeRequired] [int] NULL,
	[CancellationFee] [money] NULL,
	[CancellationFeeOnlyInTerm] [bit] NULL,
	[CancellationFeeAlwaysApplied] [bit] NULL,
	[MaximumSuspensionDays] [int] NULL,
	[NoContract] [bit] NULL,
	[IsWebPurchasable] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MemberAttendanceRestrictionId] [int] NULL,
	[VisitDuration] [int] NULL,
	[Visit] [int] NULL,
	[AccessCardFee] [decimal](18, 2) NULL,
	[IsAddOn] [bit] NULL,
	[AddOnAmount] [decimal](18, 2) NULL,
	[IsOngoingAddOnAmount] [bit] NULL,
	[ExpiryDate] [datetime] NULL,
	[PtFrequency] [int] NULL,
	[NumberofPtsessions] [int] NULL,
	[MaxNumberOfBookedClasses] [int] NULL,
	[ExpirationDays] [int] NOT NULL,
	[OnlineSignupTag] [nvarchar](1000) NULL,
	[MembershipCategoryId] [smallint] NULL,
	[IsIntroductoryMembership] [bit] NOT NULL,
	[Department] [int] NOT NULL,
	[NoOfDaysAllowMembershipStartDate] [int] NOT NULL,
	[SubDescription] [nvarchar](500) NULL,
	[Photo] [varchar](2000) NULL,
	[ContractFormId] [int] NOT NULL,
	[CancellationFormId] [int] NOT NULL,
	[LongDescription] [nvarchar](max) NULL,
	[OnlineSortOrder] [int] NOT NULL,
	[OnlineMembershipStartDateLocal] [datetime] NULL,
	[GroupClassRestrictionType] [varchar](50) NULL,
	[GroupClassRestrictionFrequency] [varchar](15) NULL,
	[GroupClassRestrictionNoOfSession] [int] NOT NULL,
	[OnlinePaymentMethodDesc] [varchar](100) NULL,
	[OnlineFeesDesc] [varchar](250) NULL,
	[RequiredPaymentDetail] [bit] NOT NULL,
	[NoOfDaysAllowPaymentStartDate] [int] NOT NULL,
	[DdrDebitFormId] [int] NOT NULL,
	[DdrCreditFormId] [int] NOT NULL,
	[DefaultPaymentStartDate] [datetime] NULL,
	[PaymentStartDateFreeDays] [int] NULL,
	[OnlineLinkSubscriptions] [varchar](500) NULL,
	[OnlineLinkMembershipAddOns] [varchar](500) NULL,
	[SpecialConditions] [varchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[EnableAutoVariation] [bit] NOT NULL,
	[VariationAmount] [decimal](18, 2) NOT NULL,
	[VariationDays] [int] NOT NULL,
	[VariationReason] [varchar](max) NULL,
	[InClubOnlineSortOrder] [int] NOT NULL,
	[MobileAccess] [int] NOT NULL,
	[ShowInClubLink] [bit] NOT NULL,
	[CostPerSession] [decimal](9, 2) NOT NULL,
	[SuspensionFee] [decimal](18, 2) NOT NULL,
	[IsFitnessPassportIdRequired] [bit] NOT NULL,
	[OnlineSignupCompletionMessage] [varchar](200) NULL,
	[StaffCommission] [decimal](18, 2) NOT NULL,
	[IsExcludeFromDashboardRetention] [bit] NOT NULL,
	[IsExcludeFromDashboardActiveMembers] [bit] NOT NULL,
	[OnlineExtraLinkSubscriptions] [varchar](500) NULL,
	[OnlineExtraLinkMembershipAddOns] [varchar](500) NULL,
	[MinimumSuspensionDays] [int] NULL,
	[NewMemberOnlyOnlineSignup] [bit] NOT NULL,
	[IsExcludeFromDashboardArchiveMembers] [bit] NOT NULL,
	[IsIncludeInDashboardRestoredAsNewMembers] [bit] NOT NULL,
	[ExcludeProspectSalesStat] [bit] NOT NULL,
	[OnlineSignupRedirectUrl] [varchar](500) NULL,
	[GlCode] [varchar](100) NULL,
	[EnableAgeRange] [bit] NOT NULL,
	[AgeRangeMinimum] [int] NULL,
	[AgeRangeMaximum] [int] NULL,
	[ShowWexerTileInApp] [bit] NOT NULL,
	[RestrictRenewalInApp] [bit] NOT NULL,
	[AllowedMembershipTypesForRenewal] [varchar](500) NULL,
	[EnableAutoRenewalEmail] [bit] NOT NULL,
	[MaxOnlineCapacity] [int] NOT NULL,
	[AllowedDigitalDoorRelays] [varchar](50) NULL,
	[PackageSubscriptions] [varchar](500) NULL,
	[PackageAddOns] [varchar](500) NULL,
	[SMSExpiryIsEnabled] [bit] NOT NULL,
	[SMSExpiryText] [varchar](2000) NULL,
	[EnablePriorityAppBookings] [bit] NOT NULL,
	[OnlineBundledProductSale] [varchar](500) NULL,
	[IsChargePerSession] [bit] NOT NULL,
	[ChargePerSessionAccessInMinutes] [int] NULL,
	[DeletedById] [int] NULL,
	[DeletedDate] [datetime] NULL,
	[GroupClassRestrictionSuperCategory] [varchar](100) NULL,
	[EnableShopifyCheckout] [bit] NOT NULL,
	[OverrideMobileAccessDoorGeofence] [bit] NOT NULL,
	[OnlineSignupExtraModalTitle] [varchar](200) NULL,
	[OnlineSignupExtraModalHideNoThanksButton] [bit] NOT NULL,
	[OnlineSignupExtraModalTabOrder] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MembershipTypes] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_individual_payment_price]  DEFAULT ((0)) FOR [individual_payment_price]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT (NULL) FOR [DaysNoticeRequired]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT (NULL) FOR [CancellationFee]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT (NULL) FOR [CancellationFeeOnlyInTerm]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT (NULL) FOR [CancellationFeeAlwaysApplied]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT (NULL) FOR [MaximumSuspensionDays]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsWebPurchasable]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [AccessCardFee]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [AddOnAmount]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_ExpirationDays]  DEFAULT ((0)) FOR [ExpirationDays]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsIntroductoryMembership]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_Department]  DEFAULT ((1)) FOR [Department]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [NoOfDaysAllowMembershipStartDate]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [ContractFormId]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [CancellationFormId]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_OnlineSortOrder]  DEFAULT ((0)) FOR [OnlineSortOrder]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_GroupClassRestrictionNoOfSession]  DEFAULT ((0)) FOR [GroupClassRestrictionNoOfSession]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  CONSTRAINT [DF_MembershipTypes_RequiredPaymentDetail]  DEFAULT ((0)) FOR [RequiredPaymentDetail]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [NoOfDaysAllowPaymentStartDate]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [DdrDebitFormId]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [DdrCreditFormId]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [EnableAutoVariation]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [VariationAmount]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [VariationDays]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [InClubOnlineSortOrder]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [MobileAccess]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((1)) FOR [ShowInClubLink]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [CostPerSession]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [SuspensionFee]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsFitnessPassportIdRequired]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [StaffCommission]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsExcludeFromDashboardRetention]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsExcludeFromDashboardActiveMembers]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [NewMemberOnlyOnlineSignup]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsExcludeFromDashboardArchiveMembers]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsIncludeInDashboardRestoredAsNewMembers]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [ExcludeProspectSalesStat]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [EnableAgeRange]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [ShowWexerTileInApp]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [RestrictRenewalInApp]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [EnableAutoRenewalEmail]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [MaxOnlineCapacity]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [SMSExpiryIsEnabled]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [EnablePriorityAppBookings]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [IsChargePerSession]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [EnableShopifyCheckout]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [OverrideMobileAccessDoorGeofence]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ((0)) FOR [OnlineSignupExtraModalHideNoThanksButton]
GO
ALTER TABLE [dbo].[MembershipTypes] ADD  DEFAULT ('service,groupclass,creche') FOR [OnlineSignupExtraModalTabOrder]
GO
ALTER TABLE [dbo].[MembershipTypes]  WITH CHECK ADD  CONSTRAINT [FK_MembershipTypes_MemberAttendanceRestriction] FOREIGN KEY([MemberAttendanceRestrictionId])
REFERENCES [dbo].[MemberAttendanceRestriction] ([Id])
GO
ALTER TABLE [dbo].[MembershipTypes] CHECK CONSTRAINT [FK_MembershipTypes_MemberAttendanceRestriction]
GO
ALTER TABLE [dbo].[MembershipTypes]  WITH CHECK ADD  CONSTRAINT [FK_MembershipTypes_MembershipContractTypes] FOREIGN KEY([contract_type_id])
REFERENCES [dbo].[MembershipContractTypes] ([contract_type_id])
GO
ALTER TABLE [dbo].[MembershipTypes] CHECK CONSTRAINT [FK_MembershipTypes_MembershipContractTypes]
GO
ALTER TABLE [dbo].[MembershipTypes]  WITH CHECK ADD  CONSTRAINT [FK_MembershipTypes_Staff_DeletedById] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MembershipTypes] CHECK CONSTRAINT [FK_MembershipTypes_Staff_DeletedById]
GO
