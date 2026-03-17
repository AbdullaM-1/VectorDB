USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(90000,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Barcode] [varchar](10) NULL,
	[LastModifiedUTCDateTime] [datetime] NOT NULL,
	[MobilePhone] [nvarchar](20) NOT NULL,
	[HomePhone] [nvarchar](20) NULL,
	[PhotoLocation] [nvarchar](300) NULL,
	[Email] [nvarchar](255) NULL,
	[ProviderUserKey] [uniqueidentifier] NULL,
	[AccessControlUserId] [int] NULL,
	[Role] [nvarchar](20) NULL,
	[IsRegister] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[PosAccessPin] [nvarchar](4) NULL,
	[CanModify] [bit] NOT NULL,
	[IsSubscribeReminder] [bit] NOT NULL,
	[PreferredClub] [int] NULL,
	[EnablePreferredClubPrompt] [bit] NOT NULL,
	[HourlyRate] [money] NOT NULL,
	[RestrictAccessByIp] [bit] NOT NULL,
	[RestrictedIp] [varchar](50) NULL,
	[EnableMfa] [bit] NOT NULL,
	[MfaProvider] [int] NOT NULL,
	[IsSaleStaff] [bit] NOT NULL,
	[CreatedOnUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_LastModifiedUTCDateTime]  DEFAULT (getutcdate()) FOR [LastModifiedUTCDateTime]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (NULL) FOR [ProviderUserKey]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [IsRegister]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [CanModify]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [IsSubscribeReminder]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [PreferredClub]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [EnablePreferredClubPrompt]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [HourlyRate]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [RestrictAccessByIp]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [EnableMfa]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [MfaProvider]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [IsSaleStaff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_PreferredClubAccount] FOREIGN KEY([PreferredClub])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_PreferredClubAccount]
GO
