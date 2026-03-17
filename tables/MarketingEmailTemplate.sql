USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketingEmailTemplate](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedUtcDateTime] [datetime] NOT NULL,
	[Html] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[ThumbnailImage] [nvarchar](500) NULL,
	[Subject] [varchar](100) NULL,
	[IsSystemTemplate] [bit] NOT NULL,
	[AccountId] [int] NULL,
	[CategoryId] [int] NULL,
	[Json] [nvarchar](max) NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Department] [int] NOT NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] ADD  DEFAULT ('0') FOR [IsSystemTemplate]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] ADD  DEFAULT ((0)) FOR [Department]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Template_Users_Created] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] CHECK CONSTRAINT [FK_Template_Users_Created]
GO
ALTER TABLE [dbo].[MarketingEmailTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Template_Users_LastUpdated] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[MarketingEmailTemplate] CHECK CONSTRAINT [FK_Template_Users_LastUpdated]
GO
