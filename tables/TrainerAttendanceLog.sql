USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerAttendanceLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[VerifyMode] [int] NULL,
	[InOutMode] [int] NULL,
	[InOutDateTimeLocal] [datetime] NOT NULL,
	[WorkCode] [int] NULL,
	[InsertStatus] [bit] NULL,
	[AccountId] [int] NULL,
	[EventSource] [int] NULL,
	[MemberStatus] [nvarchar](50) NULL,
	[Door] [nvarchar](255) NULL,
 CONSTRAINT [PK_TrainerAttendanceLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_TrainerAttendanceLog_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[TrainerAttendanceLog] CHECK CONSTRAINT [FK_TrainerAttendanceLog_Accounts_AccountId]
GO
ALTER TABLE [dbo].[TrainerAttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_TrainerAttendanceLog_Trainer_TrainerId] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerAttendanceLog] CHECK CONSTRAINT [FK_TrainerAttendanceLog_Trainer_TrainerId]
GO
