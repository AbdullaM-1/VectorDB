USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroup](
	[MemberGroupId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[GroupId] [int] NOT NULL,
	[DateAddedUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
 CONSTRAINT [PK_MemberGroup] PRIMARY KEY CLUSTERED 
(
	[MemberGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberGroup] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroup_GroupType] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupType] ([GroupId])
GO
ALTER TABLE [dbo].[MemberGroup] CHECK CONSTRAINT [FK_MemberGroup_GroupType]
GO
ALTER TABLE [dbo].[MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroup_MemberGroup] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberGroup] CHECK CONSTRAINT [FK_MemberGroup_MemberGroup]
GO
ALTER TABLE [dbo].[MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroup_Staff_DeletedBy] FOREIGN KEY([DeletedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberGroup] CHECK CONSTRAINT [FK_MemberGroup_Staff_DeletedBy]
GO
