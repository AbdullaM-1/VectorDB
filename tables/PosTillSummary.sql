USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosTillSummary](
	[PosTillId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[MonetaryType] [nvarchar](50) NOT NULL,
	[MonetaryCount] [int] NOT NULL,
	[MonetaryValue] [decimal](18, 4) NOT NULL,
	[TillNumber] [nvarchar](50) NOT NULL,
	[MonetaryId] [int] NOT NULL,
	[BeginDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
	[PosTillSummaryNoteId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_PosTillSummary] PRIMARY KEY CLUSTERED 
(
	[PosTillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosTillSummary] ADD  DEFAULT ((0)) FOR [MonetaryId]
GO
ALTER TABLE [dbo].[PosTillSummary] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PosTillSummary]  WITH CHECK ADD  CONSTRAINT [FK_PosTillSummary_PosTillSummaryNote] FOREIGN KEY([PosTillSummaryNoteId])
REFERENCES [dbo].[PosTillSummaryNote] ([PosTillSummaryNoteId])
GO
ALTER TABLE [dbo].[PosTillSummary] CHECK CONSTRAINT [FK_PosTillSummary_PosTillSummaryNote]
GO
