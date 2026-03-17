USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[ExerciseId] [int] IDENTITY(1,1) NOT NULL,
	[ExerciseBodyPartId] [int] NOT NULL,
	[VideoUrl] [varchar](2000) NULL,
	[ExerciseName] [varchar](200) NOT NULL,
	[Equipment] [varchar](300) NULL,
	[Level] [int] NULL,
	[Type] [int] NULL,
	[Description] [varchar](4000) NULL,
	[AccountId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsClubfitAsset] [bit] NOT NULL,
	[ClubfitAssetUniqueName] [varchar](300) NULL,
 CONSTRAINT [PK_Exercise] PRIMARY KEY CLUSTERED 
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exercise] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[Exercise] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Exercise] ADD  DEFAULT ((0)) FOR [IsClubfitAsset]
GO
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_ExerciseBodyPart] FOREIGN KEY([ExerciseBodyPartId])
REFERENCES [dbo].[ExerciseBodyPart] ([ExerciseBodyPartId])
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_ExerciseBodyPart]
GO
