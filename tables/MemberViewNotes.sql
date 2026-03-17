USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberViewNotes](
	[MemberNotesId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[MemberNotesUtcDateTime] [datetime] NULL,
	[MemberNotes] [varchar](max) NULL,
	[MemberViewNotesAccountId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[IsBlackListed] [bit] NOT NULL,
	[NoteCategoryId] [int] NULL,
 CONSTRAINT [PK_MemberViewNotes] PRIMARY KEY CLUSTERED 
(
	[MemberNotesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberViewNotes] ADD  CONSTRAINT [DF_MemberViewNotes_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[MemberViewNotes] ADD  DEFAULT ((0)) FOR [IsBlackListed]
GO
ALTER TABLE [dbo].[MemberViewNotes]  WITH CHECK ADD  CONSTRAINT [FK_MemberViewNotes_Lookup_Type_Items_NoteCategoryId] FOREIGN KEY([NoteCategoryId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[MemberViewNotes] CHECK CONSTRAINT [FK_MemberViewNotes_Lookup_Type_Items_NoteCategoryId]
GO
ALTER TABLE [dbo].[MemberViewNotes]  WITH CHECK ADD  CONSTRAINT [FK_MemberViewNotes_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberViewNotes] CHECK CONSTRAINT [FK_MemberViewNotes_Members]
GO
ALTER TABLE [dbo].[MemberViewNotes]  WITH CHECK ADD  CONSTRAINT [FK_MemberViewNotes_MemberViewNotesAccountId] FOREIGN KEY([MemberViewNotesAccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MemberViewNotes] CHECK CONSTRAINT [FK_MemberViewNotes_MemberViewNotesAccountId]
GO
