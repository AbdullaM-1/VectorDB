USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleMobileAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassScheduleId] [int] NOT NULL,
	[Number] [varchar](20) NOT NULL,
	[BookStatus] [int] NULL,
	[ClassDateTime] [datetime] NULL,
	[CancelledDateTimeUtc] [datetime] NULL,
	[BookFor] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastReminderSentOnLocal] [datetime] NULL,
	[DeletedDateTimeUtc] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[CreatedDateUtc] [datetime] NULL,
	[TrainingAreaId] [int] NULL,
	[OnBehalfBookingReference] [varchar](200) NULL,
	[OnBehalfBookFor] [varchar](50) NULL,
	[ReferenceId] [varchar](500) NULL,
	[CreatedBy] [int] NULL,
	[DeletionMethod] [int] NOT NULL,
	[BookingSourceId] [int] NULL,
 CONSTRAINT [PK_ClassScheduleMobileAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount] ADD  DEFAULT ((0)) FOR [DeletionMethod]
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleMobileAccount_ClassSchedule] FOREIGN KEY([ClassScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount] CHECK CONSTRAINT [FK_ClassScheduleMobileAccount_ClassSchedule]
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleMobileAccount_Lookup_Type_Items_TrainingAreaId] FOREIGN KEY([TrainingAreaId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount] CHECK CONSTRAINT [FK_ClassScheduleMobileAccount_Lookup_Type_Items_TrainingAreaId]
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleMobileAccount_Staffs] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ClassScheduleMobileAccount] CHECK CONSTRAINT [FK_ClassScheduleMobileAccount_Staffs]
GO
