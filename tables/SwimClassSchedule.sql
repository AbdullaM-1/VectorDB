USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwimClassSchedule](
	[SwimClassScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[SwimClassId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ClassDaysOfWeek] [varchar](100) NOT NULL,
	[ClassTime] [varchar](100) NOT NULL,
	[ClassDuration] [int] NOT NULL,
	[InstructorId] [int] NULL,
	[ClassCapacity] [int] NOT NULL,
	[ClassStartDate] [datetimeoffset](7) NOT NULL,
	[ClassEndDate] [datetimeoffset](7) NULL,
	[ClassType] [int] NOT NULL,
	[Frequency] [int] NOT NULL,
	[Numberofsessions] [int] NULL,
	[ClassLevel] [int] NOT NULL,
	[MinAge] [int] NOT NULL,
	[MaxAge] [int] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[ClassPrice] [money] NOT NULL,
	[Pool] [int] NOT NULL,
	[JoiningFee] [money] NULL,
	[Discount] [money] NULL,
	[TermId] [bigint] NULL,
	[IsByTerms] [bit] NULL,
	[MakeUpFee] [money] NULL,
	[SwimSkillsIds] [nvarchar](1000) NULL,
	[ClassStartDateTimeSort] [datetime] NULL,
	[AddOnAmount] [money] NOT NULL,
	[DeletedDateUtc] [datetime] NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[EnableDirectDebitFlatRate] [bit] NOT NULL,
	[FlatRateFrequency] [varchar](20) NULL,
	[FlatRateAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SwimClassSchedule] PRIMARY KEY CLUSTERED 
(
	[SwimClassScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SwimClassSchedule] ADD  CONSTRAINT [DF_SwimClassSchedule_AddOnAmount]  DEFAULT ((0)) FOR [AddOnAmount]
GO
ALTER TABLE [dbo].[SwimClassSchedule] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SwimClassSchedule] ADD  DEFAULT ((0)) FOR [EnableDirectDebitFlatRate]
GO
ALTER TABLE [dbo].[SwimClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassSchedule_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[SwimClassSchedule] CHECK CONSTRAINT [FK_SwimClassSchedule_Accounts]
GO
ALTER TABLE [dbo].[SwimClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassSchedule_SwimClass] FOREIGN KEY([SwimClassId])
REFERENCES [dbo].[SwimClass] ([SwimClassId])
GO
ALTER TABLE [dbo].[SwimClassSchedule] CHECK CONSTRAINT [FK_SwimClassSchedule_SwimClass]
GO
ALTER TABLE [dbo].[SwimClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_SwimClassSchedule_Trainer] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[SwimClassSchedule] CHECK CONSTRAINT [FK_SwimClassSchedule_Trainer]
GO
