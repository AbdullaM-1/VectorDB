USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTracking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Action] [int] NOT NULL,
	[TemplateId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Html] [nvarchar](max) NULL,
	[Subject] [varchar](100) NULL,
	[NotifiedBy] [nvarchar](10) NOT NULL,
	[MembershipTypeIds] [varchar](1000) NULL,
	[ActionName] [varchar](100) NULL,
	[AccountId] [int] NOT NULL,
	[Attachments] [varchar](1000) NULL,
	[Json] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOnUtc] [datetime] NULL,
	[TriggeredBy] [varchar](100) NULL,
	[TriggeredValue] [nvarchar](1000) NULL,
	[ArchiveReasonIds] [varchar](1000) NULL,
	[MemberRiskIds] [varchar](50) NULL,
	[IsAssignCallToSalesPerson] [bit] NOT NULL,
 CONSTRAINT [PK_MemberTracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberTracking] ADD  DEFAULT ('Days') FOR [NotifiedBy]
GO
ALTER TABLE [dbo].[MemberTracking] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[MemberTracking] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberTracking] ADD  DEFAULT ((0)) FOR [IsAssignCallToSalesPerson]
GO
ALTER TABLE [dbo].[MemberTracking]  WITH CHECK ADD  CONSTRAINT [FK_MemberTracking_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MemberTracking] CHECK CONSTRAINT [FK_MemberTracking_Accounts_AccountId]
GO
ALTER TABLE [dbo].[MemberTracking]  WITH CHECK ADD  CONSTRAINT [FK_MemberTracking_MarketingEmailTemplate] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[MarketingEmailTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[MemberTracking] CHECK CONSTRAINT [FK_MemberTracking_MarketingEmailTemplate]
GO
