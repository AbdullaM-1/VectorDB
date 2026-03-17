USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](80) NOT NULL,
	[Gender] [int] NULL,
	[AgeFrom] [int] NULL,
	[AgeTo] [int] NULL,
	[MembershipType] [nvarchar](500) NULL,
	[SalesPerson] [nvarchar](1000) NULL,
	[Trainer] [nvarchar](1000) NULL,
	[MembershipStatus] [nvarchar](100) NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
