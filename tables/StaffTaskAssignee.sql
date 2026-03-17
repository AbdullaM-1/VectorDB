USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTaskAssignee](
	[StaffTaskAssigneeId] [int] IDENTITY(1,1) NOT NULL,
	[StaffTaskId] [bigint] NOT NULL,
	[AssigneeId] [int] NOT NULL,
	[Status] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffTaskAssignee]  WITH CHECK ADD  CONSTRAINT [FK_StaffTaskAssignee_Staff] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffTaskAssignee] CHECK CONSTRAINT [FK_StaffTaskAssignee_Staff]
GO
ALTER TABLE [dbo].[StaffTaskAssignee]  WITH CHECK ADD  CONSTRAINT [FK_StaffTaskAssignee_StaffTask] FOREIGN KEY([StaffTaskId])
REFERENCES [dbo].[StaffTask] ([StaffTaskId])
GO
ALTER TABLE [dbo].[StaffTaskAssignee] CHECK CONSTRAINT [FK_StaffTaskAssignee_StaffTask]
GO
