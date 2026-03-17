USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](150) NOT NULL,
	[PrimaryPersonFirstName] [nvarchar](100) NULL,
	[PrimaryPersonLastName] [nvarchar](100) NULL,
	[PrimaryPersonEmail] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[AccountId] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDateUtc] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedUtcDateTime] [datetime] NULL,
	[Address] [varchar](300) NULL,
	[Suburb] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
