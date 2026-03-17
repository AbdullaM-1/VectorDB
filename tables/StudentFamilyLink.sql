USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFamilyLink](
	[StudentFamilyLinkId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NULL,
	[StudentFamilyId] [bigint] NULL,
	[RalationWithStudent] [int] NULL,
 CONSTRAINT [PK_StudentFamilyLink] PRIMARY KEY CLUSTERED 
(
	[StudentFamilyLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentFamilyLink]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamilyLink_StudentFamily] FOREIGN KEY([StudentFamilyId])
REFERENCES [dbo].[StudentFamily] ([StudentFamilyId])
GO
ALTER TABLE [dbo].[StudentFamilyLink] CHECK CONSTRAINT [FK_StudentFamilyLink_StudentFamily]
GO
ALTER TABLE [dbo].[StudentFamilyLink]  WITH CHECK ADD  CONSTRAINT [FK_StudentFamilyLink_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentFamilyLink] CHECK CONSTRAINT [FK_StudentFamilyLink_Students]
GO
