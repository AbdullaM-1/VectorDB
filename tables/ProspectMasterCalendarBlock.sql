USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectMasterCalendarBlock](
	[ProspectMasterCalendarBlockId] [int] IDENTITY(1,1) NOT NULL,
	[BlockDate] [date] NOT NULL,
	[StartTimeUtc] [time](7) NOT NULL,
	[EndTimeUtc] [time](7) NOT NULL,
	[Reference] [varchar](200) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[ProspectMasterCalendarBlockParentId] [int] NULL,
 CONSTRAINT [PK_ProspectMasterCalendarBlock] PRIMARY KEY CLUSTERED 
(
	[ProspectMasterCalendarBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectMasterCalendarBlock]  WITH CHECK ADD  CONSTRAINT [FK_ProspectMasterCalendarBlockParent_ProspectMasterCalendarBlock] FOREIGN KEY([ProspectMasterCalendarBlockParentId])
REFERENCES [dbo].[ProspectMasterCalendarBlockParent] ([ProspectMasterCalendarBlockParentId])
GO
ALTER TABLE [dbo].[ProspectMasterCalendarBlock] CHECK CONSTRAINT [FK_ProspectMasterCalendarBlockParent_ProspectMasterCalendarBlock]
GO
