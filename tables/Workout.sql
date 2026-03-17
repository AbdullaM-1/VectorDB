USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workout](
	[WorkoutId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[WorkoutName] [varchar](250) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ModifiedDateTimeUtc] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[WorkoutDateLocal] [datetime] NULL,
	[BatchId] [varchar](100) NULL,
	[WorkoutTemplateId] [int] NULL,
 CONSTRAINT [PK_Workout] PRIMARY KEY CLUSTERED 
(
	[WorkoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_Workout_CreatedByStaff] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_Workout_CreatedByStaff]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_Workout_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_Workout_Members]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_Workout_ModifiedByStaff] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_Workout_ModifiedByStaff]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplate_Workout_WorkoutTemplateId] FOREIGN KEY([WorkoutTemplateId])
REFERENCES [dbo].[WorkoutTemplate] ([WorkoutTemplateId])
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_WorkoutTemplate_Workout_WorkoutTemplateId]
GO
