USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prospects](
	[ProspectId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[ProspectFirstName] [varchar](50) NULL,
	[ProspectLastName] [varchar](50) NULL,
	[ProspectDateOfBirth] [smalldatetime] NULL,
	[ProspectAddress] [varchar](max) NULL,
	[ProspectEmail] [varchar](50) NULL,
	[ProspectSuburb] [varchar](50) NULL,
	[ProspectState] [varchar](50) NULL,
	[ProspectPostCode] [varchar](50) NULL,
	[ProspectHomePhone] [varchar](50) NULL,
	[ProspectMobile] [varchar](50) NULL,
	[ProspectStatus] [varchar](25) NULL,
	[Archived] [bit] NOT NULL,
	[IsNewProspect] [bit] NOT NULL,
	[LastStatusUpdateUtc] [datetime] NULL,
	[AccountId] [int] NULL,
	[CreatedBy] [int] NULL,
	[DateConverted] [datetime] NULL,
	[TrialStartDateUtc] [datetime] NULL,
	[TrialEndDateUtc] [datetime] NULL,
	[ConvertedMemberNumber] [varchar](10) NULL,
	[ProspectGender] [varchar](50) NULL,
	[ProspectMedicalAilments] [varchar](max) NULL,
	[StaffId] [int] NULL,
	[CreatedDateUtc] [datetime] NULL,
	[HowHeard] [int] NULL,
	[ContactMethodId] [int] NULL,
	[PhotoLocation] [varchar](300) NULL,
	[ProspectBarcode] [varchar](16) NULL,
	[EntryType] [varchar](30) NULL,
	[AccessControlUserId] [int] NULL,
	[AddressLine1] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[ReferredBy] [varchar](200) NULL,
	[IsSmsBlocked] [bit] NOT NULL,
	[PosReferralLink] [varchar](10) NULL,
	[IsEmailSubscribed] [bit] NOT NULL,
	[MembershipEnquiryType] [int] NOT NULL,
	[CasualVisitReasonId] [int] NOT NULL,
	[TrialWaiverSignature] [nvarchar](max) NULL,
	[IsBadEmail] [bit] NOT NULL,
	[IsBadMobile] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[SourcePage] [int] NULL,
	[BestTimeToCall] [nvarchar](100) NULL,
	[BestContactMethod] [nvarchar](100) NULL,
	[UtmSource] [varchar](200) NULL,
	[UtmCampaign] [varchar](200) NULL,
	[DriversLicense] [nvarchar](50) NULL,
	[EmergencyContactName] [varchar](50) NULL,
	[EmergencyContactNumber] [varchar](50) NULL,
	[EmergencyRelationship] [varchar](50) NULL,
	[PortalUserId] [nvarchar](128) NULL,
	[AccessPin] [varchar](50) NULL,
	[ReferredByNumber] [varchar](20) NULL,
 CONSTRAINT [PK_Prospects] PRIMARY KEY CLUSTERED 
(
	[ProspectNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Prospects] ADD  CONSTRAINT [DF__Prospects_Archived_default_false]  DEFAULT ((0)) FOR [Archived]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [IsSmsBlocked]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((1)) FOR [IsEmailSubscribed]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [MembershipEnquiryType]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [CasualVisitReasonId]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [IsBadEmail]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [IsBadMobile]
GO
ALTER TABLE [dbo].[Prospects] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Prospects]  WITH CHECK ADD  CONSTRAINT [FK_Prospects_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Prospects] CHECK CONSTRAINT [FK_Prospects_Account]
GO
ALTER TABLE [dbo].[Prospects]  WITH CHECK ADD  CONSTRAINT [FK_Prospects_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Prospects] CHECK CONSTRAINT [FK_Prospects_Staff]
GO
