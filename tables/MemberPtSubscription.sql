USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPtSubscription](
	[MemberPtSubscriptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [varchar](20) NOT NULL,
	[PtFrequency] [int] NOT NULL,
	[NumberofPtsessions] [int] NOT NULL,
	[RemainNumberofPtsessions] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[TrainerBookingId] [int] NOT NULL,
	[SubscriptionId] [int] NOT NULL,
	[CancelledDateUtc] [datetime] NULL,
	[CancelledBy] [int] NULL,
	[CurrentAmount] [decimal](18, 2) NULL,
	[PreviousAmount] [decimal](18, 2) NULL,
	[IsOngoing] [bit] NULL,
	[UntilDateLocal] [datetime] NULL,
	[DateFromLocal] [datetime] NULL,
	[DateToLocal] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[PtSessionDuration] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[StoredCredit] [int] NOT NULL,
	[CompletedDateUtc] [datetime] NULL,
	[PaymentMessageId] [varchar](50) NULL,
	[UpdatedDateUtc] [datetime] NULL,
	[SalesPersonId] [int] NULL,
 CONSTRAINT [PK_MemberPtSubscription] PRIMARY KEY CLUSTERED 
(
	[MemberPtSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberPtSubscription] ADD  CONSTRAINT [DF_MemberPtSubscription_CreatedUtcDateTime]  DEFAULT (getdate()) FOR [CreatedUtcDateTime]
GO
ALTER TABLE [dbo].[MemberPtSubscription] ADD  CONSTRAINT [DF_MemberPtSubscription_SubscriptionId]  DEFAULT ((0)) FOR [SubscriptionId]
GO
ALTER TABLE [dbo].[MemberPtSubscription] ADD  DEFAULT ((0)) FOR [PtSessionDuration]
GO
ALTER TABLE [dbo].[MemberPtSubscription] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[MemberPtSubscription] ADD  DEFAULT ((0)) FOR [StoredCredit]
GO
ALTER TABLE [dbo].[MemberPtSubscription]  WITH CHECK ADD  CONSTRAINT [FK_MemberPtSubscription_Members] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Members] ([member_number])
GO
ALTER TABLE [dbo].[MemberPtSubscription] CHECK CONSTRAINT [FK_MemberPtSubscription_Members]
GO
