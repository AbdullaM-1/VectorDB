USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentRemoveFromSwimClassBooking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SwimClassScheduleId] [int] NOT NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
	[BookingTypeId] [int] NULL,
	[RemovedDate] [datetime] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_StudentRemoveFromSwimClassBooking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentRemoveFromSwimClassBooking]  WITH CHECK ADD  CONSTRAINT [FK_StudentRemoveFromSwimClassBooking_StudentSwimClassBookingDetailId] FOREIGN KEY([StudentSwimClassBookingDetailId])
REFERENCES [dbo].[StudentSwimClassBookingDetail] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentRemoveFromSwimClassBooking] CHECK CONSTRAINT [FK_StudentRemoveFromSwimClassBooking_StudentSwimClassBookingDetailId]
GO
ALTER TABLE [dbo].[StudentRemoveFromSwimClassBooking]  WITH CHECK ADD  CONSTRAINT [FK_StudentRemoveFromSwimClassBooking_SwimClassScheduleId] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentRemoveFromSwimClassBooking] CHECK CONSTRAINT [FK_StudentRemoveFromSwimClassBooking_SwimClassScheduleId]
GO
