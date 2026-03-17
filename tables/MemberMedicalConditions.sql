USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMedicalConditions](
	[member_condition_id] [int] IDENTITY(1,1) NOT NULL,
	[member_number] [varchar](20) NOT NULL,
	[member_condition_date] [smalldatetime] NULL,
	[member_condition] [varchar](max) NULL,
 CONSTRAINT [PK_MemberMedicalConditions] PRIMARY KEY CLUSTERED 
(
	[member_condition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberMedicalConditions]  WITH CHECK ADD  CONSTRAINT [FK_MemberMedicalConditions_Members] FOREIGN KEY([member_number])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberMedicalConditions] CHECK CONSTRAINT [FK_MemberMedicalConditions_Members]
GO
