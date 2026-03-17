USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestrictedDiscountCoupons](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MembershipTypeId] [int] NOT NULL,
	[DiscountCouponId] [bigint] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_RestrictedDiscountCoupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RestrictedDiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedDiscountCoupons_DiscountCoupons] FOREIGN KEY([DiscountCouponId])
REFERENCES [dbo].[DiscountCoupons] ([Id])
GO
ALTER TABLE [dbo].[RestrictedDiscountCoupons] CHECK CONSTRAINT [FK_RestrictedDiscountCoupons_DiscountCoupons]
GO
ALTER TABLE [dbo].[RestrictedDiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedDiscountCoupons_MembershipTypes] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([contract_id])
GO
ALTER TABLE [dbo].[RestrictedDiscountCoupons] CHECK CONSTRAINT [FK_RestrictedDiscountCoupons_MembershipTypes]
GO
