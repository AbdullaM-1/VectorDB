USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutGroupExerciseComment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkoutGroupExerciseId] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CommentBy] [nvarchar](200) NOT NULL,
	[CommentedOnUtc] [datetime] NOT NULL,
	[HasRead] [bit] NOT NULL,
 CONSTRAINT [PK_WorkoutGroupExerciseComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseComment] ADD  DEFAULT ((0)) FOR [HasRead]
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseComment]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutGroupExerciseComment_WorkoutGroupExercise] FOREIGN KEY([WorkoutGroupExerciseId])
REFERENCES [dbo].[WorkoutGroupExercise] ([WorkoutGroupExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutGroupExerciseComment] CHECK CONSTRAINT [FK_WorkoutGroupExerciseComment_WorkoutGroupExercise]
GO
