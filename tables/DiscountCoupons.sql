USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCoupons](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CouponCode] [nvarchar](100) NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[DiscountType] [smallint] NOT NULL,
	[MinimumAmount] [decimal](18, 0) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedUtcDateTime] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[AccountId] [int] NOT NULL,
	[ChargeType] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[DiscountFor] [smallint] NOT NULL,
	[IsCombineFees] [bit] NOT NULL,
	[AllocatedValueJson] [varchar](max) NULL,
 CONSTRAINT [PK_DiscountCoupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiscountCoupons] ADD  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[DiscountCoupons] ADD  DEFAULT ((1)) FOR [DiscountFor]
GO
ALTER TABLE [dbo].[DiscountCoupons] ADD  DEFAULT ((0)) FOR [IsCombineFees]
GO
ALTER TABLE [dbo].[DiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_DiscountCoupons_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[DiscountCoupons] CHECK CONSTRAINT [FK_DiscountCoupons_Staff]
GO
ALTER TABLE [dbo].[DiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_DiscountCoupons_Staff1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[DiscountCoupons] CHECK CONSTRAINT [FK_DiscountCoupons_Staff1]
GO
