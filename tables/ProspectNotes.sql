USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectNotes](
	[ProspectNotesId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[ProspectNotesDate] [smalldatetime] NULL,
	[ProspectNotes] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_ProspectNotes] PRIMARY KEY CLUSTERED 
(
	[ProspectNotesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectNotes]  WITH CHECK ADD  CONSTRAINT [FK_ProspectNotes_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectNotes] CHECK CONSTRAINT [FK_ProspectNotes_Prospects]
GO
