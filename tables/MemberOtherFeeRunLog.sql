USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOtherFeeRunLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[RunDateUtc] [datetime] NOT NULL,
	[RunByStaff] [int] NOT NULL,
	[ChargedAmount] [decimal](18, 2) NOT NULL,
	[ChargeType] [int] NOT NULL,
	[TotalMembers] [int] NOT NULL,
	[TotalChargedAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_MemberOtherFeeRunLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberOtherFeeRunLog]  WITH CHECK ADD  CONSTRAINT [FK_MemberOtherFeeRunLog_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[MemberOtherFeeRunLog] CHECK CONSTRAINT [FK_MemberOtherFeeRunLog_Accounts]
GO
ALTER TABLE [dbo].[MemberOtherFeeRunLog]  WITH CHECK ADD  CONSTRAINT [FK_MemberOtherFeeRunLog_Staff] FOREIGN KEY([RunByStaff])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MemberOtherFeeRunLog] CHECK CONSTRAINT [FK_MemberOtherFeeRunLog_Staff]
GO
