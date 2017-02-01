USE [SISAC]
GO
/****** Object:  Table [Process].[NationalJetFuelReconciliationManualLoadLog]    Script Date: 14/10/2016 12:40:57 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelReconciliationManualLoadLog]') AND type in (N'U'))
DROP TABLE [Process].[NationalJetFuelReconciliationManualLoadLog]
GO
/****** Object:  Table [Process].[NationalJetFuelReconciliationManualLoadLog]    Script Date: 14/10/2016 12:40:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelReconciliationManualLoadLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelReconciliationManualLoadLog](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[ID] [bigint] NOT NULL,
	[PeriodCode] [varchar](30) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[DepartureStation] [varchar](3) NOT NULL,
	[ArrivalStation] [varchar](3) NOT NULL,
	[NationalJetFuelTicketID] [bigint] NOT NULL,
	[FuelingStartDate] [datetime] NOT NULL,
	[FuelingEndDate] [datetime] NOT NULL,
	[TicketNumber] [varchar](10) NOT NULL,
	[FueledQtyLts] [int] NOT NULL,
	[RemainingQtyKgs] [int] NULL,
	[RequestedQtyKgs] [int] NULL,
	[FueledQtyKgs] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[PemexSubTotal] [numeric](38, 5) NOT NULL,
	[SuministroSubTotal] [numeric](38, 5) NOT NULL,
	[FleteSubTotal] [numeric](38, 5) NOT NULL,
	[Iva] [int] NOT NULL,
	[PrecioSubTotal] [numeric](38, 5) NOT NULL,
	[Total] [numeric](38, 5) NOT NULL,
	[ErrorDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TEST] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
