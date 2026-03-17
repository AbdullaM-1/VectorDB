USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassScheduleChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[ChangeType] [varchar](30) NOT NULL,
	[OldValue] [varchar](500) NOT NULL,
	[NewValue] [varchar](500) NOT NULL,
	[ClassDateTime] [datetime] NOT NULL,
	[DateChangedUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassScheduleChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassScheduleChanges]  WITH CHECK ADD  CONSTRAINT [FK_ClassScheduleChanges_ClassSchedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[ClassSchedule] ([ClassScheduleId])
GO
ALTER TABLE [dbo].[ClassScheduleChanges] CHECK CONSTRAINT [FK_ClassScheduleChanges_ClassSchedule_ScheduleId]
GO
