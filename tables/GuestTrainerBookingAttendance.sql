USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestTrainerBookingAttendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[TrainerBookingGuestId] [bigint] NULL,
	[BookingTypeId] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[AttendanceStatus] [int] NOT NULL,
 CONSTRAINT [PK_GuestClassAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GuestTrainerBookingAttendance] ADD  DEFAULT ((1)) FOR [AttendanceStatus]
GO
ALTER TABLE [dbo].[GuestTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_GuestTrainerBookingAttendance_TrainerBookingGuest] FOREIGN KEY([TrainerBookingGuestId])
REFERENCES [dbo].[TrainerBookingGuest] ([Id])
GO
ALTER TABLE [dbo].[GuestTrainerBookingAttendance] CHECK CONSTRAINT [FK_GuestTrainerBookingAttendance_TrainerBookingGuest]
GO
