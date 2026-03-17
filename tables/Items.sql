USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [money] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDateUtc] [datetime] NULL,
	[ExcludeFromGst] [bit] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [ExcludeFromGst]
GO
