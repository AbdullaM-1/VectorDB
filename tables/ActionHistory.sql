USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionHistory](
	[ActionHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PerformedBy] [nvarchar](100) NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[ReferenceId] [int] NULL,
	[Reason] [nvarchar](100) NULL,
 CONSTRAINT [PK_ActionHistory] PRIMARY KEY CLUSTERED 
(
	[ActionHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
