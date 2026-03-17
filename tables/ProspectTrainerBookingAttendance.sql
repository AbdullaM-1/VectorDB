USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectTrainerBookingAttendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[BookingTypeId] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[AttendanceStatus] [int] NOT NULL,
	[TrainerBookingId] [int] NOT NULL,
 CONSTRAINT [PK_ProspectTrainerBookingAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance] ADD  DEFAULT ((1)) FOR [AttendanceStatus]
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance] ADD  DEFAULT ((0)) FOR [TrainerBookingId]
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTrainerBookingAttendance_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance] CHECK CONSTRAINT [FK_ProspectTrainerBookingAttendance_Prospects]
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTrainerBookingAttendance_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[ProspectTrainerBookingAttendance] CHECK CONSTRAINT [FK_ProspectTrainerBookingAttendance_Trainer]
GO
