USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutTemplateGroupExercise](
	[WorkoutTemplateGroupExerciseId] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutTemplateGroupId] [int] NOT NULL,
	[ExerciseId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[SupersetParentWorkoutTemplateGroupExerciseId] [int] NULL,
 CONSTRAINT [PK_WorkoutTemplateGroupExercise] PRIMARY KEY CLUSTERED 
(
	[WorkoutTemplateGroupExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExercise_Exercise] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([ExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExercise_Exercise]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExercise_WorkoutTemplateGroup] FOREIGN KEY([WorkoutTemplateGroupId])
REFERENCES [dbo].[WorkoutTemplateGroup] ([WorkoutTemplateGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExercise_WorkoutTemplateGroup]
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplateGroupExercises_WorkoutTemplateGroupExercise] FOREIGN KEY([SupersetParentWorkoutTemplateGroupExerciseId])
REFERENCES [dbo].[WorkoutTemplateGroupExercise] ([WorkoutTemplateGroupExerciseId])
GO
ALTER TABLE [dbo].[WorkoutTemplateGroupExercise] CHECK CONSTRAINT [FK_WorkoutTemplateGroupExercises_WorkoutTemplateGroupExercise]
GO
