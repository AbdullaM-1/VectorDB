USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberNotes](
	[member_notes_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[member_notes_date] [smalldatetime] NULL,
	[member_notes] [varchar](max) NULL,
	[MemberNotesAccountId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[CompletedBy] [int] NULL,
	[DueDate] [smalldatetime] NULL,
	[IsBlackListed] [bit] NOT NULL,
	[IsCreateNoteOnCompletion] [bit] NOT NULL,
 CONSTRAINT [PK_MemberNotes] PRIMARY KEY CLUSTERED 
(
	[member_notes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberNotes] ADD  CONSTRAINT [CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[MemberNotes] ADD  CONSTRAINT [Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MemberNotes] ADD  DEFAULT ((0)) FOR [IsBlackListed]
GO
ALTER TABLE [dbo].[MemberNotes] ADD  DEFAULT ((0)) FOR [IsCreateNoteOnCompletion]
GO
ALTER TABLE [dbo].[MemberNotes]  WITH CHECK ADD  CONSTRAINT [FK_MemberNotes_MemberNotesAccountId] FOREIGN KEY([MemberNotesAccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MemberNotes] CHECK CONSTRAINT [FK_MemberNotes_MemberNotesAccountId]
GO
ALTER TABLE [dbo].[MemberNotes]  WITH CHECK ADD  CONSTRAINT [FK_MemberNotes_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberNotes] CHECK CONSTRAINT [FK_MemberNotes_Members]
GO
