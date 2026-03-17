USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarNote](
	[CalendarNoteId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ScheduledDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Comments] [varchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[BookingTypeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[DeletedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_CalendarNote] PRIMARY KEY CLUSTERED 
(
	[CalendarNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CalendarNote] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[CalendarNote] ADD  DEFAULT ((0)) FOR [BookingTypeId]
GO
ALTER TABLE [dbo].[CalendarNote] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
