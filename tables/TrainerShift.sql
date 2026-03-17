USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerShift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[Day] [smallint] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_TrainerShift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerShift]  WITH CHECK ADD  CONSTRAINT [FK_TrainerShift_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerShift] CHECK CONSTRAINT [FK_TrainerShift_Trainer]
GO
