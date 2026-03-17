USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](300) NOT NULL,
	[ClassDescription] [nvarchar](max) NULL,
	[ClassSpecialInstructions] [nvarchar](max) NULL,
	[ClassCalendarColor] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsOnlinePaymentOptional] [bit] NOT NULL,
	[ClassPrice] [money] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[Department] [varchar](10) NOT NULL,
	[ClassIcon] [varchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AccountId] [int] NOT NULL,
	[MaxBooking] [int] NOT NULL,
	[EnableMaxBooking] [bit] NOT NULL,
	[InstructorCost] [money] NOT NULL,
	[ClassCategory] [int] NOT NULL,
	[MaxDailyBooking] [int] NOT NULL,
	[EnableMaxDailyBooking] [bit] NOT NULL,
	[ClassSuperCategory] [int] NOT NULL,
	[ClassCategoryList] [varchar](100) NULL,
	[ClassSuperCategoryList] [varchar](100) NULL,
	[IsMaximumNoShowsEnabled] [bit] NOT NULL,
	[MaximumNoShowsCount] [int] NULL,
	[MaximumNoShowsDuringPeriod] [int] NULL,
	[BlockBookingDays] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class] ADD  CONSTRAINT [DF_Class_Department]  DEFAULT ('Member') FOR [Department]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [MaxBooking]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [EnableMaxBooking]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0.0)) FOR [InstructorCost]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [ClassCategory]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [MaxDailyBooking]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [EnableMaxDailyBooking]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [ClassSuperCategory]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [IsMaximumNoShowsEnabled]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_aspnet_Users] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_aspnet_Users]
GO
