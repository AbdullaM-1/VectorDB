USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerAccount](
	[TrainerAccountId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_TrainerAccount] PRIMARY KEY CLUSTERED 
(
	[TrainerAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerAccount]  WITH CHECK ADD  CONSTRAINT [FK_TrainerAccount_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[TrainerAccount] CHECK CONSTRAINT [FK_TrainerAccount_Accounts]
GO
ALTER TABLE [dbo].[TrainerAccount]  WITH CHECK ADD  CONSTRAINT [FK_TrainerAccount_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerAccount] CHECK CONSTRAINT [FK_TrainerAccount_Trainer]
GO
