USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseDataTypeUnit](
	[ExerciseDataTypeUnitId] [int] IDENTITY(1,1) NOT NULL,
	[ExerciseDataTypeId] [int] NOT NULL,
	[Unit] [varchar](50) NULL,
 CONSTRAINT [PK_ExerciseDataTypeUnit] PRIMARY KEY CLUSTERED 
(
	[ExerciseDataTypeUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExerciseDataTypeUnit]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseDataTypeUnit_ExerciseDataType] FOREIGN KEY([ExerciseDataTypeUnitId])
REFERENCES [dbo].[ExerciseDataType] ([ExerciseDataTypeId])
GO
ALTER TABLE [dbo].[ExerciseDataTypeUnit] CHECK CONSTRAINT [FK_ExerciseDataTypeUnit_ExerciseDataType]
GO
