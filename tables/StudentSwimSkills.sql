USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSwimSkills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[SwimSkillId] [int] NOT NULL,
	[IsMastered] [bit] NOT NULL,
	[Comment] [varchar](100) NULL,
	[DateMastered] [datetime] NULL,
 CONSTRAINT [PK_StudentSwimSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentSwimSkills] ADD  DEFAULT ((0)) FOR [IsMastered]
GO
ALTER TABLE [dbo].[StudentSwimSkills]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimSkills_Lookup_Type_Items_Lookup_Type_ItemId] FOREIGN KEY([SwimSkillId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[StudentSwimSkills] CHECK CONSTRAINT [FK_StudentSwimSkills_Lookup_Type_Items_Lookup_Type_ItemId]
GO
ALTER TABLE [dbo].[StudentSwimSkills]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimSkills_Student_StudentNumber] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentSwimSkills] CHECK CONSTRAINT [FK_StudentSwimSkills_Student_StudentNumber]
GO
