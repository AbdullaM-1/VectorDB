USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineAccount](
	[OnlineAccountId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[EmailAddress] [varchar](500) NOT NULL,
	[MobilePhoneNumber] [nvarchar](50) NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[UniqueIdentifier] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OnlineAccount] PRIMARY KEY CLUSTERED 
(
	[OnlineAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineAccount] ADD  DEFAULT (newid()) FOR [UniqueIdentifier]
GO
