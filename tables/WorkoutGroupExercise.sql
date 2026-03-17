USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutGroupExercise](
	[WorkoutGroupExerciseId] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutGroupId] [int] NOT NULL,
	[ExerciseId] [int] NOT NULL,
 CONSTRAINT [PK_WorkoutGroupExercise] PRIMARY KEY CLUSTERED 
(
	[WorkoutGroupExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutGroupExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExercise_Exercise] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([ExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExercise] CHECK CONSTRAINT [FK_WorkoutGroupExercise_Exercise]
GO
ALTER TABLE [dbo].[WorkoutGroupExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExercise_WorkoutGroup] FOREIGN KEY([WorkoutGroupId])
REFERENCES [dbo].[WorkoutGroup] ([WorkoutGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExercise] CHECK CONSTRAINT [FK_WorkoutGroupExercise_WorkoutGroup]
GO
