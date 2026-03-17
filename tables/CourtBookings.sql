USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtBookings](
	[CourtBookingId] [int] IDENTITY(1,1) NOT NULL,
	[Purpose] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[CourtId] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NULL,
	[ModifiedDateUtc] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[ModifiedByUserId] [int] NULL,
	[RecurrenceCode] [varchar](15) NULL,
	[ScheduleDate] [date] NOT NULL,
	[TimeFrom] [nvarchar](10) NOT NULL,
	[TimeTo] [nvarchar](10) NOT NULL,
	[BookingTypeId] [int] NULL,
	[CourtBookType] [tinyint] NOT NULL,
 CONSTRAINT [PK_CourtBookings] PRIMARY KEY CLUSTERED 
(
	[CourtBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourtBookings] ADD  DEFAULT ((1)) FOR [CourtBookType]
GO
ALTER TABLE [dbo].[CourtBookings]  WITH CHECK ADD  CONSTRAINT [FK_CourtBookings_BookingType_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [dbo].[BookingType] ([Id])
GO
ALTER TABLE [dbo].[CourtBookings] CHECK CONSTRAINT [FK_CourtBookings_BookingType_BookingTypeId]
GO
ALTER TABLE [dbo].[CourtBookings]  WITH CHECK ADD  CONSTRAINT [FK_CourtBookings_Court] FOREIGN KEY([CourtId])
REFERENCES [dbo].[Court] ([CourtID])
GO
ALTER TABLE [dbo].[CourtBookings] CHECK CONSTRAINT [FK_CourtBookings_Court]
GO
