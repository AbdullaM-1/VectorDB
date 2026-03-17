USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDateChangeHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChangeUtcDateTime] [datetime] NOT NULL,
	[ChangeLocalDateTime] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[FromPaymentDate] [datetime] NOT NULL,
	[ToPaymentDate] [datetime] NOT NULL,
	[ActionedById] [int] NOT NULL,
	[ChangeReasonId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentDateChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentDateChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDateChangeHistory_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[PaymentDateChangeHistory] CHECK CONSTRAINT [FK_PaymentDateChangeHistory_Members]
GO
ALTER TABLE [dbo].[PaymentDateChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDateChangeHistoryy_Staff] FOREIGN KEY([ActionedById])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PaymentDateChangeHistory] CHECK CONSTRAINT [FK_PaymentDateChangeHistoryy_Staff]
GO
