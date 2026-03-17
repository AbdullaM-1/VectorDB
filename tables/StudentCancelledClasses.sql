USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCancelledClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentSwimClassBookingDetailId] [int] NOT NULL,
	[CancelledDate] [datetime] NOT NULL,
	[IsMakeUpFeeCredit] [bit] NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[ReasonId] [int] NOT NULL,
	[IsAdjustedIDDA] [bit] NOT NULL,
	[DateAdjustedIDDA] [datetime] NULL,
	[DateUtcAdjustedIDDA] [datetime] NULL,
	[CreatedDatetimeUtc] [datetime] NULL,
 CONSTRAINT [PK_StudentCancelledClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCancelledClasses] ADD  DEFAULT ((0)) FOR [IsMakeUpFeeCredit]
GO
ALTER TABLE [dbo].[StudentCancelledClasses] ADD  DEFAULT ((0)) FOR [IsUsed]
GO
ALTER TABLE [dbo].[StudentCancelledClasses] ADD  DEFAULT ((0)) FOR [ReasonId]
GO
ALTER TABLE [dbo].[StudentCancelledClasses] ADD  DEFAULT ((0)) FOR [IsAdjustedIDDA]
GO
ALTER TABLE [dbo].[StudentCancelledClasses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCancelledClasses_StudentSwimClassBookingDetailId] FOREIGN KEY([StudentSwimClassBookingDetailId])
REFERENCES [dbo].[StudentSwimClassBookingDetail] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCancelledClasses] CHECK CONSTRAINT [FK_StudentCancelledClasses_StudentSwimClassBookingDetailId]
GO
