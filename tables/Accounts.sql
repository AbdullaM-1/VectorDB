USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](50) NULL,
	[timezone] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[Street] [nvarchar](500) NULL,
	[SubUrb] [nvarchar](500) NULL,
	[State] [nvarchar](500) NULL,
	[PostalCode] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[WebsiteUrl] [varchar](500) NULL,
	[FacebookUrl] [varchar](500) NULL,
	[AddressLine1] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[DialingCode] [nvarchar](5) NOT NULL,
	[BusinessOwnerName] [varchar](100) NULL,
	[BusinessOwnerPhoneNumber] [varchar](100) NULL,
	[BusinessOwnerEmail] [varchar](100) NULL,
	[GeoCoordinates] [varchar](75) NULL,
	[ClubfitFeeFailedPaymentCount] [int] NOT NULL,
	[PaymentIssueSuspensionDate] [datetime] NULL,
	[AdvancedEmailEditorUid] [uniqueidentifier] NOT NULL,
	[CompanyLegalName] [varchar](200) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((61)) FOR [DialingCode]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [ClubfitFeeFailedPaymentCount]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (newsequentialid()) FOR [AdvancedEmailEditorUid]
GO
