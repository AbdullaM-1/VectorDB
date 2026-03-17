USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAppointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[Summary] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[OutCome] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NULL,
	[LastUpdatedBy] [int] NOT NULL,
	[LastUpdatedUtc] [datetime] NULL,
	[IsConfirmed] [bit] NOT NULL,
	[LinkMemberCallId] [int] NULL,
	[ReminderInMinute] [int] NOT NULL,
	[LastReminderSentOnLocal] [datetime] NULL,
 CONSTRAINT [PK_MemberAppointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberAppointment] ADD  CONSTRAINT [DF_MemberAppointment_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[MemberAppointment] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[MemberAppointment] ADD  DEFAULT ((0)) FOR [ReminderInMinute]
GO
ALTER TABLE [dbo].[MemberAppointment]  WITH CHECK ADD  CONSTRAINT [FK_MemberAppointment_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberAppointment] CHECK CONSTRAINT [FK_MemberAppointment_Members]
GO
ALTER TABLE [dbo].[MemberAppointment]  WITH CHECK ADD  CONSTRAINT [FK_MemberAppointment_Staff] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberAppointment] CHECK CONSTRAINT [FK_MemberAppointment_Staff]
GO
