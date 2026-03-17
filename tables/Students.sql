USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[AccountId] [int] NULL,
	[StudentBarcode] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [smalldatetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[Street] [nvarchar](500) NULL,
	[SubUrb] [nvarchar](500) NULL,
	[State] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[PhotoLocation] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDateTimeUtc] [datetime] NULL,
	[ModifiedDateTimeUtc] [datetime] NULL,
	[IsNewStudent] [bit] NOT NULL,
	[DishonorDate1] [datetime] NULL,
	[DishonorDate2] [datetime] NULL,
	[DishonorDate3] [datetime] NULL,
	[MedicalInfo] [varchar](max) NULL,
	[TotalCreditAmount] [money] NOT NULL,
	[HowHeard] [int] NULL,
	[IsBadEmail] [bit] NOT NULL,
	[IsBadMobile] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsEmailSubscribed] [bit] NOT NULL,
	[IsSmsSubscribed] [bit] NOT NULL,
	[NDISNumber] [varchar](100) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [IsNewStudent]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [TotalCreditAmount]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [IsBadEmail]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [IsBadMobile]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((1)) FOR [IsEmailSubscribed]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((1)) FOR [IsSmsSubscribed]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Accounts]
GO
