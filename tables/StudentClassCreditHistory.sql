USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClassCreditHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[PosTransactionId] [bigint] NOT NULL,
	[NumberOfCreditSession] [int] NOT NULL,
	[TotalCreditAmount] [money] NOT NULL,
	[StaffId] [int] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentClassCreditHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentClassCreditHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassCreditHistory_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentClassCreditHistory] CHECK CONSTRAINT [FK_StudentClassCreditHistory_Staff]
GO
ALTER TABLE [dbo].[StudentClassCreditHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassCreditHistory_StudentPosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentClassCreditHistory] CHECK CONSTRAINT [FK_StudentClassCreditHistory_StudentPosTransaction]
GO
ALTER TABLE [dbo].[StudentClassCreditHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassCreditHistory_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentClassCreditHistory] CHECK CONSTRAINT [FK_StudentClassCreditHistory_Students]
GO
ALTER TABLE [dbo].[StudentClassCreditHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentClassCreditHistory_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentClassCreditHistory] CHECK CONSTRAINT [FK_StudentClassCreditHistory_SwimClassSchedule]
GO
