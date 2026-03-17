USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectTrackingSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[StaffId] [int] NOT NULL,
	[TrackingId] [int] NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[LastContactedUtcDateTime] [datetime] NULL,
	[LastMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProspectTrackingSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTrackingSchedule_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule] CHECK CONSTRAINT [FK_ProspectTrackingSchedule_Prospects]
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTrackingSchedule_ProspectTracking] FOREIGN KEY([TrackingId])
REFERENCES [dbo].[ProspectTracking] ([Id])
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule] CHECK CONSTRAINT [FK_ProspectTrackingSchedule_ProspectTracking]
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTrackingSchedule_Staffs] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectTrackingSchedule] CHECK CONSTRAINT [FK_ProspectTrackingSchedule_Staffs]
GO
