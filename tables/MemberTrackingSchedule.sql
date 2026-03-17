USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTrackingSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[StaffId] [int] NOT NULL,
	[TrackingId] [int] NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[LastContactedUtcDateTime] [datetime] NULL,
	[LastMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_MemberTrackingSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MemberTrackingSchedule_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberTrackingSchedule] CHECK CONSTRAINT [FK_MemberTrackingSchedule_Members]
GO
ALTER TABLE [dbo].[MemberTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MemberTrackingSchedule_MemberTracking] FOREIGN KEY([TrackingId])
REFERENCES [dbo].[MemberTracking] ([Id])
GO
ALTER TABLE [dbo].[MemberTrackingSchedule] CHECK CONSTRAINT [FK_MemberTrackingSchedule_MemberTracking]
GO
ALTER TABLE [dbo].[MemberTrackingSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MemberTrackingSchedule_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberTrackingSchedule] CHECK CONSTRAINT [FK_MemberTrackingSchedule_Staff]
GO
