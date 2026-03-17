USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberArrears](
	[MemberArrearsId] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[TransactionFailedUtcDateTime] [datetime] NOT NULL,
	[ArrearsAmount] [money] NOT NULL,
	[ProcessedUtcDateTime] [datetime] NULL,
	[DeletedUtcDateTime] [datetime] NULL,
 CONSTRAINT [PK_MemberArrears] PRIMARY KEY CLUSTERED 
(
	[MemberArrearsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberArrears] ADD  DEFAULT (NULL) FOR [DeletedUtcDateTime]
GO
ALTER TABLE [dbo].[MemberArrears]  WITH CHECK ADD  CONSTRAINT [FK_MemberArrears_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberArrears] CHECK CONSTRAINT [FK_MemberArrears_Members]
GO
