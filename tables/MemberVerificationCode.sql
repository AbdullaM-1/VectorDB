USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberVerificationCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[VerificationType] [varchar](50) NOT NULL,
	[VerificationCode] [nvarchar](500) NOT NULL,
	[ExpireOnUtc] [datetime] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[Payload] [varchar](500) NULL,
 CONSTRAINT [PK_MemberVerificationCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberVerificationCode]  WITH CHECK ADD  CONSTRAINT [FK_MemberVerificationCode_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberVerificationCode] CHECK CONSTRAINT [FK_MemberVerificationCode_Members]
GO
