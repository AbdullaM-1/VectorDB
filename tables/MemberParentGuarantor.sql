USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberParentGuarantor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentGuardianName] [varchar](100) NULL,
	[Relationship] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Signature] [varchar](max) NULL,
	[DateTimeCreatedUtc] [datetime] NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MemberParentGuarantor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberParentGuarantor]  WITH CHECK ADD  CONSTRAINT [FK_MemberParentGuarantor_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberParentGuarantor] CHECK CONSTRAINT [FK_MemberParentGuarantor_Members]
GO
