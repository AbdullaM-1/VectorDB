USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterCalendarBlock](
	[MasterCalendarBlockId] [int] IDENTITY(1,1) NOT NULL,
	[BlockDate] [date] NOT NULL,
	[StartTimeUtc] [time](7) NOT NULL,
	[EndTimeUtc] [time](7) NOT NULL,
	[Reference] [varchar](200) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[MasterCalendarBlockParentId] [int] NOT NULL,
 CONSTRAINT [PK_MasterCalendarBlock] PRIMARY KEY CLUSTERED 
(
	[MasterCalendarBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MasterCalendarBlock]  WITH CHECK ADD  CONSTRAINT [FK_MasterCalendarBlockParent_MasterCalendarBlock] FOREIGN KEY([MasterCalendarBlockParentId])
REFERENCES [dbo].[MasterCalendarBlockParent] ([MasterCalendarBlockParentId])
GO
ALTER TABLE [dbo].[MasterCalendarBlock] CHECK CONSTRAINT [FK_MasterCalendarBlockParent_MasterCalendarBlock]
GO
