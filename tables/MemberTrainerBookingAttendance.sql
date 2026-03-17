USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTrainerBookingAttendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[BookingTypeId] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[TrainerBookingGuestId] [bigint] NULL,
	[AttendanceStatus] [int] NOT NULL,
	[TrainerBookingId] [int] NOT NULL,
	[BookStatus] [int] NULL,
 CONSTRAINT [PK_MemberClassAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance] ADD  DEFAULT ((1)) FOR [AttendanceStatus]
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance] ADD  DEFAULT ((0)) FOR [TrainerBookingId]
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_MemberBookingClassAttendance_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance] CHECK CONSTRAINT [FK_MemberBookingClassAttendance_Members]
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_MemberBookingClassAttendance_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance] CHECK CONSTRAINT [FK_MemberBookingClassAttendance_Trainer]
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance]  WITH CHECK ADD  CONSTRAINT [FK_MemberTrainerBookingAttendance_TrainerBookingGuest] FOREIGN KEY([TrainerBookingGuestId])
REFERENCES [dbo].[TrainerBookingGuest] ([Id])
GO
ALTER TABLE [dbo].[MemberTrainerBookingAttendance] CHECK CONSTRAINT [FK_MemberTrainerBookingAttendance_TrainerBookingGuest]
GO
