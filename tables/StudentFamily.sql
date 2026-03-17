USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFamily](
	[StudentFamilyId] [bigint] IDENTITY(1,1) NOT NULL,
	[FamilyName] [nvarchar](100) NULL,
	[PersonName] [nvarchar](100) NULL,
	[PersonContactNumber] [nvarchar](100) NULL,
	[Street] [nvarchar](500) NULL,
	[SubUrb] [nvarchar](500) NULL,
	[State] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[CreatedDateUtc] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[AccountId] [int] NOT NULL,
	[PortalUserId] [nvarchar](128) NULL,
	[HasAppAccess] [bit] NOT NULL,
	[HasMobileApp] [bit] NOT NULL,
	[FamilyNameSecondary] [nvarchar](100) NULL,
	[PersonNameSecondary] [nvarchar](100) NULL,
	[EmailSecondary] [nvarchar](100) NULL,
	[PersonContactNumberSecondary] [nvarchar](100) NULL,
	[IsCovidVaccinatedPrimary] [bit] NOT NULL,
	[CovidVaccinationDetailsPrimary] [varchar](500) NULL,
	[CovidVaccinatedDateTimeUtcRecordedPrimary] [datetime] NULL,
	[CovidVaccinatedRecordedByStaffIdPrimary] [int] NULL,
	[IsCovidVaccinatedSecondary] [bit] NOT NULL,
	[CovidVaccinationDetailsSecondary] [varchar](500) NULL,
	[CovidVaccinatedDateTimeUtcRecordedSecondary] [datetime] NULL,
	[CovidVaccinatedRecordedByStaffIdSecondary] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
 CONSTRAINT [PK_StudentFamily] PRIMARY KEY CLUSTERED 
(
	[StudentFamilyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  CONSTRAINT [DF_StudentFamily_HasAppAccess]  DEFAULT ((1)) FOR [HasAppAccess]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  CONSTRAINT [DF_StudentFamily_HasMobileApp]  DEFAULT ((0)) FOR [HasMobileApp]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  DEFAULT ((0)) FOR [IsCovidVaccinatedPrimary]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  DEFAULT ((0)) FOR [IsCovidVaccinatedSecondary]
GO
ALTER TABLE [dbo].[StudentFamily] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentFamily]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamily_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[StudentFamily] CHECK CONSTRAINT [FK_StudentFamily_Accounts_AccountId]
GO
ALTER TABLE [dbo].[StudentFamily]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamily_CovidVaccinatedRecordedByStaffIdPrimary_Staff_StaffId] FOREIGN KEY([CovidVaccinatedRecordedByStaffIdPrimary])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentFamily] CHECK CONSTRAINT [FK_StudentFamily_CovidVaccinatedRecordedByStaffIdPrimary_Staff_StaffId]
GO
ALTER TABLE [dbo].[StudentFamily]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamily_CovidVaccinatedRecordedByStaffIdSecondary_Staff_StaffId] FOREIGN KEY([CovidVaccinatedRecordedByStaffIdSecondary])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentFamily] CHECK CONSTRAINT [FK_StudentFamily_CovidVaccinatedRecordedByStaffIdSecondary_Staff_StaffId]
GO
ALTER TABLE [dbo].[StudentFamily]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamily_Staff_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[Staff] ([StaffId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentFamily] CHECK CONSTRAINT [FK_StudentFamily_Staff_DeletedBy]
GO
