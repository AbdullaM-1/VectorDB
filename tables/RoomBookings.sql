USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBookings](
	[RoomBookingId] [int] IDENTITY(1,1) NOT NULL,
	[Purpose] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[RoomId] [int] NOT NULL,
	[ScheduleDate] [date] NOT NULL,
	[TimeFrom] [nvarchar](10) NOT NULL,
	[TimeTo] [nvarchar](10) NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[CreatedByUserId] [int] NULL,
	[ModifiedByUserId] [int] NULL,
	[RecurrenceCode] [varchar](15) NULL,
	[BookingTypeId] [int] NULL,
	[RoomBookType] [tinyint] NOT NULL,
 CONSTRAINT [PK_RoomBookings] PRIMARY KEY CLUSTERED 
(
	[RoomBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomBookings] ADD  DEFAULT ((1)) FOR [RoomBookType]
GO
ALTER TABLE [dbo].[RoomBookings]  WITH CHECK ADD  CONSTRAINT [FK_RoomBookings_BookingType_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [dbo].[BookingType] ([Id])
GO
ALTER TABLE [dbo].[RoomBookings] CHECK CONSTRAINT [FK_RoomBookings_BookingType_BookingTypeId]
GO
ALTER TABLE [dbo].[RoomBookings]  WITH CHECK ADD  CONSTRAINT [FK_RoomBookings_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[RoomBookings] CHECK CONSTRAINT [FK_RoomBookings_Rooms]
GO
