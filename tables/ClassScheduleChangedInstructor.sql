USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleChangedInstructor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[PreviousInstructorId] [int] NOT NULL,
	[CurrentInstructorId] [int] NOT NULL,
	[ClassDateChangedLocal] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassScheduleChangedInstructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_CurrentInstructorId] FOREIGN KEY([CurrentInstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_CurrentInstructorId]
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_PreviousInstructorId] FOREIGN KEY([PreviousInstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_PreviousInstructorId]
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_ClassScheduleChangedInstructor_ClassSchedule_ScheduleId]
GO
