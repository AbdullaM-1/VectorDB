USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Colour] [nvarchar](50) NOT NULL,
	[AccountId] [int] NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[Duration60] [bit] NOT NULL,
	[Duration45] [bit] NOT NULL,
	[Duration30] [bit] NOT NULL,
	[AllowedSubscriptions] [varchar](500) NULL,
	[Duration05] [bit] NOT NULL,
	[Duration10] [bit] NOT NULL,
	[Duration15] [bit] NOT NULL,
	[DefaultReminderInMinute] [int] NOT NULL,
	[NotificationEmailTemplateId] [int] NULL,
	[NotificationSmsContent] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_BookingType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_IsOnline]  DEFAULT ((1)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration60]  DEFAULT ((1)) FOR [Duration60]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration45]  DEFAULT ((1)) FOR [Duration45]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration30]  DEFAULT ((1)) FOR [Duration30]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration05]  DEFAULT ((0)) FOR [Duration05]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration10]  DEFAULT ((0)) FOR [Duration10]
GO
ALTER TABLE [dbo].[BookingType] ADD  CONSTRAINT [DF_BookingType_Duration15]  DEFAULT ((0)) FOR [Duration15]
GO
ALTER TABLE [dbo].[BookingType] ADD  DEFAULT ((0)) FOR [DefaultReminderInMinute]
GO
ALTER TABLE [dbo].[BookingType] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BookingType]  WITH CHECK ADD  CONSTRAINT [FK_BookingType_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[BookingType] CHECK CONSTRAINT [FK_BookingType_Accounts]
GO
