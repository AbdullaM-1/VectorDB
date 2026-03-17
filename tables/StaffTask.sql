USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTask](
	[StaffTaskId] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[AssigneeId] [uniqueidentifier] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[ViewedUtcDateTime] [datetime] NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ModifiedDateTimeUtc] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NULL,
 CONSTRAINT [PK_StaffTask] PRIMARY KEY CLUSTERED 
(
	[StaffTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffTask] ADD  DEFAULT (getutcdate()) FOR [CreatedDateTimeUtc]
GO
ALTER TABLE [dbo].[StaffTask] ADD  DEFAULT (getutcdate()) FOR [ModifiedDateTimeUtc]
GO
ALTER TABLE [dbo].[StaffTask]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_User_StaffTask_Assignee] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[StaffTask] CHECK CONSTRAINT [FK_aspnet_User_StaffTask_Assignee]
GO
ALTER TABLE [dbo].[StaffTask]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_User_StaffTask_Creator] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[StaffTask] CHECK CONSTRAINT [FK_aspnet_User_StaffTask_Creator]
GO
ALTER TABLE [dbo].[StaffTask]  WITH CHECK ADD  CONSTRAINT [FK_StaffTask_Member] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffTask] CHECK CONSTRAINT [FK_StaffTask_Member]
GO
ALTER TABLE [dbo].[StaffTask]  WITH CHECK ADD CHECK  (([Priority]=(2) OR [Priority]=(1) OR [Priority]=(0)))
GO
ALTER TABLE [dbo].[StaffTask]  WITH CHECK ADD CHECK  (([Status]=(3) OR [Status]=(2) OR [Status]=(1) OR [Status]=(0)))
GO
