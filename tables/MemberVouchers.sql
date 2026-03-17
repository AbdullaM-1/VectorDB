USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberVouchers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[VoucherId] [int] NOT NULL,
	[RedeemedDate] [date] NULL,
	[ExpirationDate] [date] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdatedUtcDateTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActivated] [bit] NOT NULL,
 CONSTRAINT [PK_MemberVouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberVouchers] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MemberVouchers] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[MemberVouchers]  WITH CHECK ADD  CONSTRAINT [FK_Members_Vouchers_MemberNumber] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberVouchers] CHECK CONSTRAINT [FK_Members_Vouchers_MemberNumber]
GO
ALTER TABLE [dbo].[MemberVouchers]  WITH CHECK ADD  CONSTRAINT [FK_MemberVouchers_aspnet_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[MemberVouchers] CHECK CONSTRAINT [FK_MemberVouchers_aspnet_Users1]
GO
ALTER TABLE [dbo].[MemberVouchers]  WITH CHECK ADD  CONSTRAINT [FK_MemberVouchers_aspnet_Users2] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[MemberVouchers] CHECK CONSTRAINT [FK_MemberVouchers_aspnet_Users2]
GO
ALTER TABLE [dbo].[MemberVouchers]  WITH CHECK ADD  CONSTRAINT [FK_MemberVouchers_Vouchers_VoucherId] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Vouchers] ([Id])
GO
ALTER TABLE [dbo].[MemberVouchers] CHECK CONSTRAINT [FK_MemberVouchers_Vouchers_VoucherId]
GO
