USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtAvailability](
	[CourtAvailabilityId] [int] IDENTITY(1,1) NOT NULL,
	[CourtId] [int] NULL,
	[DayOfWeek] [int] NULL,
	[TimeFrom] [varchar](10) NULL,
	[TimeTo] [varchar](10) NULL,
 CONSTRAINT [PK_CourtAvailability] PRIMARY KEY CLUSTERED 
(
	[CourtAvailabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourtAvailability]  WITH CHECK ADD  CONSTRAINT [FK_CourtAvailability_Court] FOREIGN KEY([CourtId])
REFERENCES [dbo].[Court] ([CourtID])
GO
ALTER TABLE [dbo].[CourtAvailability] CHECK CONSTRAINT [FK_CourtAvailability_Court]
GO
