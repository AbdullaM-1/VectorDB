USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerShiftBlock](
	[TrainerShiftBlockId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[LocalTrainingDate] [date] NOT NULL,
	[TrainerType] [smallint] NOT NULL,
	[StartTimeUtc] [time](7) NOT NULL,
	[EndTimeUtc] [time](7) NOT NULL,
	[Reference] [varchar](100) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[TrainerShiftBlockParentId] [int] NULL,
	[RecurrenceCode] [varchar](15) NULL,
 CONSTRAINT [PK_TrainerShiftBlock] PRIMARY KEY CLUSTERED 
(
	[TrainerShiftBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerShiftBlock]  WITH CHECK ADD  CONSTRAINT [FK_TrainerShiftBlock_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerShiftBlock] CHECK CONSTRAINT [FK_TrainerShiftBlock_Trainer]
GO
ALTER TABLE [dbo].[TrainerShiftBlock]  WITH CHECK ADD  CONSTRAINT [FK_TrainerShiftBlockParent_TrainerShiftBlock] FOREIGN KEY([TrainerShiftBlockParentId])
REFERENCES [dbo].[TrainerShiftBlockParent] ([TrainerShiftBlockParentId])
GO
ALTER TABLE [dbo].[TrainerShiftBlock] CHECK CONSTRAINT [FK_TrainerShiftBlockParent_TrainerShiftBlock]
GO
