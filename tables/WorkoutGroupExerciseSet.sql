USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutGroupExerciseSet](
	[WorkoutGroupExerciseSetId] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutGroupExerciseId] [int] NOT NULL,
	[ExerciseDataTypeId] [int] NOT NULL,
	[ExerciseDataTypeUnitId] [int] NULL,
	[ExerciseSetOrder] [int] NOT NULL,
	[ExerciseSetValue] [int] NULL,
	[ExerciseSetMinute] [int] NULL,
	[ExerciseSetSecond] [int] NULL,
 CONSTRAINT [PK_WorkoutGroupExerciseSet] PRIMARY KEY CLUSTERED 
(
	[WorkoutGroupExerciseSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExerciseSet_ExerciseDataType] FOREIGN KEY([ExerciseDataTypeId])
REFERENCES [dbo].[ExerciseDataType] ([ExerciseDataTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutGroupExerciseSet_ExerciseDataType]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExerciseSet_ExerciseDataTypeUnit] FOREIGN KEY([ExerciseDataTypeUnitId])
REFERENCES [dbo].[ExerciseDataTypeUnit] ([ExerciseDataTypeUnitId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutGroupExerciseSet_ExerciseDataTypeUnit]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExerciseSet_WorkoutGroupExercise] FOREIGN KEY([WorkoutGroupExerciseId])
REFERENCES [dbo].[WorkoutGroupExercise] ([WorkoutGroupExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSet] CHECK CONSTRAINT [FK_WorkoutGroupExerciseSet_WorkoutGroupExercise]
GO
