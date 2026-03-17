USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberDebtCollection](
	[DebtCollectionId] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[arrears_amount] [decimal](18, 2) NOT NULL,
	[UTCDateTime] [datetime] NOT NULL,
	[ProcessedUTCDateTime] [datetime] NULL,
 CONSTRAINT [PK_MemberDebtCollection] PRIMARY KEY CLUSTERED 
(
	[DebtCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberDebtCollection] ADD  DEFAULT (getutcdate()) FOR [UTCDateTime]
GO
ALTER TABLE [dbo].[MemberDebtCollection]  WITH CHECK ADD  CONSTRAINT [FK_DebtCollection_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberDebtCollection] CHECK CONSTRAINT [FK_DebtCollection_Members]
GO
