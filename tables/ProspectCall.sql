USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectCall](
	[ProspectCallId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[Summary] [nvarchar](100) NOT NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[OutCome] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NULL,
	[LastUpdatedBy] [int] NOT NULL,
	[LastUpdatedUtc] [datetime] NULL,
	[NotInterestedReason] [int] NULL,
	[BookedAppointment] [bit] NOT NULL,
	[StaffId] [int] NULL,
	[ProspectTrackingId] [int] NULL,
 CONSTRAINT [PK_ProspectCall] PRIMARY KEY CLUSTERED 
(
	[ProspectCallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectCall] ADD  CONSTRAINT [DF_ProspectCall_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[ProspectCall] ADD  DEFAULT ((0)) FOR [BookedAppointment]
GO
ALTER TABLE [dbo].[ProspectCall]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCall_AssignedStaff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectCall] CHECK CONSTRAINT [FK_ProspectCall_AssignedStaff]
GO
ALTER TABLE [dbo].[ProspectCall]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCall_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectCall] CHECK CONSTRAINT [FK_ProspectCall_Prospects]
GO
ALTER TABLE [dbo].[ProspectCall]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCall_ProspectTracking_ProspectTrackingId] FOREIGN KEY([ProspectTrackingId])
REFERENCES [dbo].[ProspectTracking] ([Id])
GO
ALTER TABLE [dbo].[ProspectCall] CHECK CONSTRAINT [FK_ProspectCall_ProspectTracking_ProspectTrackingId]
GO
ALTER TABLE [dbo].[ProspectCall]  WITH CHECK ADD  CONSTRAINT [FK_ProspectCall_Staff] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectCall] CHECK CONSTRAINT [FK_ProspectCall_Staff]
GO
