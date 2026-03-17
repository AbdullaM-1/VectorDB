USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectTracking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayNumber] [int] NOT NULL,
	[Action] [int] NOT NULL,
	[TemplateId] [int] NULL,
	[Content] [varchar](max) NULL,
	[Html] [nvarchar](max) NULL,
	[Subject] [varchar](100) NULL,
	[Statuses] [varchar](100) NULL,
	[ActionName] [varchar](100) NULL,
	[AccountId] [int] NULL,
	[Attachments] [varchar](1000) NULL,
	[Json] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOnUtc] [datetime] NULL,
	[IsAssignCallToSalesPerson] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[ContactMethods] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_ProspectTracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectTracking] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProspectTracking] ADD  DEFAULT ((0)) FOR [IsAssignCallToSalesPerson]
GO
ALTER TABLE [dbo].[ProspectTracking] ADD  DEFAULT ('120,121,122,123,124,125,126,127,128,129,149,256,319,390,414,416') FOR [ContactMethods]
GO
ALTER TABLE [dbo].[ProspectTracking]  WITH CHECK ADD  CONSTRAINT [FK_ProspectTracking_MarketingEmailTemplate] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[MarketingEmailTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[ProspectTracking] CHECK CONSTRAINT [FK_ProspectTracking_MarketingEmailTemplate]
GO
