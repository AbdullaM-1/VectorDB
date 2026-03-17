USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentNotes](
	[StudentNotesId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[StudentNotesUtcDateTime] [smalldatetime] NULL,
	[StudentNotes] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[ShowNotification] [bit] NOT NULL,
	[CompletedBy] [int] NOT NULL,
 CONSTRAINT [PK_StudentNotes] PRIMARY KEY CLUSTERED 
(
	[StudentNotesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentNotes] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[StudentNotes] ADD  DEFAULT ((0)) FOR [ShowNotification]
GO
ALTER TABLE [dbo].[StudentNotes] ADD  DEFAULT ((0)) FOR [CompletedBy]
GO
ALTER TABLE [dbo].[StudentNotes]  WITH CHECK ADD  CONSTRAINT [FK_StudentNotes_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentNotes] CHECK CONSTRAINT [FK_StudentNotes_Staff]
GO
ALTER TABLE [dbo].[StudentNotes]  WITH CHECK ADD  CONSTRAINT [FK_StudentNotes_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentNotes] CHECK CONSTRAINT [FK_StudentNotes_Students]
GO
