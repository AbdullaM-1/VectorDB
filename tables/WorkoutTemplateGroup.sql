USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutTemplateGroup](
	[WorkoutTemplateGroupId] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutTemplateId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_WorkoutTemplateGroup] PRIMARY KEY CLUSTERED 
(
	[WorkoutTemplateGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroup]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroup_WorkoutTemplate] FOREIGN KEY([WorkoutTemplateId])
REFERENCES [dbo].[WorkoutTemplate] ([WorkoutTemplateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroup] CHECK CONSTRAINT [FK_WorkoutTemplateGroup_WorkoutTemplate]
GO
