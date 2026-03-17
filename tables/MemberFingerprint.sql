USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFingerprint](
	[member_number] [varchar](20) NOT NULL,
	[EnrollName] [varchar](100) NULL,
	[FingerIndex] [smallint] NOT NULL,
	[TmpData] [varchar](max) NULL,
	[Privilege] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Enabled] [varchar](50) NOT NULL,
	[Flag] [varchar](50) NULL,
	[CardData] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberFingerprint]  WITH CHECK ADD  CONSTRAINT [FK_MemberFingerprint_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFingerprint] CHECK CONSTRAINT [FK_MemberFingerprint_Members]
GO
