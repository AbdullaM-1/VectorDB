USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberActivity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[ActivityId] [int] NULL,
	[ActivityType] [smallint] NULL,
	[ActivityLog] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[OutCome] [int] NULL,
	[NotInterestedReason] [int] NULL,
	[IsCompleted] [bit] NULL,
	[IsNow] [bit] NOT NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[MemberStatus] [nvarchar](25) NULL,
	[ReminderInMinute] [int] NOT NULL,
 CONSTRAINT [PK_MemberActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberActivity] ADD  CONSTRAINT [DF_MemberActivity_IsNow]  DEFAULT ((1)) FOR [IsNow]
GO
ALTER TABLE [dbo].[MemberActivity] ADD  CONSTRAINT [DF_MemberActivity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberActivity] ADD  DEFAULT ((0)) FOR [ReminderInMinute]
GO
ALTER TABLE [dbo].[MemberActivity]  WITH CHECK ADD  CONSTRAINT [FK_MemberActivity_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberActivity] CHECK CONSTRAINT [FK_MemberActivity_Members]
GO
ALTER TABLE [dbo].[MemberActivity]  WITH CHECK ADD  CONSTRAINT [FK_MemberActivity_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberActivity] CHECK CONSTRAINT [FK_MemberActivity_Staff]
GO
