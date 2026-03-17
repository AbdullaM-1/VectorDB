USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPosDailyActual](
	[StudentPosDailyActualId] [bigint] IDENTITY(1,1) NOT NULL,
	[DataLocalDate] [datetime] NOT NULL,
	[ActualCash] [money] NULL,
	[ActualAccount] [money] NULL,
	[ActualCard] [money] NULL,
	[ActualEftpos] [money] NULL,
	[ActualCheque] [money] NULL,
	[ActualPayLater] [money] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_StudentPosDailyActual] PRIMARY KEY CLUSTERED 
(
	[StudentPosDailyActualId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
