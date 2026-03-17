USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAvailability](
	[RoomAvailabilityId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[TimeFrom] [nvarchar](10) NULL,
	[TimeTo] [nvarchar](10) NULL,
 CONSTRAINT [PK_RoomAvailability] PRIMARY KEY CLUSTERED 
(
	[RoomAvailabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomAvailability]  WITH CHECK ADD  CONSTRAINT [FK_RoomAvailability_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[RoomAvailability] CHECK CONSTRAINT [FK_RoomAvailability_Rooms]
GO
