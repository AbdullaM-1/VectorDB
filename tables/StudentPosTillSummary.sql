USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosTillSummary](
	[PosTillId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[MonetaryId] [int] NOT NULL,
	[MonetaryType] [nvarchar](50) NOT NULL,
	[MonetaryCount] [int] NOT NULL,
	[MonetaryValue] [decimal](18, 4) NOT NULL,
	[TillNumber] [nvarchar](50) NOT NULL,
	[BeginDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
 CONSTRAINT [PK_StudentPosTillSummary] PRIMARY KEY CLUSTERED 
(
	[PosTillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPosTillSummary] ADD  DEFAULT ((0)) FOR [MonetaryId]
GO
