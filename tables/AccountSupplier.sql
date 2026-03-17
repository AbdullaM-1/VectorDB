USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSupplier](
	[AccountSupplierId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[SupplierNumber] [int] NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[SupplierReference] [nvarchar](40) NULL,
	[ContactFirstName] [nvarchar](50) NULL,
	[ContactLastName] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](255) NULL,
	[ContactPhone] [nvarchar](30) NULL,
	[ContactMobile] [nvarchar](30) NULL,
	[ContactFax] [nvarchar](30) NULL,
	[BusinessNumber] [nvarchar](100) NULL,
	[AccountNumber] [nvarchar](40) NULL,
	[WebAccountURL] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[LeadTimeDays] [int] NULL,
	[ShippingReference] [nvarchar](64) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedUtcDateTime] [datetime] NOT NULL,
	[DisplayImagePath] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountSupplier] PRIMARY KEY CLUSTERED 
(
	[AccountSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountSupplier] ADD  CONSTRAINT [DF_AccountSupplier_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AccountSupplier] ADD  CONSTRAINT [DF_AccountSupplier_CreatedUtcDateTime]  DEFAULT (getutcdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountSupplier] ADD  CONSTRAINT [DF_AccountSupplier_UpdatedUtcDateTime]  DEFAULT (getutcdate()) FOR [UpdatedUtcDateTime]
GO
ALTER TABLE [dbo].[AccountSupplier] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountSupplier]  WITH CHECK ADD  CONSTRAINT [FK_AccountSupplier_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountSupplier] CHECK CONSTRAINT [FK_AccountSupplier_Accounts]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The expected number of days between placing an order and the order being received at the Account.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountSupplier', @level2type=N'COLUMN',@level2name=N'LeadTimeDays'
GO
