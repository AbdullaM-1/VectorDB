USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[AccountId] [int] NULL,
	[NotesUtcDateTime] [smalldatetime] NULL,
	[Notes] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_TrainerNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerNotes]  WITH CHECK ADD  CONSTRAINT [FK_TrainerNotes_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[TrainerNotes] CHECK CONSTRAINT [FK_TrainerNotes_Account_AccountId]
GO
ALTER TABLE [dbo].[TrainerNotes]  WITH CHECK ADD  CONSTRAINT [FK_TrainerNotes_Trainer_TrainerId] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerNotes] CHECK CONSTRAINT [FK_TrainerNotes_Trainer_TrainerId]
GO
