USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPaymentVariation](
	[member_payment_variance_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[vary_amount_to] [money] NOT NULL,
	[UFN] [bit] NOT NULL,
	[vary_amount_from] [decimal](18, 2) NOT NULL,
	[IsOverride] [bit] NULL,
	[PerformedBy] [nvarchar](100) NULL,
	[Reason] [varchar](1000) NULL,
	[VariationType] [varchar](50) NOT NULL,
	[UntilDateLocal] [datetime] NULL,
	[AmountOnceDateStart] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MemberPaymentVariation] PRIMARY KEY CLUSTERED 
(
	[member_payment_variance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberPaymentVariation] ADD  CONSTRAINT [DF_MemberPaymentVariation_UFN]  DEFAULT ((0)) FOR [UFN]
GO
ALTER TABLE [dbo].[MemberPaymentVariation] ADD  DEFAULT ((0)) FOR [vary_amount_from]
GO
ALTER TABLE [dbo].[MemberPaymentVariation] ADD  CONSTRAINT [DF_MemberPaymentVariation_VariationType]  DEFAULT ('MemberAmount') FOR [VariationType]
GO
ALTER TABLE [dbo].[MemberPaymentVariation]  WITH CHECK ADD  CONSTRAINT [FK_MemberPaymentVariation_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberPaymentVariation] CHECK CONSTRAINT [FK_MemberPaymentVariation_Members]
GO
