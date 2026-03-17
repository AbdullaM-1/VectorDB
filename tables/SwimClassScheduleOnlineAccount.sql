USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimClassScheduleOnlineAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[OnlineAccountId] [int] NOT NULL,
 CONSTRAINT [PK_SwimClassScheduleOnlineAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimClassScheduleOnlineAccount]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleOnlineAccount_OnlineAccount] FOREIGN KEY([OnlineAccountId])
REFERENCES [dbo].[OnlineAccount] ([OnlineAccountId])
GO
ALTER TABLE [dbo].[SwimClassScheduleOnlineAccount] CHECK CONSTRAINT [FK_SwimClassScheduleOnlineAccount_OnlineAccount]
GO
ALTER TABLE [dbo].[SwimClassScheduleOnlineAccount]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassScheduleOnlineAccount_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[SwimClassScheduleOnlineAccount] CHECK CONSTRAINT [FK_SwimClassScheduleOnlineAccount_SwimClassSchedule]
GO
