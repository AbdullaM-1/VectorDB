USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountProductCategory](
	[AccountProductCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[ProductCategoryName] [nvarchar](40) NOT NULL,
	[ShortDescription] [nvarchar](255) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[CreatedUserName] [nvarchar](50) NOT NULL,
	[UpdatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedUserName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayImagePath] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsPosCategory] [bit] NOT NULL,
 CONSTRAINT [PK_AccountProductCategory] PRIMARY KEY CLUSTERED 
(
	[AccountProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountProductCategory] ADD  CONSTRAINT [DF_AccountProductCategory_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductCategory] ADD  CONSTRAINT [DF_AccountProductCategory_UpdatedUtcDateTime]  DEFAULT (getutcdate()) FOR [UpdatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountProductCategory] ADD  CONSTRAINT [DF_AccountProductCategory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AccountProductCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountProductCategory] ADD  DEFAULT ((1)) FOR [IsPosCategory]
GO
ALTER TABLE [dbo].[AccountProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_AccountProductCategory_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountProductCategory] CHECK CONSTRAINT [FK_AccountProductCategory_Accounts]
GO
