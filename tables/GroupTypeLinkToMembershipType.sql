USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupTypeLinkToMembershipType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MembershipTypeId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[DateTimeCreatedUtc] [datetime] NULL,
 CONSTRAINT [PK_GroupTypeLinkToMembershipType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupTypeLinkToMembershipType]  WITH CHECK ADD  CONSTRAINT [FK_GroupTypeLinkToMembershipType_GroupType_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupType] ([GroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupTypeLinkToMembershipType] CHECK CONSTRAINT [FK_GroupTypeLinkToMembershipType_GroupType_GroupId]
GO
ALTER TABLE [dbo].[GroupTypeLinkToMembershipType]  WITH CHECK ADD  CONSTRAINT [FK_GroupTypeLinkToMembershipType_MembershipTypes_MembershipTypeId] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupTypeLinkToMembershipType] CHECK CONSTRAINT [FK_GroupTypeLinkToMembershipType_MembershipTypes_MembershipTypeId]
GO
