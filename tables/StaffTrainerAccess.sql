USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTrainerAccess](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[TrainerId] [int] NOT NULL,
	[TrainerType] [smallint] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_StaffTrainerAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffTrainerAccess]  WITH CHECK ADD  CONSTRAINT [FK_StaffTrainerAccess_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffTrainerAccess] CHECK CONSTRAINT [FK_StaffTrainerAccess_Staff]
GO
ALTER TABLE [dbo].[StaffTrainerAccess]  WITH CHECK ADD  CONSTRAINT [FK_StaffTrainerAccess_Staff1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StaffTrainerAccess] CHECK CONSTRAINT [FK_StaffTrainerAccess_Staff1]
GO
ALTER TABLE [dbo].[StaffTrainerAccess]  WITH CHECK ADD  CONSTRAINT [FK_StaffTrainerAccess_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[StaffTrainerAccess] CHECK CONSTRAINT [FK_StaffTrainerAccess_Trainer]
GO
