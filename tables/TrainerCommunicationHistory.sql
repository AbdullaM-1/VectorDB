USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerCommunicationHistory](
	[TrainerCommunicationHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainerNumber] [int] NOT NULL,
	[CommunicationUTCDateTime] [datetime] NULL,
	[CommunicationType] [int] NULL,
	[CommunicationSentTo] [nvarchar](100) NULL,
	[RequestedBy] [nvarchar](200) NULL,
	[IsSuccessfullySent] [bit] NULL,
	[BatchID] [nvarchar](100) NULL,
	[MessageId] [nvarchar](500) NULL,
	[HasRead] [bit] NOT NULL,
	[AttachmentFileName] [nvarchar](500) NULL,
	[ContentType] [nvarchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[GatewayMessageId] [uniqueidentifier] NULL,
	[DeliveryUtcDateTime] [datetime] NULL,
	[BounceUtcDateTime] [datetime] NULL,
	[InitialOpenUtcDateTime] [datetime] NULL,
	[BounceReason] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerCommunicationHistoryId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerCommunicationHistory] ADD  DEFAULT ((1)) FOR [HasRead]
GO
