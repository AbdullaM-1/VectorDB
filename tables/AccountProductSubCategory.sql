USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountProductSubCategory](
	[AccountProductSubCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[AccountProductCategoryId] [bigint] NOT NULL,
	[ProductSubCategoryName] [nvarchar](40) NOT NULL,
	[ShortDescription] [nvarchar](255) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedUserName] [nvarchar](50) NOT NULL,
	[UpdatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedUserName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DisplayImagePath] [nvarchar](255) NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[GlCode] [varchar](15) NULL,
 CONSTRAINT [PK_AccountProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[AccountProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountProductSubCategory] ADD  CONSTRAINT [DF_AccountProductSubCategory_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductSubCategory] ADD  CONSTRAINT [DF_AccountProductSubCategory_UpdatedUtcDateTime]  DEFAULT (getutcdate()) FOR [UpdatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductSubCategory] ADD  CONSTRAINT [DF_AccountProductSubCategory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AccountProductSubCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductSubCategory_AccountProductCategory] FOREIGN KEY([AccountProductCategoryId])
REFERENCES [dbo].[AccountProductCategory] ([AccountProductCategoryId])
GO
ALTER TABLE [dbo].[AccountProductSubCategory] CHECK CONSTRAINT [FK_AccountProductSubCategory_AccountProductCategory]
GO
ALTER TABLE [dbo].[AccountProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductSubCategory_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountProductSubCategory] CHECK CONSTRAINT [FK_AccountProductSubCategory_Accounts]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product sub-category internal identifier (primary key)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSubCategory', @level2type=N'COLUMN',@level2name=N'AccountProductSubCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product category to which the sub-category belongs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProductSubCategory', @level2type=N'COLUMN',@level2name=N'AccountProductCategoryId'
GO
