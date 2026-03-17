USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimClassScheduleChangedInstructor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[PreviousInstructorId] [int] NOT NULL,
	[CurrentInstructorId] [int] NOT NULL,
	[ClassDateChangedLocal] [datetime] NOT NULL,
 CONSTRAINT [PK_SwimClassScheduleChangedInstructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_CurrentInstructorId] FOREIGN KEY([CurrentInstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_CurrentInstructorId]
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_PreviousInstructorId] FOREIGN KEY([PreviousInstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_PreviousInstructorId]
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[SwimClassScheduleChangedInstructor] CHECK CONSTRAINT [FK_SwimClassScheduleChangedInstructor_SwimClassSchedule_ScheduleId]
GO
