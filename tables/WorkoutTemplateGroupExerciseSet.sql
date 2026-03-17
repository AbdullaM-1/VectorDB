USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutTemplateGroupExerciseSet](
	[WorkoutTemplateGroupExerciseSetId] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutTemplateGroupExerciseId] [int] NOT NULL,
	[ExerciseDataTypeUnitId] [int] NULL,
	[ExerciseDataTypeId] [int] NOT NULL,
	[ExerciseSetOrder] [int] NOT NULL,
	[ExerciseSetValue] [int] NULL,
	[ExerciseSetMinute] [int] NULL,
	[ExerciseSetSecond] [int] NULL,
 CONSTRAINT [PK_WorkoutTemplateGroupExerciseSet] PRIMARY KEY CLUSTERED 
(
	[WorkoutTemplateGroupExerciseSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_ExerciseDataType] FOREIGN KEY([ExerciseDataTypeId])
REFERENCES [dbo].[ExerciseDataType] ([ExerciseDataTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_ExerciseDataType]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_ExerciseDataTypeUnit] FOREIGN KEY([ExerciseDataTypeUnitId])
REFERENCES [dbo].[ExerciseDataTypeUnit] ([ExerciseDataTypeUnitId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_ExerciseDataTypeUnit]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_WorkoutTemplateGroupExercise] FOREIGN KEY([WorkoutTemplateGroupExerciseId])
REFERENCES [dbo].[WorkoutTemplateGroupExercise] ([WorkoutTemplateGroupExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExerciseSet_WorkoutTemplateGroupExercise]
GO
