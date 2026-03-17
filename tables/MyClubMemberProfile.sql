USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyClubMemberProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[OtherProfileMemberNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MyClubMemberProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MyClubMemberProfile]  WITH CHECK ADD  CONSTRAINT [FK_MyClubMemberProfile_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MyClubMemberProfile] CHECK CONSTRAINT [FK_MyClubMemberProfile_Members]
GO
ALTER TABLE [dbo].[MyClubMemberProfile]  WITH CHECK ADD  CONSTRAINT [FK_MyClubMemberProfile_OtherProfileMember] FOREIGN KEY([OtherProfileMemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MyClubMemberProfile] CHECK CONSTRAINT [FK_MyClubMemberProfile_OtherProfileMember]
GO
