USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCall](
	[MemberCallId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
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
	[AssignedStaffId] [int] NULL,
	[MemberTrackingId] [int] NULL,
 CONSTRAINT [PK_MemberCall] PRIMARY KEY CLUSTERED 
(
	[MemberCallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberCall] ADD  CONSTRAINT [DF_MemberCall_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[MemberCall] ADD  DEFAULT ((0)) FOR [BookedAppointment]
GO
ALTER TABLE [dbo].[MemberCall]  WITH CHECK ADD  CONSTRAINT [FK_MemberCall_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberCall] CHECK CONSTRAINT [FK_MemberCall_Members]
GO
ALTER TABLE [dbo].[MemberCall]  WITH CHECK ADD  CONSTRAINT [FK_MemberCall_Staff] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberCall] CHECK CONSTRAINT [FK_MemberCall_Staff]
GO
ALTER TABLE [dbo].[MemberCall]  WITH CHECK ADD  CONSTRAINT [FK_MemberCall_Staff_AssignedStaffId] FOREIGN KEY([AssignedStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberCall] CHECK CONSTRAINT [FK_MemberCall_Staff_AssignedStaffId]
GO
