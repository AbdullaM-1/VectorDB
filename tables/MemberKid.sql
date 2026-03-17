USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberKid](
	[MemberKidId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[PhotoLocation] [varchar](300) NULL,
	[Notes] [varchar](max) NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MemberKid] PRIMARY KEY CLUSTERED 
(
	[MemberKidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberKid] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberKid]  WITH CHECK ADD  CONSTRAINT [FK_MemberKid_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberKid] CHECK CONSTRAINT [FK_MemberKid_Members]
GO
