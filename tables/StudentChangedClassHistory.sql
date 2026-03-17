USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentChangedClassHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[OldSwimClassScheduleId] [int] NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[StaffId] [int] NULL,
	[CreatedDateTimeUtc] [datetime] NULL,
	[OldStudentSwimClassBookingDetailId] [int] NOT NULL,
	[EffectiveEndDateLocal] [datetime] NULL,
	[OldClassStartDateLocal] [datetime] NULL,
	[OldClassEndDateLocal] [datetime] NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
 CONSTRAINT [PK_StudentChangedClassHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentChangedClassHistory] ADD  DEFAULT ((0)) FOR [OldStudentSwimClassBookingDetailId]
GO
ALTER TABLE [dbo].[StudentChangedClassHistory] ADD  DEFAULT ((0)) FOR [StudentSwimClassBookingDetailId]
GO
ALTER TABLE [dbo].[StudentChangedClassHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentChangedClassHistory_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[StudentChangedClassHistory] CHECK CONSTRAINT [FK_StudentChangedClassHistory_Staff]
GO
ALTER TABLE [dbo].[StudentChangedClassHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentChangedClassHistory_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentChangedClassHistory] CHECK CONSTRAINT [FK_StudentChangedClassHistory_Students]
GO
ALTER TABLE [dbo].[StudentChangedClassHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentChangedClassHistory_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentChangedClassHistory] CHECK CONSTRAINT [FK_StudentChangedClassHistory_SwimClassSchedule]
GO
