USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectParentGuarantor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentGuardianName] [varchar](100) NULL,
	[Relationship] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Signature] [varchar](max) NULL,
	[DateTimeCreatedUtc] [datetime] NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ProspectParentGuarantor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectParentGuarantor]  WITH CHECK ADD  CONSTRAINT [FK_ProspectParentGuarantor_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectParentGuarantor] CHECK CONSTRAINT [FK_ProspectParentGuarantor_Prospects]
GO
