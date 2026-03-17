USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[TrainerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[MobilePhone] [nvarchar](20) NOT NULL,
	[HomePhone] [nvarchar](20) NULL,
	[PhotoLocation] [nvarchar](300) NULL,
	[Email] [nvarchar](255) NULL,
	[LastModifiedUTCDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsChargeable] [bit] NOT NULL,
	[EmailForPtBookings] [bit] NOT NULL,
	[PTBookingCutOffTime] [int] NULL,
	[MaxNumberOfMember] [int] NOT NULL,
	[BookingTypes] [varchar](100) NULL,
	[Barcode] [varchar](10) NULL,
	[PortalUserId] [nvarchar](128) NULL,
	[PushNotificationForPtBookings] [bit] NOT NULL,
	[IsMasterTrainer] [bit] NOT NULL,
	[PtCancellationNotice] [int] NULL,
	[PtCancellationLateFee] [decimal](18, 2) NULL,
	[SendSmsOnCancellationPtSessionIsEnabled] [bit] NOT NULL,
	[NoShowFee] [decimal](18, 2) NULL,
	[Bio] [nvarchar](max) NULL,
	[OnlineCost] [decimal](18, 2) NOT NULL,
	[ShowOnline] [bit] NOT NULL,
	[HourlyRate] [money] NOT NULL,
	[EnableMaxBooking] [bit] NOT NULL,
	[MaxBooking] [int] NOT NULL,
	[CreatedOnUtcDateTime] [datetime] NULL,
	[EnableMaxBookingDays] [bit] NOT NULL,
	[MaxBookingDays] [int] NOT NULL,
	[EmailForProgramBookings] [bit] NOT NULL,
	[SmsForPtBookings] [bit] NOT NULL,
	[InstructorCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[TrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((5)) FOR [MaxNumberOfMember]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [PushNotificationForPtBookings]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [IsMasterTrainer]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [SendSmsOnCancellationPtSessionIsEnabled]
GO
ALTER TABLE [dbo].[Trainer] ADD  CONSTRAINT [DF_Trainer_OnlineCost]  DEFAULT ((0)) FOR [OnlineCost]
GO
ALTER TABLE [dbo].[Trainer] ADD  CONSTRAINT [DF_Trainer_ShowOnline]  DEFAULT ((0)) FOR [ShowOnline]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [HourlyRate]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [EnableMaxBooking]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((1)) FOR [MaxBooking]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [EnableMaxBookingDays]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [MaxBookingDays]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [SmsForPtBookings]
GO
ALTER TABLE [dbo].[Trainer] ADD  DEFAULT ((0)) FOR [InstructorCategoryId]
GO
