USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCancelledFromWholeClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
	[UtcDateTimeCancelled] [datetime] NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[CreatedDatetimeUtc] [datetime] NULL,
 CONSTRAINT [PK_StudentCancelledFromWholeClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCancelledFromWholeClasses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCancelledFromWholeClasses_StudentNumber] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCancelledFromWholeClasses] CHECK CONSTRAINT [FK_StudentCancelledFromWholeClasses_StudentNumber]
GO
ALTER TABLE [dbo].[StudentCancelledFromWholeClasses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCancelledFromWholeClasses_SwimClassScheduleId] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentCancelledFromWholeClasses] CHECK CONSTRAINT [FK_StudentCancelledFromWholeClasses_SwimClassScheduleId]
GO
