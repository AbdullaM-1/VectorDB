USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterCalendarBlockParent](
	[MasterCalendarBlockParentId] [int] IDENTITY(1,1) NOT NULL,
	[LocalDateFrom] [date] NOT NULL,
	[LocalDateTo] [date] NOT NULL,
	[DaysOfWeek] [varchar](20) NULL,
	[Reason] [varchar](200) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterCalendarBlockParent] PRIMARY KEY CLUSTERED 
(
	[MasterCalendarBlockParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
