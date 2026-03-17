USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectActivity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
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
	[ProspectStatus] [nvarchar](25) NULL,
 CONSTRAINT [PK_ProspectActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectActivity] ADD  CONSTRAINT [DF_ProspectActivity_IsNow]  DEFAULT ((1)) FOR [IsNow]
GO
ALTER TABLE [dbo].[ProspectActivity] ADD  CONSTRAINT [DF_ProspectActivity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProspectActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProspectActivity_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectActivity] CHECK CONSTRAINT [FK_ProspectActivity_Prospects]
GO
ALTER TABLE [dbo].[ProspectActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProspectActivity_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectActivity] CHECK CONSTRAINT [FK_ProspectActivity_Staff]
GO
