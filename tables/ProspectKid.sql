USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectKid](
	[ProspectKidId] [int] IDENTITY(1,1) NOT NULL,
	[ProspectNumber] [varchar](10) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[PhotoLocation] [varchar](300) NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_ProspectKid] PRIMARY KEY CLUSTERED 
(
	[ProspectKidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectKid]  WITH CHECK ADD  CONSTRAINT [FK_ProspectKid_Prospects] FOREIGN KEY([ProspectNumber])
REFERENCES [dbo].[Prospects] ([ProspectNumber])
GO
ALTER TABLE [dbo].[ProspectKid] CHECK CONSTRAINT [FK_ProspectKid_Prospects]
GO
