USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerBooking](
	[TrainerBookingId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[MemberNumber] [varchar](20) NULL,
	[TrainingDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Comments] [varchar](100) NULL,
	[Type] [smallint] NOT NULL,
	[BookingTypeId] [int] NULL,
	[TrainerBookingGuestId] [bigint] NULL,
	[Source] [int] NOT NULL,
	[OnlineAccountId] [int] NULL,
	[AccountId] [int] NULL,
	[RecurrenceCode] [varchar](15) NULL,
	[PaymentVoid] [bit] NOT NULL,
	[RemindInMinute] [int] NOT NULL,
	[LastReminderSentOnLocal] [datetime] NULL,
	[MemberPtSubscriptionId] [bigint] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[CancelledDateTimeUtc] [datetime] NULL,
	[IsProcessedCancellation] [bit] NOT NULL,
	[IsChargeLateFeeCancellation] [bit] NOT NULL,
	[CancellationProcessedBy] [uniqueidentifier] NULL,
	[ProcessedDateTimeUtc] [datetime] NULL,
	[IsCancelledWithinCancellationNotice] [bit] NOT NULL,
	[IsStoredCreditUsed] [bit] NOT NULL,
	[ProspectNumber] [varchar](10) NULL,
	[CreatedDateUtc] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[CreatedBy] [int] NULL,
	[CancellationSource] [int] NULL,
 CONSTRAINT [PK_TrainerBooking] PRIMARY KEY CLUSTERED 
(
	[TrainerBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((1)) FOR [Source]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [PaymentVoid]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  CONSTRAINT [DF_TrainerBooking_RemindInMinute]  DEFAULT ((0)) FOR [RemindInMinute]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [MemberPtSubscriptionId]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsProcessedCancellation]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsChargeLateFeeCancellation]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsCancelledWithinCancellationNotice]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsStoredCreditUsed]
GO
ALTER TABLE [dbo].[TrainerBooking] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_CancellationProcessedBy_aspnet_User] FOREIGN KEY([CancellationProcessedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_CancellationProcessedBy_aspnet_User]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_Members]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_Prospects]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_Staffs] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_Staffs]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_Trainer]
GO
ALTER TABLE [dbo].[TrainerBooking]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBooking_TrainerBookingGuest] FOREIGN KEY([TrainerBookingGuestId])
REFERENCES [dbo].[TrainerBookingGuest] ([Id])
GO
ALTER TABLE [dbo].[TrainerBooking] CHECK CONSTRAINT [FK_TrainerBooking_TrainerBookingGuest]
GO
