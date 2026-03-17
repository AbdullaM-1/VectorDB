USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleOnlineAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[OnlineAccountId] [int] NOT NULL,
	[BookStatus] [int] NULL,
	[ClassDateTime] [datetime] NULL,
	[Department] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClassScheduleOnlineAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount] ADD  CONSTRAINT [DF_ClassScheduleOnlineAccount_Department]  DEFAULT ((1)) FOR [Department]
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleOnlineAccount_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount] CHECK CONSTRAINT [FK_ClassScheduleOnlineAccount_ClassSchedule]
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleOnlineAccount_OnlineAccount] FOREIGN KEY([OnlineAccountId])
REFERENCES [dbo].[OnlineAccount] ([OnlineAccountId])
GO
ALTER TABLE [dbo].[ClassScheduleOnlineAccount] CHECK CONSTRAINT [FK_ClassScheduleOnlineAccount_OnlineAccount]
GO
