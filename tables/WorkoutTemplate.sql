USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutTemplate](
	[WorkoutTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[WorkoutName] [varchar](250) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ModifiedDateTimeUtc] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Image] [varchar](300) NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[WorkoutCategoryId] [int] NULL,
 CONSTRAINT [PK_WorkoutTemplate] PRIMARY KEY CLUSTERED 
(
	[WorkoutTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkoutTemplate] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[WorkoutTemplate]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplate_CreatedByStaff] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[WorkoutTemplate] CHECK CONSTRAINT [FK_WorkoutTemplate_CreatedByStaff]
GO
ALTER TABLE [dbo].[WorkoutTemplate]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplate_LookupTypeItems] FOREIGN KEY([WorkoutCategoryId])
REFERENCES [dbo].[Lookup_Type_Items] ([Lookup_Type_ItemId])
GO
ALTER TABLE [dbo].[WorkoutTemplate] CHECK CONSTRAINT [FK_WorkoutTemplate_LookupTypeItems]
GO
ALTER TABLE [dbo].[WorkoutTemplate]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutTemplate_ModifiedByStaff] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[WorkoutTemplate] CHECK CONSTRAINT [FK_WorkoutTemplate_ModifiedByStaff]
GO
