/*
================================================================================
SCHEMA SEMANTICS (indexed with this file for vector search — same text as the DDL below)
================================================================================
Table: dbo.Members

SUMMARY FOR SEARCH AND DOCUMENTATION
The Members table holds club-member–specific data: which club (account) they belong to,
their membership status, contact details, access and communication flags, billing-related
flags, medical notes, trainer and sales attribution, and soft-delete metadata.

COLUMN REFERENCE
member_id is the table’s surrogate primary key (unique row identifier).
member_number is the member’s unique business identifier (also used as a key elsewhere).
member_first_name is the member’s given name.
member_last_name is the member’s surname, family name, or last name.
member_dob is the member’s date of birth.
member_gender is gender: M = Male, F = Female, O = Other, or blank if unspecified.
member_address is the street line of the postal address (number and street name).
member_email is the member’s email address.
member_suburb is the suburb part of the address.
member_state is the state or region part of the address.
member_postcode is the postcode or ZIP portion of the address.
member_homephone is the home phone number.
member_workphone is the work phone number.
member_mobile is the mobile phone number.
member_emergencycontactname is the name of the emergency contact.
member_emergencycontactno is the phone number for the emergency contact.
member_photo_location marks where a photo file would live; do not use photos in AI answers for now.
member_sales_person is the StaffId credited with selling this membership.
member_trainer is the TrainerId of the assigned trainer.
member_howheard is a foreign key into Lookup_Type_Items for how the member heard about the gym.
member_status is lifecycle/status: Active; Payment_Error (failed payment); Staging_Online_Signup;
Suspended; Pending_Online_Signup; Pending_Activation; WaitingConversion; Archived; and related states.
member_barcode is the barcode used by access-control systems to enter the facility.
FitnessPassportNumber stores the member’s Fitness Passport identifier.
source_id should be ignored for semantic Q&A.
member_occupation is the member’s job or occupation.
member_employer is the member’s employer name.
last_sms_datetime is the last local date/time an SMS was sent to the member.
is_new_member is true when the member has never been billed yet.
is_payment_pending is true when a payment is awaiting a response from the payment gateway.
last_status_update_utcdatetime is when the member_status last changed (UTC).
MedicalInfo holds free-text medical information for the member.
AccountId is the foreign key to Accounts (which club or account the member belongs to).
CreatedBy is the StaffId of the user who created the member record.
MemberStreetNumber is unused; ignore for analytics.
AccessControlUserId should be ignored for semantic Q&A.
IsManuallyTag should be ignored for semantic Q&A.
GeoCoordinates stores latitude and longitude for the member’s address.
HasMobileApp is true when the Clubfit mobile app is installed and activated for this profile.
PtFrequency should be ignored for semantic Q&A.
NumberofPtsessions should be ignored for semantic Q&A.
MaxNumberOfBookedClasses should be ignored for semantic Q&A.
IsSmsBlocked is true when the member opted out of SMS.
IsEmailSubscribed is false when the member opted out of marketing or email contact.
Department distinguishes gym vs swim: 1 = Gym, 2 = Swim.
DeletedDateUtc is when the member was soft-deleted (UTC).
DeletedBy identifies the staff user who performed the soft delete.
IsDeleted is true for soft-deleted members.
PortalUserId is the mobile app user id for this member.
ReferredBy names who referred the member to the gym.
EmergencyRelationship describes how the emergency contact is related to the member.
IsBadEmail is true when email to member_email bounces or is undeliverable.
IsBadMobile is true when SMS to member_mobile fails delivery.
HasAppAccess is true when the member may use the mobile app.
DriversLicense stores the member’s driver licence identifier if captured.
IsOverduePaidOnline is true when overdue balances were paid online.
IsBlackListed is true when staff flagged the member as blacklisted.
AccessBlocked is true when the facility should deny physical access.
AccessBlockedReason explains why access was blocked.
IsCovidVaccinated, CovidVaccinationDetails, CovidVaccinatedDateTimeRecorded, and
CovidVaccinatedRecordedByStaffId are legacy COVID fields; ignore for semantic Q&A.
TransferMembershipUtcDateTime is when this membership was transferred to the member (UTC).
TransferredFrom references the prior member record involved in a transfer.
Trainer (column) should be ignored for semantic Q&A.
NDISNumber holds the member’s NDIS number if applicable.
StatusCheckSum should be ignored for semantic Q&A.
IsOnlineSignupCompleted is true when online signup is finished.
ProspectNumber is set when the member was converted from a prospect.
LastRoyaltyChargedDateUtc is the last time a royalty fee was charged to this member (UTC).
LastUpdatedUtcDateTime is the last UTC time the member profile was updated.
OnlineSignupSource indicates origin of signup: 1 = OnlineSignup, 2 = InClubSignup.
FacialRecognitionId is the identifier in the facial-recognition access system.

Additional DDL-only columns (present in the script below) may appear without separate business descriptions; infer meaning from names and types in the CREATE TABLE block.
================================================================================
*/

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
