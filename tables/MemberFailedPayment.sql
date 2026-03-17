USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFailedPayment](
	[MemberFailedPaymentId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[DishonorDate] [datetime] NOT NULL,
	[Reason] [varchar](1000) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
 CONSTRAINT [PK_MemberFailedPayment] PRIMARY KEY CLUSTERED 
(
	[MemberFailedPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberFailedPayment]  WITH CHECK ADD  CONSTRAINT [FK_MemberFailedPayment_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberFailedPayment] CHECK CONSTRAINT [FK_MemberFailedPayment_Members]
GO
