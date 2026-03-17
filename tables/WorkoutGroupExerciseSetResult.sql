USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutGroupExerciseSetResult](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[WorkoutGroupExerciseSetId] [int] NOT NULL,
	[ExerciseSetValue] [int] NULL,
	[ExerciseSetMinute] [int] NULL,
	[ExerciseSetSecond] [int] NULL,
	[LastUpdatedOnUtc] [datetime] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_WorkoutGroupExerciseSetResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSetResult] ADD  CONSTRAINT [DF_WorkoutGroupExerciseSetResult_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSetResult]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExerciseSetResult_WorkoutGroupExerciseSet] FOREIGN KEY([WorkoutGroupExerciseSetId])
REFERENCES [dbo].[WorkoutGroupExerciseSet] ([WorkoutGroupExerciseSetId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseSetResult] CHECK CONSTRAINT [FK_WorkoutGroupExerciseSetResult_WorkoutGroupExerciseSet]
GO
