USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCommunicationHistory](
	[StudentCommunicationHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentNumber] [nvarchar](10) NULL,
	[CommunicationUTCDateTime] [datetime] NULL,
	[CommunicationType] [int] NULL,
	[CommunicationSentTo] [nvarchar](100) NULL,
	[RequestedBy] [nvarchar](25) NULL,
	[IsSuccessfullySent] [bit] NULL,
	[BatchID] [nvarchar](100) NULL,
	[HasRead] [bit] NOT NULL,
	[MessageId] [nvarchar](500) NULL,
	[GatewayMessageId] [uniqueidentifier] NULL,
	[DeliveryUtcDateTime] [datetime] NULL,
	[BounceUtcDateTime] [datetime] NULL,
	[InitialOpenUtcDateTime] [datetime] NULL,
	[Subject] [varchar](200) NULL,
	[BounceReason] [varchar](200) NULL,
	[SourceId] [int] NULL,
 CONSTRAINT [PK_StudentCommunicationHistory] PRIMARY KEY CLUSTERED 
(
	[StudentCommunicationHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCommunicationHistory] ADD  DEFAULT ((1)) FOR [HasRead]
GO
