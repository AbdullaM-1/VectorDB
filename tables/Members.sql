USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[member_first_name] [varchar](50) NULL,
	[member_last_name] [varchar](50) NULL,
	[member_dob] [smalldatetime] NULL,
	[member_gender] [varchar](50) NULL,
	[member_address] [varchar](300) NULL,
	[member_email] [varchar](150) NULL,
	[member_suburb] [varchar](50) NULL,
	[member_state] [varchar](50) NULL,
	[member_postcode] [varchar](50) NULL,
	[member_homephone] [varchar](50) NULL,
	[member_workphone] [varchar](50) NULL,
	[member_mobile] [varchar](50) NULL,
	[member_emergencycontactname] [varchar](50) NULL,
	[member_emergencycontactno] [varchar](50) NULL,
	[member_photo_location] [varchar](300) NULL,
	[member_sales_person] [int] NULL,
	[member_trainer] [int] NULL,
	[member_howheard] [int] NULL,
	[member_status] [varchar](50) NULL,
	[member_barcode] [varchar](30) NULL,
	[source_id] [varchar](50) NULL,
	[member_occupation] [varchar](50) NULL,
	[member_employer] [varchar](50) NULL,
	[last_sms_datetime] [datetime] NULL,
	[is_new_member] [bit] NOT NULL,
	[is_payment_pending] [bit] NOT NULL,
	[last_status_update_utcdatetime] [datetime] NULL,
	[MedicalInfo] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[MemberStreetNumber] [varchar](50) NULL,
	[AccessControlUserId] [int] NULL,
	[IsManuallyTag] [bit] NULL,
	[GeoCoordinates] [varchar](50) NULL,
	[HasMobileApp] [bit] NOT NULL,
	[PtFrequency] [int] NULL,
	[NumberofPtsessions] [int] NULL,
	[MaxNumberOfBookedClasses] [int] NULL,
	[IsSmsBlocked] [bit] NOT NULL,
	[Department] [int] NOT NULL,
	[IsEmailSubscribed] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[PortalUserId] [nvarchar](128) NULL,
	[EmergencyRelationship] [varchar](50) NULL,
	[FitnessPassportNumber] [varchar](20) NULL,
	[ReferredBy] [nvarchar](1000) NULL,
	[IsBadEmail] [bit] NOT NULL,
	[IsBadMobile] [bit] NOT NULL,
	[HasAppAccess] [bit] NOT NULL,
	[DriversLicense] [nvarchar](50) NULL,
	[AccessBlocked] [bit] NOT NULL,
	[AccessBlockedReason] [varchar](150) NULL,
	[IsOverduePaidOnline] [bit] NOT NULL,
	[IsBlackListed] [bit] NOT NULL,
	[IsCovidVaccinated] [bit] NOT NULL,
	[CovidVaccinationDetails] [varchar](500) NULL,
	[CovidVaccinatedDateTimeRecorded] [datetime] NULL,
	[CovidVaccinatedRecordedByStaffId] [int] NULL,
	[TransferMembershipUtcDateTime] [datetime] NULL,
	[TransferredFrom] [nvarchar](100) NULL,
	[Trainer] [int] NULL,
	[NDISNumber] [varchar](100) NULL,
	[StatusCheckSum] [varchar](128) NULL,
	[IsOnlineSignupCompleted] [bit] NULL,
	[ProspectNumber] [varchar](10) NULL,
	[LastRoyaltyChargedDateUtc] [datetime] NULL,
	[LastUpdatedUtcDateTime] [datetime] NULL,
	[OnlineSignupSource] [int] NULL,
	[FacialRecognitionId] [varchar](100) NULL,
	[AccessPin] [varchar](50) NULL,
	[LastVisitUtcDateTime] [datetime] NULL,
	[LastVisitLocalDateTime] [datetime] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[member_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_member_status]  DEFAULT (N'Active') FOR [member_status]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_is_new_member]  DEFAULT ((0)) FOR [is_new_member]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_is_payment_pending]  DEFAULT ((0)) FOR [is_payment_pending]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [HasMobileApp]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsSmsBlocked]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Department]  DEFAULT ((1)) FOR [Department]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((1)) FOR [IsEmailSubscribed]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsBadEmail]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsBadMobile]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((1)) FOR [HasAppAccess]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [AccessBlocked]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsOverduePaidOnline]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsBlackListed]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsCovidVaccinated]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Accounts]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Prospects_ProspectNumber] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Prospects_ProspectNumber]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_members_staff_CovidVaccinatedRecordedByStaffId] FOREIGN KEY([CovidVaccinatedRecordedByStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_members_staff_CovidVaccinatedRecordedByStaffId]
GO
