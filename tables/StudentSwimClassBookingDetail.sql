USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSwimClassBookingDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SwimClassScheduleId] [int] NULL,
	[StudentNumber] [nvarchar](50) NULL,
	[BookingType] [smallint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[NumberOfSessions] [int] NULL,
	[PaymentMethod] [smallint] NULL,
	[TotalClassAmount] [money] NULL,
	[JoinigFee] [money] NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[CreatedDateUtc] [datetime] NULL,
	[PosTransactionId] [bigint] NULL,
	[Descrition] [nvarchar](500) NULL,
	[BlockDays] [nvarchar](20) NULL,
	[TermIds] [nvarchar](20) NULL,
	[UsedMakeUpCredits] [int] NULL,
	[CancelledClassId] [int] NULL,
	[IsMakeup] [bit] NOT NULL,
	[FutureCancellationDateLocal] [datetime] NULL,
	[IsCancelledWholeClass] [bit] NOT NULL,
	[CancelledDateTimeUtc] [datetime] NULL,
	[IsMoveClass] [bit] NOT NULL,
	[EffectiveEndDateLocal] [datetime] NULL,
	[FirstClassStartDateLocal] [datetime] NULL,
	[ProspectNumber] [varchar](10) NULL,
 CONSTRAINT [PK_StudentSwimClassBookingDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] ADD  DEFAULT ((0)) FOR [IsMakeup]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] ADD  DEFAULT ((0)) FOR [IsCancelledWholeClass]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] ADD  DEFAULT ((0)) FOR [IsMoveClass]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimClassBookingDetail_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] CHECK CONSTRAINT [FK_StudentSwimClassBookingDetail_Prospects]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimClassBookingDetail_StudentPosTransaction] FOREIGN KEY([PosTransactionId])
REFERENCES [dbo].[StudentPosTransaction] ([PosTransactionId])
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] CHECK CONSTRAINT [FK_StudentSwimClassBookingDetail_StudentPosTransaction]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimClassBookingDetail_Students] FOREIGN KEY([StudentNumber])
REFERENCES [dbo].[Students] ([StudentNumber])
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] CHECK CONSTRAINT [FK_StudentSwimClassBookingDetail_Students]
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentSwimClassBookingDetail_SwimClassSchedule] FOREIGN KEY([SwimClassScheduleId])
REFERENCES [dbo].[SwimClassSchedule] ([SwimClassScheduleId])
GO
ALTER TABLE [dbo].[StudentSwimClassBookingDetail] CHECK CONSTRAINT [FK_StudentSwimClassBookingDetail_SwimClassSchedule]
GO
