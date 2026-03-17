USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimClass](
	[SwimClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](300) NOT NULL,
	[ClassDescription] [nvarchar](max) NULL,
	[ClassCalendarColor] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsOnlinePaymentOptional] [bit] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[CreatedUtcDateTime] [datetimeoffset](7) NOT NULL,
	[ImageName] [varchar](100) NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SwimClass] PRIMARY KEY CLUSTERED 
(
	[SwimClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimClass] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SwimClass] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SwimClass]  WITH CHECK ADD  CONSTRAINT [FK_SwimClass_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[SwimClass] CHECK CONSTRAINT [FK_SwimClass_Accounts_AccountId]
GO
ALTER TABLE [dbo].[SwimClass]  WITH CHECK ADD  CONSTRAINT [FK_SwimClass_aspnet_Users] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[SwimClass] CHECK CONSTRAINT [FK_SwimClass_aspnet_Users]
GO
