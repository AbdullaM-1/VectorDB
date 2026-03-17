USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerShiftBlockParent](
	[TrainerShiftBlockParentId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[LocalDateFrom] [date] NOT NULL,
	[LocalDateTo] [date] NOT NULL,
	[DaysOfWeek] [varchar](20) NULL,
	[TrainerType] [smallint] NOT NULL,
	[Reason] [varchar](100) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsWholeDay] [bit] NOT NULL,
 CONSTRAINT [PK_TrainerShiftBlockParent] PRIMARY KEY CLUSTERED 
(
	[TrainerShiftBlockParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerShiftBlockParent] ADD  DEFAULT ((1)) FOR [IsWholeDay]
GO
ALTER TABLE [dbo].[TrainerShiftBlockParent]  WITH CHECK ADD  CONSTRAINT [FK_TrainerShiftBlockParent_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerShiftBlockParent] CHECK CONSTRAINT [FK_TrainerShiftBlockParent_Trainer]
GO
