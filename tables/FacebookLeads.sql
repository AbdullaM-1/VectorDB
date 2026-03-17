USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacebookLeads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadId] [varchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[FieldData] [nvarchar](max) NOT NULL,
	[FormId] [varchar](50) NOT NULL,
	[PageId] [varchar](50) NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_FacebookLeads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FacebookLeads]  WITH CHECK ADD  CONSTRAINT [FK_FacebookLeads_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[FacebookLeads] CHECK CONSTRAINT [FK_FacebookLeads_Accounts]
GO
