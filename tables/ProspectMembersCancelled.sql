USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProspectMembersCancelled](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[CancelledDate] [datetime] NOT NULL,
	[CreatedDateUTC] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[EndDate] [datetime] NULL,
	[Reason] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ProspectMembersCancelled] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectMembersCancelled] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProspectMembersCancelled]  WITH CHECK ADD  CONSTRAINT [FK_ProspectMembersCancelled_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[ProspectMembersCancelled] CHECK CONSTRAINT [FK_ProspectMembersCancelled_Accounts]
GO
ALTER TABLE [dbo].[ProspectMembersCancelled]  WITH CHECK ADD  CONSTRAINT [FK_ProspectMembersCancelled_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[ProspectMembersCancelled] CHECK CONSTRAINT [FK_ProspectMembersCancelled_Staff]
GO
