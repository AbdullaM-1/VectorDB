/*
================================================================================
SCHEMA SEMANTICS (indexed with this file for vector search — same text as the DDL below)
================================================================================
Table: dbo.Accounts

SUMMARY FOR SEARCH AND DOCUMENTATION
The Accounts table stores information specific to an account. An account is also
commonly known as a club (site, venue, or tenant in the Clubfit sense).

COLUMN REFERENCE
account_id is the table’s unique identifier (primary key).
account_name is the display name of the account or club.
timezone is the time zone the account operates in.
IsActive is true when the account is active.
AddressLine1 should be ignored for semantic Q&A.
Street is the street line of the account address.
SubUrb is the suburb part of the account address (column name uses mixed casing as in DDL).
City is the city part of the account address.
State is the state or region part of the account address.
PostalCode is the postal or ZIP code part of the account address.
Email is the account’s contact email address.
PhoneNumber is the account’s main phone number.
WebsiteUrl is the account’s website URL.
FacebookUrl is the account’s Facebook page URL.
DialingCode is the country dialing code for the account’s phone numbers.
BusinessOwnerName is the business owner’s name.
BusinessOwnerPhoneNumber is the business owner’s phone number.
BusinessOwnerEmail is the business owner’s email address.
GeoCoordinates holds latitude and longitude for the account location.
ClubfitFeeFailedPaymentCount is how many times Clubfit billing fees have failed for this account.
PaymentIssueSuspensionDate is the date the account was suspended due to failed Clubfit billing.
AdvancedEmailEditorUid is the account’s advanced email editor unique identifier.
CompanyLegalName is the legal name of the company operating the account.
================================================================================
*/

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
