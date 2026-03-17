USE [hkietech]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerBookingTypePricing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerId] [int] NOT NULL,
	[BookingTypeId] [int] NOT NULL,
	[Cost] [decimal](9, 2) NULL,
 CONSTRAINT [PK_TrainerBookingTypePricing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainerBookingTypePricing]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBookingTypePricing_BookingType_BookingTypeId] FOREIGN KEY([BookingTypeId])
REFERENCES [dbo].[BookingType] ([Id])
GO
ALTER TABLE [dbo].[TrainerBookingTypePricing] CHECK CONSTRAINT [FK_TrainerBookingTypePricing_BookingType_BookingTypeId]
GO
ALTER TABLE [dbo].[TrainerBookingTypePricing]  WITH CHECK ADD  CONSTRAINT [FK_TrainerBookingTypePricing_Trainer_TrainerId] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[TrainerBookingTypePricing] CHECK CONSTRAINT [FK_TrainerBookingTypePricing_Trainer_TrainerId]
GO
