USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSchedule](
	[ClassScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ClassDaysOfWeek] [varchar](100) NOT NULL,
	[ClassTime] [varchar](100) NOT NULL,
	[ClassDuration] [int] NOT NULL,
	[InstructorId] [int] NULL,
	[ClassRoomName] [varchar](100) NOT NULL,
	[ClassCapacity] [int] NOT NULL,
	[ClassStartDate] [datetimeoffset](7) NOT NULL,
	[ClassEndDate] [datetimeoffset](7) NULL,
	[ClassSpecialInstructions] [nvarchar](max) NULL,
	[CancellationNoticeByMin] [int] NULL,
	[CancellationFee] [money] NULL,
	[BookingCutOffTimeByMin] [int] NULL,
	[RequiredSubscription] [bit] NOT NULL,
	[CancellationNoticeByHour] [int] NOT NULL,
	[BookingCutoffTimeByHour] [int] NOT NULL,
	[AllowedMembershipTypes] [varchar](max) NULL,
	[AllowedSubscriptions] [varchar](max) NULL,
	[IsRecurring] [bit] NOT NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](10) NULL,
	[OnlineClassUrlLink] [nvarchar](max) NULL,
	[ClassType] [int] NOT NULL,
	[AllowedOtherAccount] [varchar](max) NULL,
	[NoShowFee] [decimal](18, 2) NULL,
	[BookingRequired] [bit] NOT NULL,
	[MaxWaitingCapacityEnabled] [bit] NOT NULL,
	[MaxWaitingCapacity] [int] NOT NULL,
	[MinSpotsRemaining] [int] NOT NULL,
	[EnableOnlineGuestBooking] [bit] NOT NULL,
	[OnlineGuestCost] [decimal](18, 2) NOT NULL,
	[IsSingleEvent] [bit] NOT NULL,
	[IsAgeRestrict] [bit] NOT NULL,
	[InstructorCost] [decimal](9, 2) NOT NULL,
	[EnableClassPassBooking] [bit] NOT NULL,
	[ClassPassCapacity] [int] NOT NULL,
	[EnableProspectAppBooking] [bit] NOT NULL,
	[IsOnlineBooking] [bit] NOT NULL,
	[ShowInApp] [bit] NOT NULL,
	[EnableHideCancelBookingButton] [bit] NOT NULL,
 CONSTRAINT [PK_ClassSchedule] PRIMARY KEY CLUSTERED 
(
	[ClassScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [RequiredSubscription]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [CancellationNoticeByHour]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [BookingCutoffTimeByHour]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  CONSTRAINT [DF_ClassSchedule_IsRecurring]  DEFAULT ((0)) FOR [IsRecurring]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [ClassType]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((1)) FOR [BookingRequired]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [MaxWaitingCapacityEnabled]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [MaxWaitingCapacity]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [MinSpotsRemaining]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [EnableOnlineGuestBooking]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [OnlineGuestCost]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [IsSingleEvent]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [IsAgeRestrict]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [InstructorCost]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [EnableClassPassBooking]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [ClassPassCapacity]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [EnableProspectAppBooking]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((1)) FOR [IsOnlineBooking]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((1)) FOR [ShowInApp]
GO
ALTER TABLE [dbo].[ClassSchedule] ADD  DEFAULT ((0)) FOR [EnableHideCancelBookingButton]
GO
ALTER TABLE [dbo].[ClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ClassSchedule_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[ClassSchedule] CHECK CONSTRAINT [FK_ClassSchedule_Accounts]
GO
ALTER TABLE [dbo].[ClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ClassSchedule_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[ClassSchedule] CHECK CONSTRAINT [FK_ClassSchedule_Class]
GO
ALTER TABLE [dbo].[ClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ClassSchedule_Trainer] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[ClassSchedule] CHECK CONSTRAINT [FK_ClassSchedule_Trainer]
GO
