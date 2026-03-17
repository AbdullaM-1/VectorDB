USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmendedPayment](
	[AmendedPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[PreviousAmount] [decimal](18, 2) NOT NULL,
	[NewAmount] [decimal](18, 2) NOT NULL,
	[StaffId] [int] NULL,
	[ChangedDateTime] [datetime] NOT NULL,
	[ChangedUtcDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AmendedPayment] PRIMARY KEY CLUSTERED 
(
	[AmendedPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AmendedPayment]  WITH CHECK ADD  CONSTRAINT [FK_AmendedPayment_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[AmendedPayment] CHECK CONSTRAINT [FK_AmendedPayment_Members]
GO
ALTER TABLE [dbo].[AmendedPayment]  WITH CHECK ADD  CONSTRAINT [FK_AmendedPayment_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[AmendedPayment] CHECK CONSTRAINT [FK_AmendedPayment_Staff]
GO
