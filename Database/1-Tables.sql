USE [SISAC_DEV]
GO
/****** Object:  Schema [Airport]    Script Date: 13/01/2017 01:42:02 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Airport')
EXEC sys.sp_executesql N'CREATE SCHEMA [Airport]'

GO
/****** Object:  Schema [Catalog]    Script Date: 13/01/2017 01:42:03 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Catalog')
EXEC sys.sp_executesql N'CREATE SCHEMA [Catalog]'

GO
/****** Object:  Schema [Company]    Script Date: 13/01/2017 01:42:03 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Company')
EXEC sys.sp_executesql N'CREATE SCHEMA [Company]'

GO
/****** Object:  Schema [Finance]    Script Date: 13/01/2017 01:42:04 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Finance')
EXEC sys.sp_executesql N'CREATE SCHEMA [Finance]'

GO
/****** Object:  Schema [Itinerary]    Script Date: 13/01/2017 01:42:04 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Itinerary')
EXEC sys.sp_executesql N'CREATE SCHEMA [Itinerary]'

GO
/****** Object:  Schema [Process]    Script Date: 13/01/2017 01:42:05 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Process')
EXEC sys.sp_executesql N'CREATE SCHEMA [Process]'

GO
/****** Object:  Schema [Security]    Script Date: 13/01/2017 01:42:06 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Security')
EXEC sys.sp_executesql N'CREATE SCHEMA [Security]'

GO
/****** Object:  Table [Airport].[AdditionalPassengerInformation]    Script Date: 13/01/2017 01:42:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[AdditionalPassengerInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[AdditionalPassengerInformation](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[AdultNational] [int] NOT NULL,
	[AdultInternational] [int] NOT NULL,
	[MinorNational] [int] NOT NULL,
	[MinorInternational] [int] NOT NULL,
	[DiplomaticNational] [int] NOT NULL,
	[DiplomaticInternational] [int] NOT NULL,
	[CommissionNational] [int] NOT NULL,
	[CommissionInternational] [int] NOT NULL,
	[InfantNational] [int] NOT NULL,
	[InfantInternational] [int] NOT NULL,
	[TransitoryNational] [int] NOT NULL,
	[TransitoryInternational] [int] NOT NULL,
	[ConnectionNational] [int] NOT NULL,
	[ConnectionInternational] [int] NOT NULL,
	[OtherNational] [int] NOT NULL,
	[OtherInternational] [int] NOT NULL,
	[PaxDni] [int] NOT NULL,
 CONSTRAINT [PK_AdditionalPassengerInformation] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Airline]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Airline]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Airline](
	[AirlineCode] [varchar](3) NOT NULL,
	[AirlineName] [varchar](40) NOT NULL,
	[AirlineShortName] [varchar](3) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Airline_Status]  DEFAULT ((1)),
	[CompanyCode] [varchar](10) NOT NULL,
	[Division] [varchar](10) NOT NULL,
	[BusinessName] [varchar](100) NULL,
 CONSTRAINT [PK_Airline_AirlineCode] PRIMARY KEY CLUSTERED 
(
	[AirlineCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Airplane]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Airplane]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Airplane](
	[EquipmentNumber] [varchar](12) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[AirplaneModel] [varchar](12) NOT NULL,
	[MaximumTakeoffWeight] [numeric](10, 2) NOT NULL,
	[WeightInPound] [numeric](10, 2) NOT NULL,
	[WeightInTonnes] [numeric](10, 2) NOT NULL,
	[SerialNumber] [varchar](20) NULL,
	[EmptyOperatingWeight] [numeric](10, 2) NOT NULL,
	[FilmingMaximumWeight] [numeric](10, 2) NOT NULL,
	[TakeoffWeightInTonnes] [numeric](10, 2) NOT NULL,
	[GroupWeight] [numeric](10, 2) NOT NULL,
	[MaximumLandingWeight] [numeric](10, 2) NOT NULL,
	[MaximumZeroFuelWeight] [numeric](10, 2) NOT NULL,
	[PassengerCapacity] [int] NOT NULL,
	[CrewCapacity] [int] NOT NULL,
	[Magnitude] [numeric](10, 2) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Airplane_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Airplane] PRIMARY KEY CLUSTERED 
(
	[EquipmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[AirplaneType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[AirplaneType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[AirplaneType](
	[AirplaneModel] [varchar](12) NOT NULL,
	[MaximumTakeoffWeight] [numeric](10, 2) NOT NULL,
	[WeightInPound] [numeric](10, 2) NOT NULL,
	[WeightInTonnes] [numeric](10, 2) NOT NULL,
	[EmptyOperatingWeight] [numeric](10, 2) NOT NULL,
	[FilmingMaximumWeight] [numeric](10, 2) NOT NULL,
	[TakeoffWeightInTonnes] [numeric](10, 2) NOT NULL,
	[GroupWeight] [numeric](10, 2) NOT NULL,
	[MaximumLandingWeight] [numeric](10, 2) NOT NULL,
	[MaximumZeroFuelWeight] [numeric](10, 2) NOT NULL,
	[PassengerCapacity] [int] NOT NULL,
	[CrewCapacity] [int] NOT NULL,
	[Magnitude] [numeric](10, 2) NOT NULL,
	[FuelInLiters] [numeric](10, 2) NOT NULL,
	[FuelInKg] [numeric](10, 2) NOT NULL,
	[FuelInGallon] [numeric](11, 2) NOT NULL,
	[CompartmentTypeCode] [varchar](8) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_AirplaneType_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_AirplaneType] PRIMARY KEY CLUSTERED 
(
	[AirplaneModel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Airport]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Airport]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Airport](
	[StationCode] [varchar](3) NOT NULL,
	[StationName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](3) NOT NULL,
	[OpeningTime] [time](7) NULL,
	[ClosingTime] [time](7) NULL,
	[AirportGroupCode] [varchar](8) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Airport_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Airport_StationCode] PRIMARY KEY CLUSTERED 
(
	[StationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[AirportGroup]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[AirportGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[AirportGroup](
	[AirportGroupCode] [varchar](8) NOT NULL,
	[AirportGroupName] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_AirportGroup_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_AirportGroup_AirportGroupCode] PRIMARY KEY CLUSTERED 
(
	[AirportGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[AirportSchedule]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[AirportSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[AirportSchedule](
	[AirportScheduleID] [bigint] IDENTITY(1,1) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ScheduleTypeCode] [varchar](3) NOT NULL,
	[StartTimeSchedule] [time](7) NOT NULL,
	[EndTimeSchedule] [time](7) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_AirportSchedule] PRIMARY KEY CLUSTERED 
(
	[AirportScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[AirportService]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[AirportService]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[AirportService](
	[AirportServiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[ApronPosition] [varchar](8) NOT NULL,
	[QtyServices] [int] NOT NULL,
	[QtyHours] [int] NOT NULL,
	[StartDateService] [datetime] NOT NULL,
	[StartTimeService] [time](7) NOT NULL,
	[EndDateService] [datetime] NOT NULL,
	[EndTimeService] [time](7) NOT NULL,
	[DrinkingWaterID] [bigint] NULL,
	[GpuCode] [varchar](50) NULL,
	[GpuStartMeter] [float] NULL,
	[GpuEndMeter] [float] NULL,
	[GpuObservationCode] [varchar](10) NULL,
	[OperationTypeName] [varchar](20) NULL,
	[FuelBeforeLanding] [float] NULL,
	[FuelLoaded] [float] NULL,
	[Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_AirportService] PRIMARY KEY CLUSTERED 
(
	[AirportServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[CompartmentType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[CompartmentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[CompartmentType](
	[CompartmentTypeCode] [varchar](8) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_CompartmentType_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_CompartmentTypeConfig] PRIMARY KEY CLUSTERED 
(
	[CompartmentTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[CompartmentTypeConfig]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[CompartmentTypeConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[CompartmentTypeConfig](
	[CompartmentTypeID] [int] NOT NULL,
	[CompartmentTypeCode] [varchar](8) NOT NULL,
	[CompartmentTypeName] [varchar](40) NOT NULL,
	[MaximumWeight] [numeric](10, 2) NOT NULL,
	[CompartmentTypeLevel] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CompartmentTypeConfig_CompartmentTypeID] PRIMARY KEY CLUSTERED 
(
	[CompartmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[CompartmentTypeInformation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[CompartmentTypeInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[CompartmentTypeInformation](
	[CompartmentTypeInformationID] [int] NOT NULL,
	[CompartmentTypeCode] [varchar](8) NOT NULL,
	[CompartmentTypeInformationName] [varchar](50) NOT NULL,
	[CompartmentTypeInformationLevel] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_CompartmentTypeInformation_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_CompartmentTypeInformation] PRIMARY KEY CLUSTERED 
(
	[CompartmentTypeInformationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Crew]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Crew]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Crew](
	[CrewID] [bigint] IDENTITY(1,1) NOT NULL,
	[CrewTypeID] [varchar](4) NULL,
	[LastName] [varchar](100) NULL,
	[FirstName] [varchar](100) NOT NULL,
	[MiddleName] [varchar](100) NULL,
	[Gender] [varchar](1) NOT NULL,
	[CountryOfResidence] [varchar](3) NOT NULL,
	[PlaceBirthCity] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[CountryOfBird] [varchar](3) NOT NULL,
	[DateOfBird] [datetime] NOT NULL,
	[Citizenship] [varchar](3) NOT NULL,
	[StatusOnBoardCode] [varchar](5) NOT NULL,
	[HomeAddress] [varchar](255) NULL,
	[HomeAddressCity] [varchar](100) NULL,
	[HomeAddressState] [varchar](50) NULL,
	[HomeAddressZipCode] [varchar](10) NULL,
	[HomeAddressCountry] [varchar](2) NOT NULL,
	[PassportNumber] [varchar](20) NULL,
	[PassportCountryIssuance] [varchar](2) NOT NULL,
	[PassportExpiration] [datetime] NOT NULL,
	[LicenceNumber] [varchar](20) NULL,
	[LicenceCountryIssuance] [varchar](2) NOT NULL,
	[LicenceNumberExpiration] [datetime] NOT NULL,
	[NickName] [varchar](50) NOT NULL,
	[NickNameSabre] [varchar](50) NULL,
	[VisaExpirationDate] [datetime] NULL,
	[EmployeeNumber] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Crew_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NOT NULL CONSTRAINT [DF_Crew_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Crew_CrewID] PRIMARY KEY CLUSTERED 
(
	[CrewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[CrewType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[CrewType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[CrewType](
	[CrewTypeID] [varchar](4) NOT NULL,
	[CrewTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CrewType_CrewTypeID] PRIMARY KEY CLUSTERED 
(
	[CrewTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Delay]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Delay]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Delay](
	[DelayCode] [varchar](5) NOT NULL,
	[DelayName] [varchar](250) NOT NULL,
	[FunctionalAreaID] [bigint] NOT NULL,
	[UnderControl] [bit] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Delay_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Delay_DelayCode] PRIMARY KEY CLUSTERED 
(
	[DelayCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[DrinkingWater]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[DrinkingWater]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[DrinkingWater](
	[DrinkingWaterID] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[DrinkingWaterName] [varchar](100) NOT NULL,
	[Value] [numeric](10, 2) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_DrinkingWater_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_DrinkingWater] PRIMARY KEY CLUSTERED 
(
	[DrinkingWaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[FuelConcept]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[FuelConcept]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[FuelConcept](
	[FuelConceptID] [bigint] IDENTITY(1,1) NOT NULL,
	[FuelConceptName] [varchar](60) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_FuelConcep_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_FuelConcept_FuelConceptID] PRIMARY KEY CLUSTERED 
(
	[FuelConceptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[FuelConceptType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[FuelConceptType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[FuelConceptType](
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[FuelConceptTypeName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_FuelConcepType_FuelConcepTypeID] PRIMARY KEY CLUSTERED 
(
	[FuelConceptTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Gpu]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Gpu]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Gpu](
	[GpuCode] [varchar](50) NOT NULL,
	[GpuName] [varchar](150) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Apu_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Gpu_GpuCode] PRIMARY KEY CLUSTERED 
(
	[GpuCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[GpuObservation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[GpuObservation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[GpuObservation](
	[GpuObservationCode] [varchar](10) NOT NULL,
	[GpuObservationCodeName] [varchar](150) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_ApuObservation_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_GpuObservation_GpuObservationCode] PRIMARY KEY CLUSTERED 
(
	[GpuObservationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[JetFuelTicket]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[JetFuelTicket](
	[JetFuelTicketID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[OperationTypeName] [varchar](20) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[FuelingDate] [datetime] NOT NULL,
	[FuelingTime] [time](7) NOT NULL,
	[JetFuelProviderNumber] [varchar](10) NOT NULL,
	[IntoPlaneProviderNumber] [varchar](10) NOT NULL,
	[TicketNumber] [varchar](10) NOT NULL,
	[FueledQtyGals] [int] NOT NULL,
	[RemainingQry] [int] NULL,
	[RequestedQry] [int] NULL,
	[FueledQry] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[AorUserID] [int] NOT NULL,
	[SupplierResponsible] [varchar](150) NULL,
	[Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_JetFuelTicket] PRIMARY KEY CLUSTERED 
(
	[JetFuelTicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[ManifestTimeConfig]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[ManifestTimeConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[ManifestTimeConfig](
	[ManifestTimeConfigID] [bigint] IDENTITY(1,1) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[ArrivalMinutesMin] [numeric](10, 2) NOT NULL,
	[ArrivalMinutesMax] [numeric](10, 2) NOT NULL,
	[DepartureMinutesMin] [numeric](10, 2) NOT NULL,
	[DepartureMinutesMax] [numeric](10, 2) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_ManifestTimeConfig_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ManifestTimeConfig] PRIMARY KEY CLUSTERED 
(
	[ManifestTimeConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[NationalJetFuelTicket]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[NationalJetFuelTicket](
	[NationalJetFuelTicketID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[OperationTypeName] [varchar](20) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[FuelingDateStart] [datetime] NOT NULL,
	[FuelingTimeStart] [time](7) NOT NULL,
	[FuelingDateEnd] [datetime] NOT NULL,
	[FuelingTimeEnd] [time](7) NOT NULL,
	[ApronPosition] [varchar](8) NOT NULL,
	[JetFuelProviderNumber] [varchar](10) NOT NULL,
	[IntoPlaneProviderNumber] [varchar](10) NOT NULL,
	[TicketNumber] [varchar](10) NOT NULL,
	[FueledQtyLts] [int] NOT NULL,
	[RemainingQtyKgs] [int] NULL,
	[RequestedQtyKgs] [int] NULL,
	[FueledQtyKgs] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[AorUserID] [int] NOT NULL,
	[SupplierResponsible] [varchar](150) NULL,
	[Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_NationalJetFuelTicket] PRIMARY KEY CLUSTERED 
(
	[NationalJetFuelTicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[PassengerInformation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[PassengerInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[PassengerInformation](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[AdultsCabinA] [int] NOT NULL,
	[AdultsCabinB] [int] NOT NULL,
	[TeenageCabinA] [int] NOT NULL,
	[TeenageCabinB] [int] NOT NULL,
	[ChildrenCabinA] [int] NOT NULL,
	[ChildrenCabinB] [int] NOT NULL,
	[LocalAdults] [int] NOT NULL,
	[LocalTeenage] [int] NOT NULL,
	[LocalChildren] [int] NOT NULL,
	[TransitoryAdults] [int] NOT NULL,
	[TransitoryTeenage] [int] NOT NULL,
	[TransitoryChildren] [int] NOT NULL,
	[ConnectionAdults] [int] NOT NULL,
	[ConnectionTeenage] [int] NOT NULL,
	[ConnectionChildren] [int] NOT NULL,
	[Diplomatic] [int] NOT NULL,
	[ExtraCrew] [int] NOT NULL,
	[Other] [int] NOT NULL,
	[LocalBaggageQuantity] [int] NOT NULL,
	[TransitoryBaggageQuantity] [int] NOT NULL,
	[ConnectionBaggageQuantity] [int] NOT NULL,
	[DiplomaticBaggageQuantity] [int] NOT NULL,
	[ExtraCrewBaggageQuantity] [int] NOT NULL,
	[OtherBaggageQuantity] [int] NOT NULL,
	[LocalBaggageWeight] [int] NOT NULL,
	[TransitoryBaggageWeight] [int] NOT NULL,
	[ConnectionBaggageWeight] [int] NOT NULL,
	[DiplomaticBaggageWeight] [int] NOT NULL,
	[ExtraCrewBaggageWeight] [int] NOT NULL,
	[OtherBaggageWeight] [int] NOT NULL,
	[Observation] [varchar](100) NOT NULL,
	[InternationalTUA] [int] NULL,
	[UserID] [int] NOT NULL,
	[PreviousSequence] [int] NULL,
	[PreviousAirlineCode] [varchar](3) NULL,
	[PreviousFlightNumber] [varchar](5) NULL,
	[PreviousItineraryKey] [varchar](8) NULL,
 CONSTRAINT [PK_PassengerInformation] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Airport].[Service]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Airport].[Service]') AND type in (N'U'))
BEGIN
CREATE TABLE [Airport].[Service](
	[ServiceCode] [varchar](12) NOT NULL,
	[ServiceName] [varchar](150) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Service_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Service_ServiceCode] PRIMARY KEY CLUSTERED 
(
	[ServiceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[AircraftWeightType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[AircraftWeightType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[AircraftWeightType](
	[AircraftWeightCode] [varchar](5) NOT NULL,
	[AircraftWeightName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AircraftWeightType] PRIMARY KEY CLUSTERED 
(
	[AircraftWeightCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[AircraftWeightUomType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[AircraftWeightUomType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[AircraftWeightUomType](
	[AircraftWeightUomID] [int] NOT NULL,
	[AircraftWeightUomName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AircraftWeightUomType] PRIMARY KEY CLUSTERED 
(
	[AircraftWeightUomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ChargeFactorType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ChargeFactorType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ChargeFactorType](
	[ChargeFactorTypeID] [int] NOT NULL,
	[ChargeFactorTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ChargeFactorType] PRIMARY KEY CLUSTERED 
(
	[ChargeFactorTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[Country]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[Country](
	[CountryCode] [varchar](3) NOT NULL,
	[CountryCodeShort] [varchar](2) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Country_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Country_CountryCode] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[FunctionalArea]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[FunctionalArea]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[FunctionalArea](
	[FunctionalAreaID] [bigint] IDENTITY(1,1) NOT NULL,
	[FunctionalAreaName] [varchar](100) NOT NULL,
	[FunctionalAreaDescription] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_FunctionalArea_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_FunctionalArea_FunctionalAreaID] PRIMARY KEY CLUSTERED 
(
	[FunctionalAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[MovementType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[MovementType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[MovementType](
	[MovementTypeCode] [varchar](5) NOT NULL,
	[MovementDescription] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_MovementType] PRIMARY KEY CLUSTERED 
(
	[MovementTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[OperationType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[OperationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[OperationType](
	[OperationTypeID] [int] NOT NULL,
	[OperationName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_OperationType] PRIMARY KEY CLUSTERED 
(
	[OperationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ReconciliationTolerance]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ReconciliationTolerance](
	[ServiceCode] [varchar](12) NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[ToleranceTypeCode] [varchar](10) NOT NULL,
	[ToleranceValue] [numeric](8, 2) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ReconciliationTolerance] PRIMARY KEY CLUSTERED 
(
	[ServiceCode] ASC,
	[CurrencyCode] ASC,
	[ToleranceTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ScheduleType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ScheduleType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ScheduleType](
	[ScheduleTypeCode] [varchar](3) NOT NULL,
	[ScheduleTypeName] [varchar](30) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ScheduleType] PRIMARY KEY CLUSTERED 
(
	[ScheduleTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ServiceCalculationType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ServiceCalculationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ServiceCalculationType](
	[CalculationTypeID] [int] NOT NULL,
	[CalculationTypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ServiceCalculationType] PRIMARY KEY CLUSTERED 
(
	[CalculationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ServiceType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ServiceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ServiceType](
	[ServiceTypeCode] [varchar](1) NOT NULL,
	[ServiceTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ServiceTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[StatusOnBoard]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[StatusOnBoard]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[StatusOnBoard](
	[StatusOnBoardCode] [varchar](5) NOT NULL,
	[StatusOnBoardName] [varchar](5) NOT NULL,
 CONSTRAINT [PK_StatusOnBoard] PRIMARY KEY CLUSTERED 
(
	[StatusOnBoardCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Catalog].[ToleranceType]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Catalog].[ToleranceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Catalog].[ToleranceType](
	[ToleranceTypeCode] [varchar](10) NOT NULL,
	[ToleranceTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ToleranceType] PRIMARY KEY CLUSTERED 
(
	[ToleranceTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[AccountingAccount]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[AccountingAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[AccountingAccount](
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[AccountingAccountName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_AccountingAccount_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_AccountingAccount_AccountingAccountNumber] PRIMARY KEY CLUSTERED 
(
	[AccountingAccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[AirportServiceContract]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[AirportServiceContract](
	[EffectiveDate] [datetime] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[CCNumber] [varchar](14) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_AirportServiceContract_Status]  DEFAULT ((1)),
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[ServiceTypeCode] [varchar](1) NOT NULL,
	[PortFeeCode] [varchar](8) NULL,
	[PortFeeValue] [numeric](7, 2) NULL,
	[PortFeeFlag] [bit] NULL,
	[LocalTaxCode] [varchar](8) NULL,
	[LocalTaxValue] [numeric](7, 2) NULL,
	[LocalTaxFlag] [bit] NULL,
	[StateTaxCode] [varchar](8) NULL,
	[StateTaxValue] [numeric](7, 2) NULL,
	[StateTaxFlag] [bit] NULL,
	[FederalTaxCode] [varchar](8) NULL,
	[FederalTaxValue] [numeric](7, 2) NULL,
	[FederalTaxFlag] [bit] NULL,
	[AircraftWeightFlag] [bit] NOT NULL,
	[AircraftWeightCode] [varchar](5) NULL,
	[AircraftWeightUomID] [int] NULL,
	[AircraftWeightMultiple] [bigint] NULL,
	[MultiRateFlag] [bit] NULL,
	[Rate] [numeric](18, 5) NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[ServiceRecordFlag] [bit] NOT NULL,
	[CalculationTypeID] [int] NOT NULL,
	[EndDateContract] [datetime] NULL,
 CONSTRAINT [PK_AirportServiceContract] PRIMARY KEY CLUSTERED 
(
	[EffectiveDate] ASC,
	[AirlineCode] ASC,
	[StationCode] ASC,
	[ServiceCode] ASC,
	[ProviderNumber] ASC,
	[CCNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[CostCenter]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[CostCenter]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[CostCenter](
	[CCNumber] [varchar](14) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[CCName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_CostCenter_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_CostCenter_CECONumber] PRIMARY KEY CLUSTERED 
(
	[CCNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[Currency]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[Currency]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[Currency](
	[CurrencyCode] [varchar](3) NOT NULL,
	[CurrencyName] [varchar](40) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Currency_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Currency_CurrencyCode] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[ExchangeRates]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[ExchangeRates]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[ExchangeRates](
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[Rate] [numeric](18, 5) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ExchangeRates] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[Month] ASC,
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[InternationalFuelContract]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[InternationalFuelContract](
	[EffectiveDate] [datetime] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[AircraftRegistCCFlag] [bit] NOT NULL,
	[CCNumber] [varchar](14) NULL,
	[Status] [bit] NOT NULL,
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[EndDateContract] [datetime] NULL,
 CONSTRAINT [PK_InternationalFuelContract_1] PRIMARY KEY CLUSTERED 
(
	[EffectiveDate] ASC,
	[AirlineCode] ASC,
	[StationCode] ASC,
	[ServiceCode] ASC,
	[ProviderNumberPrimary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[InternationalFuelContractConcept]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[InternationalFuelContractConcept](
	[InternationalFuelContractConceptID] [bigint] IDENTITY(1,1) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[FuelConceptID] [bigint] NOT NULL,
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[ChargeFactorTypeID] [int] NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_InternationalFuelContractConcept] PRIMARY KEY CLUSTERED 
(
	[InternationalFuelContractConceptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[InternationalFuelRate]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[InternationalFuelRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[InternationalFuelRate](
	[InternationalFuelRateID] [bigint] IDENTITY(1,1) NOT NULL,
	[InternationalFuelContractConceptID] [bigint] NOT NULL,
	[RateStartDate] [datetime] NOT NULL,
	[RateEndDate] [datetime] NOT NULL,
	[Rate] [numeric](18, 5) NOT NULL,
 CONSTRAINT [PK_InternationalFuelRate_1] PRIMARY KEY CLUSTERED 
(
	[InternationalFuelRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Finance].[LiabilityAccount]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[LiabilityAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[LiabilityAccount](
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_LiabilityAccount_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_LiabilityAccount_LiabilityAccountNumber] PRIMARY KEY CLUSTERED 
(
	[LiabilityAccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[NationalFuelContract]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[NationalFuelContract](
	[EffectiveDate] [datetime] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[AircraftRegistCCFlag] [bit] NOT NULL,
	[CCNumber] [varchar](14) NULL,
	[Status] [bit] NOT NULL,
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[FederalTaxCode] [varchar](8) NOT NULL,
	[FederalTaxValue] [decimal](7, 2) NOT NULL,
	[FederalTaxFlag] [bit] NOT NULL,
 CONSTRAINT [PK_NationalFuelContract] PRIMARY KEY CLUSTERED 
(
	[EffectiveDate] ASC,
	[AirlineCode] ASC,
	[StationCode] ASC,
	[ServiceCode] ASC,
	[ProviderNumberPrimary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[NationalFuelContractConcept]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[NationalFuelContractConcept](
	[NationalFuelContractConceptID] [bigint] IDENTITY(1,1) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[FuelConceptID] [bigint] NOT NULL,
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[ChargeFactorTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Finance.NationalFuelConceptContract] PRIMARY KEY CLUSTERED 
(
	[NationalFuelContractConceptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[NationalFuelRate]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[NationalFuelRate](
	[NationalRateID] [bigint] IDENTITY(1,1) NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[EffectiveStartDate] [date] NOT NULL,
	[EffectiveEndDate] [date] NOT NULL,
	[ScheduleTypeCode] [varchar](3) NOT NULL,
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[RateValue] [numeric](8, 6) NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
 CONSTRAINT [PK_NationalFuelRate] PRIMARY KEY CLUSTERED 
(
	[NationalRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[Provider]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[Provider]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[Provider](
	[ProviderNumber] [varchar](10) NOT NULL,
	[ProviderName] [varchar](150) NOT NULL,
	[ProviderShortName] [varchar](15) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Provider_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Provider_ProviderNumber] PRIMARY KEY CLUSTERED 
(
	[ProviderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Finance].[Tax]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[Tax]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[Tax](
	[TaxCode] [varchar](8) NOT NULL,
	[TaxName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Tax_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Tax_TaxCode] PRIMARY KEY CLUSTERED 
(
	[TaxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[AdditionalArrivalInformation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[AdditionalArrivalInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[AdditionalArrivalInformation](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[Pilot] [int] NOT NULL,
	[Surcharge] [int] NOT NULL,
	[ExtraCrew] [int] NOT NULL,
	[TypeFlight] [varchar](10) NULL,
	[SlotAllocatedTime] [time](7) NULL,
	[SlotCoordinatedTime] [time](7) NULL,
	[OvernightEndTime] [time](7) NULL,
	[ManeuverStartTime] [time](7) NULL,
	[PositionOutputTime] [time](7) NULL,
	[DelayDescription1] [varchar](250) NULL,
	[DelayDescription2] [varchar](250) NULL,
	[DelayDescription3] [varchar](250) NULL,
 CONSTRAINT [PK_AdditionalArrivalInformation] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[AdditionalDepartureInformation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[AdditionalDepartureInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[AdditionalDepartureInformation](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[Pilot] [int] NOT NULL,
	[Surcharge] [int] NOT NULL,
	[ExtraCrew] [int] NOT NULL,
	[TypeFlight] [varchar](10) NULL,
	[SlotAllocatedTime] [time](7) NULL,
	[SlotCoordinatedTime] [time](7) NULL,
	[OvernightEndTime] [time](7) NULL,
	[ManeuverStartTime] [time](7) NULL,
	[PositionOutputTime] [time](7) NULL,
	[DelayDescription1] [varchar](250) NULL,
	[DelayDescription2] [varchar](250) NULL,
	[DelayDescription3] [varchar](250) NULL,
 CONSTRAINT [PK_AdditionalDepartureInformation] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[GendecArrival]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[GendecArrival]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[GendecArrival](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[TotalPax] [int] NULL,
	[TotalCrew] [int] NULL,
	[BlockTime] [time](7) NULL,
	[ManifestNumber] [varchar](8) NULL,
	[GateNumber] [varchar](8) NULL,
	[ActualTimeOfArrival] [time](7) NULL,
	[ArrivalPlace] [varchar](3) NULL,
	[Disembanking] [time](7) NULL,
	[FlightArrivalDescription] [varchar](10) NULL,
	[Member] [int] NOT NULL,
	[AuthorizedAgent] [varchar](100) NULL,
	[Remarks] [text] NULL,
	[Closed] [bit] NOT NULL,
 CONSTRAINT [PK_GendecArrival_1] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[GendecArrivalCrew]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[GendecArrivalCrew]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[GendecArrivalCrew](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[CrewID] [bigint] NOT NULL,
 CONSTRAINT [PK_GendecArrivalCrew_1] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC,
	[CrewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[GendecDeparture]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[GendecDeparture]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[GendecDeparture](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[TotalPax] [int] NULL,
	[TotalCrew] [int] NULL,
	[BlockTime] [time](7) NULL,
	[ManifestNumber] [varchar](8) NULL,
	[GateNumber] [varchar](8) NULL,
	[ActualTimeOfDeparture] [time](7) NULL,
	[DeparturePlace] [varchar](3) NULL,
	[Embarking] [time](7) NULL,
	[FlightDepartureDescription] [varchar](10) NULL,
	[Member] [int] NOT NULL,
	[AuthorizedAgent] [varchar](100) NULL,
	[Remarks] [text] NULL,
	[Closed] [bit] NOT NULL,
 CONSTRAINT [PK_GendecDeparture_1] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[GendecDepartureCrew]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[GendecDepartureCrew]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[GendecDepartureCrew](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[CrewID] [bigint] NOT NULL,
 CONSTRAINT [PK_GendecDepartureCrew_1] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC,
	[CrewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[Itinerary]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[Itinerary]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[Itinerary](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[DepartureStation] [varchar](3) NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[ArrivalStation] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Itinerary] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ItineraryLog]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ItineraryLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ItineraryLog](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[DepartureStation] [varchar](3) NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[ArrivalStation] [varchar](3) NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Remarks] [varchar](250) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestArrival]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestArrival]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestArrival](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[NickNameCommander] [varchar](50) NOT NULL,
	[NickNameFirstOfficial] [varchar](50) NOT NULL,
	[NickNameSecondOfficial] [varchar](50) NULL,
	[NickNameThirdOfficial] [varchar](50) NULL,
	[NickNameChiefCabinet] [varchar](50) NOT NULL,
	[NickNameFirstSupercargo] [varchar](50) NOT NULL,
	[NickNameSecondSupercargo] [varchar](50) NOT NULL,
	[NickNameThirdSupercargo] [varchar](50) NULL,
	[SupercargoRemarks] [varchar](150) NULL,
	[AdultPassenger] [int] NULL,
	[MinorPassenger] [int] NULL,
	[InfantPassenger] [int] NULL,
	[LuggageQuantity] [int] NULL,
	[KgsLuggage] [numeric](18, 5) NULL,
	[ChargeQuantity] [int] NULL,
	[KgsCharge] [numeric](18, 5) NULL,
	[MailQuantity] [int] NULL,
	[KgsMail] [numeric](18, 5) NULL,
	[DepartureStation] [varchar](3) NULL,
	[ArrivalStation] [varchar](3) NOT NULL,
	[LastScaleStation] [varchar](3) NOT NULL,
	[ActualArrivalDate] [datetime] NOT NULL,
	[DelayRemarks] [varchar](150) NULL,
	[Position] [varchar](50) NOT NULL,
	[JetFuelArrival] [numeric](18, 5) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Closed] [bit] NOT NULL,
	[UserIDSignature] [int] NOT NULL,
	[LicenceNumberSignature] [varchar](20) NOT NULL,
	[UserIDAuthorize] [int] NOT NULL,
	[LicenceNumberAuthorize] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ManifestArrival_1] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestArrivalDelay]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestArrivalDelay]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestArrivalDelay](
	[ManifestArrivalDelayID] [bigint] IDENTITY(1,1) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[Sequence] [int] NOT NULL,
	[DelayCode] [varchar](5) NOT NULL,
 CONSTRAINT [PK_ManifestArrivalDelay] PRIMARY KEY CLUSTERED 
(
	[ManifestArrivalDelayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestDeparture]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestDeparture]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestDeparture](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[NickNameCommander] [varchar](50) NOT NULL,
	[NickNameFirstOfficial] [varchar](50) NOT NULL,
	[NickNameSecondOfficial] [varchar](50) NULL,
	[NickNameThirdOfficial] [varchar](50) NULL,
	[NickNameChiefCabinet] [varchar](50) NOT NULL,
	[NickNameFirstSupercargo] [varchar](50) NOT NULL,
	[NickNameSecondSupercargo] [varchar](50) NOT NULL,
	[NickNameThirdSupercargo] [varchar](50) NULL,
	[SupercargoRemarks] [varchar](150) NULL,
	[DepartureStation] [varchar](3) NULL,
	[ScaleStation] [varchar](3) NOT NULL,
	[ArrivalStation] [varchar](3) NULL,
	[ActualDepartureDate] [datetime] NOT NULL,
	[DelayRemarks] [varchar](150) NULL,
	[InnerSection] [int] NOT NULL,
	[International] [int] NOT NULL,
	[InternationalExempt] [int] NOT NULL,
	[NationalExempt] [int] NOT NULL,
	[Transit] [int] NOT NULL,
	[Infant] [int] NOT NULL,
	[JetFuel] [numeric](18, 5) NOT NULL,
	[RealTakeoffWeight] [numeric](18, 5) NOT NULL,
	[OperatingWeight] [numeric](18, 5) NOT NULL,
	[SafetyMargin] [numeric](18, 5) NOT NULL,
	[StructuralTakeoffWeight] [numeric](18, 5) NOT NULL,
	[UserIDSignature] [int] NOT NULL,
	[LicenceNumberSignature] [varchar](20) NOT NULL,
	[UserIDAuthorize] [int] NOT NULL,
	[LicenceNumberAuthorize] [varchar](20) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[InfantsTickets] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [varchar](5) NOT NULL,
	[Closed] [bit] NOT NULL,
 CONSTRAINT [PK_ManifestDeparture] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestDepartureBoarding]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoarding]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestDepartureBoarding](
	[BoardingID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[Position] [int] NOT NULL,
	[Station] [varchar](3) NOT NULL,
	[PassengerAdult] [int] NULL,
	[PassengerMinor] [int] NULL,
	[PassengerInfant] [int] NULL,
	[LuggageQuantity] [int] NULL,
	[LuggageKgs] [numeric](18, 5) NULL,
	[ChargeQuantity] [int] NULL,
	[ChargeKgs] [numeric](18, 5) NULL,
	[MailQuantity] [int] NULL,
	[MailKgs] [numeric](18, 5) NULL,
 CONSTRAINT [PK_ManifestDepartureBoarding] PRIMARY KEY CLUSTERED 
(
	[BoardingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestDepartureBoardingDetail]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestDepartureBoardingDetail](
	[BoardingDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[BoardingID] [bigint] NOT NULL,
	[CompartmentTypeID] [int] NOT NULL,
	[LuggageQuantity] [int] NULL,
	[LuggageKgs] [numeric](18, 5) NULL,
	[ChargeQuantity] [int] NULL,
	[ChargeKgs] [numeric](18, 5) NULL,
	[Remarks] [varchar](300) NULL,
	[RampResponsible] [varchar](200) NULL,
	[AorUserID] [int] NOT NULL,
 CONSTRAINT [PK_ManifestDepartureBoardingDetail] PRIMARY KEY CLUSTERED 
(
	[BoardingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[ManifestDepartureBoardingInformation]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestDepartureBoardingInformation](
	[BoardingInformationID] [bigint] IDENTITY(1,1) NOT NULL,
	[BoardingID] [bigint] NOT NULL,
	[CompartmentTypeInformationID] [int] NOT NULL,
	[CompartmentTypeID] [int] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK_ManifestDepartureBoardingInformation_1] PRIMARY KEY CLUSTERED 
(
	[BoardingInformationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Itinerary].[ManifestDepartureDelay]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureDelay]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[ManifestDepartureDelay](
	[ManifestDepartureDelayID] [bigint] IDENTITY(1,1) NOT NULL,
	[DelayCode] [varchar](5) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
 CONSTRAINT [PK_ManifestDepartureDelay] PRIMARY KEY CLUSTERED 
(
	[ManifestDepartureDelayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[Timeline]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[Timeline]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[Timeline](
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[PreviousSequence] [int] NULL,
	[PreviousAirlineCode] [varchar](3) NULL,
	[PreviousFlightNumber] [varchar](5) NULL,
	[PreviousItineraryKey] [varchar](8) NULL,
	[NextSequence] [int] NULL,
	[NextAirlineCode] [varchar](3) NULL,
	[NextFlightNumber] [varchar](5) NULL,
	[NextItineraryKey] [varchar](8) NULL,
	[SpecialCase] [bit] NOT NULL CONSTRAINT [DF_Timeline_SpecialCase]  DEFAULT ((0)),
 CONSTRAINT [PK_Timeline] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[AirlineCode] ASC,
	[FlightNumber] ASC,
	[ItineraryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Itinerary].[TimelineMovement]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]') AND type in (N'U'))
BEGIN
CREATE TABLE [Itinerary].[TimelineMovement](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[MovementTypeCode] [varchar](5) NOT NULL,
	[MovementDate] [datetime] NOT NULL,
	[Position] [varchar](50) NULL,
	[ProviderNumber] [varchar](10) NULL,
	[RemainingFuel] [decimal](18, 5) NULL,
	[Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_TimelineMovement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[CalculationStatus]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[CalculationStatus](
	[CalculationStatusCode] [varchar](5) NOT NULL,
	[CalculationStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CalculationStatus] PRIMARY KEY CLUSTERED 
(
	[CalculationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[ConfirmationStatus]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[ConfirmationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[ConfirmationStatus](
	[ConfirmationStatusCode] [varchar](5) NOT NULL,
	[ConfirmationStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ConfirmationStatus] PRIMARY KEY CLUSTERED 
(
	[ConfirmationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[DocumentStatus]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DocumentStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[DocumentStatus](
	[DocumentStatusCode] [varchar](4) NOT NULL,
	[DocumentStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DocumentStatus] PRIMARY KEY CLUSTERED 
(
	[DocumentStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[JetFuelLogError]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelLogError]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[JetFuelLogError](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [varchar](30) NOT NULL,
	[LineNumber] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[OperationTypeID] [int] NULL,
	[JetFuelTicketID] [bigint] NULL,
	[FuelingDate] [date] NULL,
	[TicketNumber] [varchar](10) NULL,
	[FueledQtyGals] [int] NULL,
	[ServiceCode] [varchar](12) NULL,
	[ProviderNumberPrimary] [varchar](10) NULL,
	[InternationalFuelContractConceptID] [bigint] NULL,
	[FuelConceptID] [bigint] NULL,
	[FuelConceptTypeCode] [varchar](5) NULL,
	[ChargeFactorTypeID] [int] NULL,
	[ProviderNumber] [varchar](10) NULL,
	[Rate] [numeric](18, 5) NULL,
 CONSTRAINT [PK_JetFuelLogError] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[JetFuelPolicy]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelPolicy]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[JetFuelPolicy](
	[PolicyResultID] [bigint] IDENTITY(1,1) NOT NULL,
	[PolicyID] [bigint] NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[JetFuelTicketID] [bigint] NULL,
	[TPREC] [varchar](50) NULL,
	[IDREG] [varchar](12) NULL,
	[BLDAT] [varchar](10) NULL,
	[BLART] [varchar](2) NULL,
	[BUKRS] [varchar](8) NULL,
	[BUDAT] [varchar](10) NULL,
	[WAERS] [varchar](5) NULL,
	[KURSF] [money] NULL,
	[XBLNR] [varchar](16) NULL,
	[BKTXT] [varchar](25) NULL,
	[NEWBS] [varchar](2) NULL,
	[NEWKO] [varchar](17) NULL,
	[NEWUM] [varchar](1) NULL,
	[NEWBK] [varchar](4) NULL,
	[WRBTR] [money] NULL,
	[DMBE2] [money] NULL,
	[MWSKZ] [varchar](2) NULL,
	[XMWST] [varchar](1) NULL,
	[GSBER] [varchar](4) NULL,
	[KOSTL] [varchar](10) NULL,
	[AUFNR] [varchar](12) NULL,
	[PRCTR] [varchar](10) NULL,
	[FKBER] [varchar](16) NULL,
	[SEGMENT] [varchar](1) NULL,
	[WERKS] [varchar](4) NULL,
	[FISTL] [varchar](16) NULL,
	[ZFBDT] [varchar](10) NULL,
	[VALUT] [varchar](10) NULL,
	[ZUONR] [varchar](18) NULL,
	[SGTXT] [varchar](50) NULL,
	[MENGE] [money] NULL,
	[MEINS] [varchar](3) NULL,
	[GEBER] [varchar](10) NULL,
	[NOTOTAL] [varchar](6) NULL,
	[LIFNR] [varchar](10) NULL,
	[KUNNR] [varchar](10) NULL,
	[ANRED] [varbinary](15) NULL,
	[NAME1] [varchar](35) NULL,
	[NAME2] [varchar](35) NULL,
	[NAME3] [varchar](35) NULL,
	[BANKL] [varchar](15) NULL,
	[BANKN] [varchar](18) NULL,
	[ZLSCH] [varchar](1) NULL,
	[BKREF] [varchar](20) NULL,
	[BELNR] [varchar](10) NULL,
	[XBLNR2] [varchar](16) NULL,
	[MENV] [varchar](2) NULL,
	[MSGID] [varchar](20) NULL,
	[RFCLOG] [text] NULL,
 CONSTRAINT [PK_JetFuelComplementPolicy] PRIMARY KEY CLUSTERED 
(
	[PolicyResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[JetFuelPolicyControl]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelPolicyControl]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[JetFuelPolicyControl](
	[PolicyID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[ServiceCodes] [varchar](max) NOT NULL,
	[ProviderCodes] [varchar](max) NOT NULL,
	[AirportCodes] [varchar](max) NOT NULL,
	[StartDateReal] [date] NOT NULL,
	[EndDateReal] [date] NOT NULL,
	[StartDateComplementary] [date] NOT NULL,
	[EndDateComplementary] [date] NOT NULL,
	[DateBaseline] [date] NOT NULL,
	[DateValue] [date] NOT NULL,
	[DatePosting] [date] NOT NULL,
	[HeaderText] [varchar](100) NOT NULL,
	[ItemText] [varchar](100) NULL,
	[SendByUserName] [nvarchar](50) NULL,
	[ConfirmedByUserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_JetFuelPolicyControl] PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[JetFuelProcess]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelProcess]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[JetFuelProcess](
	[PeriodCode] [varchar](30) NOT NULL,
	[StartDatePeriod] [date] NOT NULL,
	[EndDatePeriod] [date] NOT NULL,
	[StatusProcessCode] [varchar](5) NULL CONSTRAINT [DF_JetFuelProcess_StatusProcessCode]  DEFAULT ('NEW'),
	[ProcessProgress] [numeric](5, 2) NULL,
	[StartDateProcess] [datetime] NULL,
	[EndDateProcess] [datetime] NULL,
	[ProcessedByUserName] [nvarchar](50) NULL,
	[CalculationStatusCode] [varchar](5) NULL CONSTRAINT [DF_JetFuelProcess_CalculationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationStatusCode] [varchar](5) NULL CONSTRAINT [DF_JetFuelProcess_ConfirmationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationDate] [datetime] NULL,
	[ConfirmedByUserName] [nvarchar](50) NULL,
	[RecordsToProcess] [int] NULL,
	[RecordsProcessed] [int] NULL,
 CONSTRAINT [PK_InternationalFuelProcess] PRIMARY KEY CLUSTERED 
(
	[PeriodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[JetFuelProvision]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelProvision]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[JetFuelProvision](
	[ProvisionID] [bigint] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [varchar](30) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[JetFuelTicketID] [bigint] NOT NULL,
	[FuelingDate] [datetime] NOT NULL,
	[FuelingTime] [time](7) NOT NULL,
	[ApronPosition] [varchar](8) NULL,
	[TicketNumber] [varchar](10) NOT NULL,
	[FueledQtyGals] [int] NOT NULL,
	[RemainingQry] [int] NULL,
	[RequestedQry] [int] NULL,
	[FueledQry] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[CCNumber] [varchar](12) NOT NULL,
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[InternationalFuelContractConceptID] [bigint] NOT NULL,
	[FuelConceptID] [bigint] NOT NULL,
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[ChargeFactorTypeID] [int] NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[Rate] [numeric](18, 5) NOT NULL,
	[ConceptAmount] [numeric](18, 5) NOT NULL,
	[PolicyID] [bigint] NULL,
 CONSTRAINT [PK_JetFuelProvision] PRIMARY KEY CLUSTERED 
(
	[ProvisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelCost]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelCost]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelCost](
	[CostID] [bigint] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [varchar](30) NOT NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[OperationTypeID] [int] NOT NULL,
	[NationalJetFuelTicketID] [bigint] NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumberPrimary] [varchar](10) NOT NULL,
	[FuelingStartDate] [datetime] NOT NULL,
	[FuelingStartTime] [time](7) NOT NULL,
	[FuelingEndDate] [datetime] NOT NULL,
	[FuelingEndTime] [time](7) NOT NULL,
	[ApronPosition] [varchar](8) NULL,
	[TicketNumber] [varchar](10) NOT NULL,
	[FueledQtyLts] [int] NOT NULL,
	[RemainingQtyKgs] [int] NULL,
	[RequestedQtyKgs] [int] NULL,
	[FueledQtyKgs] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[NationalFuelContractConceptID] [bigint] NOT NULL,
	[FuelConceptID] [bigint] NOT NULL,
	[FuelConceptTypeCode] [varchar](5) NOT NULL,
	[ChargeFactorTypeID] [int] NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[ScheduleTypeCode] [varchar](3) NOT NULL,
	[Rate] [numeric](18, 5) NOT NULL,
	[ConceptAmount] [numeric](18, 5) NOT NULL,
	[FederalTaxCode] [varchar](8) NOT NULL,
	[FederalTaxValue] [decimal](7, 2) NOT NULL,
	[FederalTaxAmount] [decimal](8, 6) NOT NULL,
	[CCNumber] [varchar](12) NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[AccountingAccountNumber] [varchar](8) NOT NULL,
	[LiabilityAccountNumber] [varchar](8) NOT NULL,
	[PolicyID] [bigint] NULL,
	[ReconciliationStatus] [varchar](10) NULL,
	[InvoiceDetailID] [bigint] NULL,
 CONSTRAINT [PK_NationalJetFuelCost] PRIMARY KEY CLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelInvoiceControl]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelInvoiceControl](
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[AirlineCode] [varchar](3) NULL,
	[ProviderNumber] [varchar](8) NULL,
	[JetFuelAmount] [numeric](10, 2) NULL,
	[FreightAmount] [numeric](10, 2) NULL,
	[DiscountAmount] [numeric](10, 2) NULL,
	[FuelingAmount] [numeric](10, 2) NULL,
	[SubtotalAmount] [numeric](10, 2) NULL,
	[TaxAmount] [numeric](10, 2) NULL,
	[TotalAmount] [numeric](10, 2) NULL,
	[DocumentStatusCode] [varchar](4) NULL,
	[DateBaseline] [date] NULL,
	[DateValue] [date] NULL,
	[DatePosting] [date] NULL,
	[Society] [varchar](30) NULL,
	[ProcessDate] [date] NULL,
	[ReconciliationStatusCode] [varchar](30) NULL,
	[RemittanceStatusCode] [varchar](4) NULL,
	[CountRecords] [int] NULL,
	[CountReconciledRecords] [int] NULL,
	[ReconciledSubtotalAmount] [decimal](18, 5) NULL,
	[DateReconciled] [datetime] NULL,
	[StatusProcessCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelInvoiceControl_StatusProcessCode]  DEFAULT ('NEW'),
	[ProcessProgress] [numeric](5, 2) NULL,
	[StartDateProcess] [datetime] NULL,
	[EndDateProcess] [datetime] NULL,
	[ProcessedByUserName] [nvarchar](50) NULL,
	[CalculationStatusCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelInvoiceControl_CalculationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationStatusCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelInvoiceControl_ConfirmationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationDate] [datetime] NULL,
	[ConfirmedByUserName] [nvarchar](50) NULL,
	[RecordsToProcess] [int] NULL,
	[RecordsProcessed] [int] NULL,
	[CountNonconformityRecords] [int] NULL,
	[NonconformitySubtotalAmount] [decimal](18, 5) NULL,
	[DateNonconformity] [datetime] NULL,
	[NonconformityReference] [varchar](15) NULL,
	[NonconformityStatusCode] [varchar](6) NULL CONSTRAINT [DF_NationalJetFuelInvoiceControl_NonconfirmityStatusCode]  DEFAULT ('OPEN'),
 CONSTRAINT [PK_NationalJetFuelInvoiceControl] PRIMARY KEY CLUSTERED 
(
	[RemittanceID] ASC,
	[MonthYear] ASC,
	[Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelInvoiceDetail]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelInvoiceDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[AirlineCode] [varchar](3) NULL,
	[ProviderNumber] [varchar](50) NULL,
	[ServiceCode] [varchar](50) NULL,
	[FederalTaxCode] [varchar](50) NULL,
	[StationCode] [varchar](50) NULL,
	[InvoiceNumber] [varchar](255) NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[InvoiceDate] [datetime] NULL,
	[ElectronicInvoiceNumber] [varchar](50) NULL,
	[ElectronicInvoiceDate] [datetime] NULL,
	[ProductNumber] [varchar](50) NULL,
	[ProductDescription] [varchar](255) NULL,
	[TicketNumber] [varchar](255) NULL,
	[OperationType] [varchar](255) NULL,
	[FlightNumber] [varchar](100) NULL,
	[EquipmentNumber] [varchar](100) NULL,
	[AirplaneModel] [varchar](100) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[StartMeter] [decimal](18, 2) NULL,
	[EndMeter] [decimal](18, 2) NULL,
	[VolumeM3] [decimal](18, 3) NULL,
	[RateType] [varchar](255) NULL,
	[JetFuelAmount] [decimal](18, 2) NULL,
	[FreightAmount] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[FuelingAmount] [decimal](18, 2) NULL,
	[SubtotalAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[ErrorDescription] [varchar](5000) NULL,
	[Status] [varchar](20) NULL,
	[ReconciliationStatus] [varchar](10) NULL,
	[NonconformityFlag] [bit] NULL,
 CONSTRAINT [PK_NationalJetFuelInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelInvoicePolicy]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoicePolicy]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelInvoicePolicy](
	[PolicyResultID] [bigint] IDENTITY(1,1) NOT NULL,
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[TPREC] [varchar](50) NULL,
	[IDREG] [varchar](12) NULL,
	[BLDAT] [varchar](10) NULL,
	[BLART] [varchar](2) NULL,
	[BUKRS] [varchar](8) NULL,
	[BUDAT] [varchar](10) NULL,
	[WAERS] [varchar](5) NULL,
	[KURSF] [money] NULL,
	[XBLNR] [varchar](16) NULL,
	[BKTXT] [varchar](150) NULL,
	[NEWBS] [varchar](2) NULL,
	[NEWKO] [varchar](17) NULL,
	[NEWUM] [varchar](1) NULL,
	[NEWBK] [varchar](4) NULL,
	[WRBTR] [money] NULL,
	[DMBE2] [money] NULL,
	[MWSKZ] [varchar](2) NULL,
	[XMWST] [varchar](1) NULL,
	[GSBER] [varchar](4) NULL,
	[KOSTL] [varchar](10) NULL,
	[AUFNR] [varchar](12) NULL,
	[PRCTR] [varchar](10) NULL,
	[FKBER] [varchar](16) NULL,
	[SEGMENT] [varchar](1) NULL,
	[WERKS] [varchar](4) NULL,
	[FISTL] [varchar](16) NULL,
	[ZFBDT] [varchar](10) NULL,
	[VALUT] [varchar](10) NULL,
	[ZUONR] [varchar](18) NULL,
	[SGTXT] [varchar](150) NULL,
	[MENGE] [money] NULL,
	[MEINS] [varchar](3) NULL,
	[GEBER] [varchar](10) NULL,
	[NOTOTAL] [varchar](6) NULL,
	[LIFNR] [varchar](10) NULL,
	[KUNNR] [varchar](10) NULL,
	[ANRED] [varchar](15) NULL,
	[NAME1] [varchar](35) NULL,
	[NAME2] [varchar](35) NULL,
	[NAME3] [varchar](35) NULL,
	[BANKL] [varchar](15) NULL,
	[BANKN] [varchar](18) NULL,
	[ZLSCH] [varchar](1) NULL,
	[BKREF] [varchar](20) NULL,
	[BELNR] [varchar](10) NULL,
	[XBLNR2] [varchar](16) NULL,
	[MENV] [varchar](2) NULL,
	[MSGID] [varchar](20) NULL,
	[RFCLOG] [text] NULL,
 CONSTRAINT [PK_NationalJetFuelInvoicePolicy] PRIMARY KEY CLUSTERED 
(
	[PolicyResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelLogError]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelLogError]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelLogError](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [varchar](30) NOT NULL,
	[LineNumber] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[Sequence] [int] NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[FlightNumber] [varchar](5) NOT NULL,
	[ItineraryKey] [varchar](8) NOT NULL,
	[EquipmentNumber] [varchar](12) NOT NULL,
	[OperationTypeID] [int] NULL,
	[NationalJetFuelTicketID] [bigint] NULL,
	[ServiceCode] [varchar](12) NULL,
	[ProviderNumberPrimary] [varchar](10) NULL,
	[FuelingStartDate] [datetime] NULL,
	[FuelingStartTime] [time](7) NULL,
	[FuelingEndDate] [datetime] NULL,
	[FuelingEndTime] [time](7) NULL,
	[ApronPosition] [varchar](8) NULL,
	[TicketNumber] [varchar](10) NULL,
	[FueledQtyLts] [int] NULL,
	[RemainingQtyKgs] [int] NULL,
	[RequestedQtyKgs] [int] NULL,
	[FueledQtyKgs] [int] NULL,
	[DensityFactor] [numeric](8, 3) NULL,
	[NationalFuelContractConceptID] [bigint] NULL,
	[FuelConceptID] [bigint] NULL,
	[FuelConceptTypeCode] [varchar](5) NULL,
	[ChargeFactorTypeID] [int] NULL,
	[ProviderNumber] [varchar](10) NULL,
	[ScheduleTypeCode] [varchar](3) NULL,
	[Rate] [numeric](18, 5) NULL,
 CONSTRAINT [PK_NationalJetFuelLogError] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelNonconformityLoadLog]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelNonconformityLoadLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelNonconformityLoadLog](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[ID] [bigint] NOT NULL,
	[AirlineCode] [varchar](3) NULL,
	[ProviderNumber] [varchar](50) NULL,
	[ServiceCode] [varchar](50) NULL,
	[FederalTaxCode] [varchar](50) NULL,
	[StationCode] [varchar](50) NULL,
	[InvoiceNumber] [varchar](255) NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[InvoiceDate] [datetime] NULL,
	[ElectronicInvoiceNumber] [varchar](50) NULL,
	[ElectronicInvoiceDate] [datetime] NULL,
	[ProductNumber] [varchar](50) NULL,
	[ProductDescription] [varchar](255) NULL,
	[TicketNumber] [varchar](255) NULL,
	[OperationType] [varchar](255) NULL,
	[FlightNumber] [varchar](100) NULL,
	[EquipmentNumber] [varchar](100) NULL,
	[AirplaneModel] [varchar](100) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[StartMeter] [decimal](18, 2) NULL,
	[EndMeter] [decimal](18, 2) NULL,
	[VolumeM3] [decimal](18, 3) NULL,
	[RateType] [varchar](255) NULL,
	[JetFuelAmount] [decimal](18, 2) NULL,
	[FreightAmount] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[FuelingAmount] [decimal](18, 2) NULL,
	[SubtotalAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Status] [varchar](20) NULL,
	[ReconciliationStatus] [varchar](10) NULL,
	[InvoiceCostVariance] [numeric](18, 5) NULL,
	[ErrorDescription] [varchar](5000) NULL,
 CONSTRAINT [PK_NationalJetFuelNonconformityLoadLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelPolicy]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelPolicy]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelPolicy](
	[PolicyResultID] [bigint] IDENTITY(1,1) NOT NULL,
	[NationalPolicyID] [bigint] NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[NationalJetFuelTicketID] [bigint] NULL,
	[TPREC] [varchar](50) NULL,
	[IDREG] [varchar](12) NULL,
	[BLDAT] [varchar](10) NULL,
	[BLART] [varchar](2) NULL,
	[BUKRS] [varchar](8) NULL,
	[BUDAT] [varchar](10) NULL,
	[WAERS] [varchar](5) NULL,
	[KURSF] [money] NULL,
	[XBLNR] [varchar](16) NULL,
	[BKTXT] [varchar](25) NULL,
	[NEWBS] [varchar](2) NULL,
	[NEWKO] [varchar](17) NULL,
	[NEWUM] [varchar](1) NULL,
	[NEWBK] [varchar](4) NULL,
	[WRBTR] [money] NULL,
	[DMBE2] [money] NULL,
	[MWSKZ] [varchar](2) NULL,
	[XMWST] [varchar](1) NULL,
	[GSBER] [varchar](4) NULL,
	[KOSTL] [varchar](10) NULL,
	[AUFNR] [varchar](12) NULL,
	[PRCTR] [varchar](10) NULL,
	[FKBER] [varchar](16) NULL,
	[SEGMENT] [varchar](1) NULL,
	[WERKS] [varchar](4) NULL,
	[FISTL] [varchar](16) NULL,
	[ZFBDT] [varchar](10) NULL,
	[VALUT] [varchar](10) NULL,
	[ZUONR] [varchar](18) NULL,
	[SGTXT] [varchar](50) NULL,
	[MENGE] [money] NULL,
	[MEINS] [varchar](3) NULL,
	[GEBER] [varchar](10) NULL,
	[NOTOTAL] [varchar](6) NULL,
	[LIFNR] [varchar](10) NULL,
	[KUNNR] [varchar](10) NULL,
	[ANRED] [varbinary](15) NULL,
	[NAME1] [varchar](35) NULL,
	[NAME2] [varchar](35) NULL,
	[NAME3] [varchar](35) NULL,
	[BANKL] [varchar](15) NULL,
	[BANKN] [varchar](18) NULL,
	[ZLSCH] [varchar](1) NULL,
	[BKREF] [varchar](20) NULL,
	[BELNR] [varchar](10) NULL,
	[XBLNR2] [varchar](16) NULL,
	[MENV] [varchar](2) NULL,
	[MSGID] [varchar](20) NULL,
	[RFCLOG] [text] NULL,
 CONSTRAINT [PK_NationalJetFuelPolicy] PRIMARY KEY CLUSTERED 
(
	[PolicyResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelPolicyControl]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelPolicyControl]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelPolicyControl](
	[NationalPolicyID] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentType] [varchar](30) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[ServiceCodes] [varchar](max) NOT NULL,
	[ProviderCodes] [varchar](max) NOT NULL,
	[AirportCodes] [varchar](max) NOT NULL,
	[StartDateReal] [date] NOT NULL,
	[EndDateReal] [date] NOT NULL,
	[StartDateComplementary] [date] NOT NULL,
	[EndDateComplementary] [date] NOT NULL,
	[DateBaseline] [date] NOT NULL,
	[DateValue] [date] NOT NULL,
	[DatePosting] [date] NOT NULL,
	[HeaderText] [varchar](100) NOT NULL,
	[ItemText] [varchar](100) NULL,
	[SendByUserName] [nvarchar](50) NULL,
	[ConfirmedByUserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_NationalJetFuelPolicyControl] PRIMARY KEY CLUSTERED 
(
	[NationalPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelProcess]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelProcess](
	[PeriodCode] [varchar](30) NOT NULL,
	[StartDatePeriod] [date] NOT NULL,
	[EndDatePeriod] [date] NOT NULL,
	[StatusProcessCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelProcess_StatusProcessCode]  DEFAULT ('NEW'),
	[ProcessProgress] [numeric](5, 2) NULL,
	[StartDateProcess] [datetime] NULL,
	[EndDateProcess] [datetime] NULL,
	[ProcessedByUserName] [nvarchar](50) NULL,
	[CalculationStatusCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelProcess_CalculationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationStatusCode] [varchar](5) NULL CONSTRAINT [DF_NationalJetFuelProcess_ConfirmationStatusCode]  DEFAULT ('PEN'),
	[ConfirmationDate] [datetime] NULL,
	[ConfirmedByUserName] [nvarchar](50) NULL,
	[RecordsToProcess] [int] NULL,
	[RecordsProcessed] [int] NULL,
 CONSTRAINT [PK_NationalFuelProcess] PRIMARY KEY CLUSTERED 
(
	[PeriodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelReconciliationDetail]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelReconciliationDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NationalJetFuelReconciliationDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceDetailID] [bigint] NOT NULL,
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[InvoiceStationCode] [varchar](50) NOT NULL,
	[InvoiceNumber] [varchar](255) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[ElectronicInvoiceNumber] [varchar](50) NOT NULL,
	[ElectronicInvoiceDate] [datetime] NOT NULL,
	[InvoiceTicketNumber] [varchar](255) NOT NULL,
	[InvoiceFlightNumber] [varchar](100) NULL,
	[InvoiceEquipmentNumber] [varchar](100) NULL,
	[InvoiceVolumeM3] [decimal](18, 3) NULL,
	[InvoiceSubtotalAmount] [decimal](18, 2) NULL,
	[PeriodCode] [varchar](30) NULL,
	[CostTicketNumber] [varchar](10) NULL,
	[CostDepartureDate] [datetime] NULL,
	[CostFlightNumber] [varchar](5) NULL,
	[CostEquipmentNumber] [varchar](12) NULL,
	[DepartureStation] [varchar](3) NULL,
	[ArrivalStation] [varchar](3) NULL,
	[CostFueledQtyLts] [int] NULL,
	[CostConceptAmount] [numeric](18, 5) NULL,
	[InvoiceCostVariance] [numeric](18, 5) NULL,
	[ReconciliationType] [varchar](10) NULL,
	[ReconciliationStatus] [varchar](10) NULL,
 CONSTRAINT [PK_NationalJetFuelReconciliationDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[NationalJetFuelReconciliationManualLoadLog]    Script Date: 13/01/2017 01:42:07 p.m. ******/
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
/****** Object:  Table [Process].[NonconformityDocumentParameter]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NonconformityDocumentParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[NonconformityDocumentParameter](
	[AirlineCode] [varchar](3) NOT NULL,
	[ServiceCode] [varchar](12) NOT NULL,
	[ProviderNumber] [varchar](10) NOT NULL,
	[DocumentTitle] [varchar](200) NULL,
	[Receiver] [varchar](50) NULL,
	[ReceiverAddress] [varchar](200) NULL,
	[Location] [varchar](50) NULL,
	[OpeningText] [varchar](800) NULL,
	[ClosingText] [varchar](200) NULL,
	[Sender] [varchar](200) NULL,
	[CcSection] [varchar](300) NULL,
	[AirlineAddress] [varchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[RemittanceStatus]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[RemittanceStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[RemittanceStatus](
	[RemittanceStatusCode] [varchar](4) NOT NULL,
	[RemittanceStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RemittanceStatus] PRIMARY KEY CLUSTERED 
(
	[RemittanceStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Process].[Sequence]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[Sequence]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[Sequence](
	[Sequence] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [Process].[StatusProcess]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[StatusProcess]') AND type in (N'U'))
BEGIN
CREATE TABLE [Process].[StatusProcess](
	[StatusProcessCode] [varchar](5) NOT NULL,
	[StatusProcessName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusProcess] PRIMARY KEY CLUSTERED 
(
	[StatusProcessCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Department]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [varchar](10) NOT NULL,
	[DescriptionArea] [varchar](50) NOT NULL,
	[DescriptionDepartment] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyDepartment_DepartmentId] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Menu]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Menu](
	[MenuCode] [varchar](5) NOT NULL,
	[MenuName] [varchar](25) NOT NULL,
	[IsParent] [bit] NOT NULL,
	[ParentCode] [varchar](5) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Module]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Module]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Module](
	[ModuleCode] [varchar](10) NOT NULL,
	[ModuleName] [varchar](150) NOT NULL,
	[MenuCode] [varchar](5) NOT NULL,
	[ControllerName] [varchar](150) NULL,
 CONSTRAINT [PK_Module_ControlId] PRIMARY KEY CLUSTERED 
(
	[ModuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[ModulePermission]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ModulePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[ModulePermission](
	[ModuleCode] [varchar](10) NOT NULL,
	[PermissionCode] [varchar](10) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_ModulePermission_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED 
(
	[ModuleCode] ASC,
	[PermissionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[PageReport]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[PageReport]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[PageReport](
	[PageName] [varchar](100) NOT NULL,
	[PathReport] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_PageReport_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_PageReport] PRIMARY KEY CLUSTERED 
(
	[PageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Permission]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Permission](
	[PermissionCode] [varchar](10) NOT NULL,
	[PermissionName] [varchar](50) NULL,
 CONSTRAINT [PK_Privilege] PRIMARY KEY CLUSTERED 
(
	[PermissionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Profile]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Profile](
	[ProfileCode] [varchar](5) NOT NULL,
	[ProfileName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Profile_ProfileId] PRIMARY KEY CLUSTERED 
(
	[ProfileCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[ProfileRole]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[ProfileRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[ProfileRole](
	[ProfileCode] [varchar](5) NOT NULL,
	[RoleCode] [varchar](5) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_ProfileRole_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ProfileRole_1] PRIMARY KEY CLUSTERED 
(
	[ProfileCode] ASC,
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[Role]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[Role](
	[RoleCode] [varchar](5) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[RoleModulePermission]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[RoleModulePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[RoleModulePermission](
	[RoleCode] [varchar](5) NOT NULL,
	[ModuleCode] [varchar](10) NOT NULL,
	[PermissionCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_RoleModulePermission] PRIMARY KEY CLUSTERED 
(
	[RoleCode] ASC,
	[ModuleCode] ASC,
	[PermissionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[User]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[AirlineCode] [varchar](3) NOT NULL,
	[EmployeeNumber] [varchar](10) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PasswordEncripted] [nvarchar](50) NULL,
	[Name] [varchar](80) NOT NULL,
	[FirstName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NULL,
	[Email] [varchar](90) NULL,
	[DepartmentID] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserVolaris] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User_UserName] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserAirport]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserAirport]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserAirport](
	[UserID] [int] NOT NULL,
	[StationCode] [varchar](3) NOT NULL,
	[Principal] [bit] NOT NULL,
 CONSTRAINT [PK_UserAirport] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[StationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserModulePermission]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserModulePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserModulePermission](
	[UserID] [int] NOT NULL,
	[ModuleCode] [varchar](10) NOT NULL,
	[PermissionCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UserModulePermission] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ModuleCode] ASC,
	[PermissionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Security].[UserProfileRole]    Script Date: 13/01/2017 01:42:07 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Security].[UserProfileRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [Security].[UserProfileRole](
	[UserID] [int] NOT NULL,
	[ProfileCode] [varchar](5) NOT NULL,
	[RoleCode] [varchar](5) NOT NULL,
	[Principal] [bit] NOT NULL,
 CONSTRAINT [PK_UserProfileRole] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleCode] ASC,
	[ProfileCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AdditionalPassengerInformation_PassengerInformation]') AND parent_object_id = OBJECT_ID(N'[Airport].[AdditionalPassengerInformation]'))
ALTER TABLE [Airport].[AdditionalPassengerInformation]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalPassengerInformation_PassengerInformation] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Airport].[PassengerInformation] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AdditionalPassengerInformation_PassengerInformation]') AND parent_object_id = OBJECT_ID(N'[Airport].[AdditionalPassengerInformation]'))
ALTER TABLE [Airport].[AdditionalPassengerInformation] CHECK CONSTRAINT [FK_AdditionalPassengerInformation_PassengerInformation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airplane_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airplane]'))
ALTER TABLE [Airport].[Airplane]  WITH CHECK ADD  CONSTRAINT [FK_Airplane_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airplane_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airplane]'))
ALTER TABLE [Airport].[Airplane] CHECK CONSTRAINT [FK_Airplane_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airplane_AirplaneType_AirplaneModel]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airplane]'))
ALTER TABLE [Airport].[Airplane]  WITH CHECK ADD  CONSTRAINT [FK_Airplane_AirplaneType_AirplaneModel] FOREIGN KEY([AirplaneModel])
REFERENCES [Airport].[AirplaneType] ([AirplaneModel])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airplane_AirplaneType_AirplaneModel]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airplane]'))
ALTER TABLE [Airport].[Airplane] CHECK CONSTRAINT [FK_Airplane_AirplaneType_AirplaneModel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirplaneType_CompartmentTypeConfig]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirplaneType]'))
ALTER TABLE [Airport].[AirplaneType]  WITH CHECK ADD  CONSTRAINT [FK_AirplaneType_CompartmentTypeConfig] FOREIGN KEY([CompartmentTypeCode])
REFERENCES [Airport].[CompartmentType] ([CompartmentTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirplaneType_CompartmentTypeConfig]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirplaneType]'))
ALTER TABLE [Airport].[AirplaneType] CHECK CONSTRAINT [FK_AirplaneType_CompartmentTypeConfig]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airport_Country_CountryCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airport]'))
ALTER TABLE [Airport].[Airport]  WITH CHECK ADD  CONSTRAINT [FK_Airport_Country_CountryCode] FOREIGN KEY([CountryCode])
REFERENCES [Catalog].[Country] ([CountryCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Airport_Country_CountryCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Airport]'))
ALTER TABLE [Airport].[Airport] CHECK CONSTRAINT [FK_Airport_Country_CountryCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportSchedule_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportSchedule]'))
ALTER TABLE [Airport].[AirportSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AirportSchedule_Airport_StationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportSchedule_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportSchedule]'))
ALTER TABLE [Airport].[AirportSchedule] CHECK CONSTRAINT [FK_AirportSchedule_Airport_StationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportSchedule_ScheduleType_ScheduleTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportSchedule]'))
ALTER TABLE [Airport].[AirportSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AirportSchedule_ScheduleType_ScheduleTypeCode] FOREIGN KEY([ScheduleTypeCode])
REFERENCES [Catalog].[ScheduleType] ([ScheduleTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportSchedule_ScheduleType_ScheduleTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportSchedule]'))
ALTER TABLE [Airport].[AirportSchedule] CHECK CONSTRAINT [FK_AirportSchedule_ScheduleType_ScheduleTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_DrinkingWater]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_DrinkingWater] FOREIGN KEY([DrinkingWaterID])
REFERENCES [Airport].[DrinkingWater] ([DrinkingWaterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_DrinkingWater]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_DrinkingWater]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Gpu]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_Gpu] FOREIGN KEY([GpuCode])
REFERENCES [Airport].[Gpu] ([GpuCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Gpu]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_Gpu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_GpuObservation]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_GpuObservation] FOREIGN KEY([GpuObservationCode])
REFERENCES [Airport].[GpuObservation] ([GpuObservationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_GpuObservation]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_GpuObservation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Provider]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_Provider] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Provider]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_Provider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Service]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService]  WITH CHECK ADD  CONSTRAINT [FK_AirportService_Service] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_AirportService_Service]') AND parent_object_id = OBJECT_ID(N'[Airport].[AirportService]'))
ALTER TABLE [Airport].[AirportService] CHECK CONSTRAINT [FK_AirportService_Service]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_CompartmentTypeConfig_CompartmentType_CompartmentTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[CompartmentTypeConfig]'))
ALTER TABLE [Airport].[CompartmentTypeConfig]  WITH CHECK ADD  CONSTRAINT [FK_CompartmentTypeConfig_CompartmentType_CompartmentTypeCode] FOREIGN KEY([CompartmentTypeCode])
REFERENCES [Airport].[CompartmentType] ([CompartmentTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_CompartmentTypeConfig_CompartmentType_CompartmentTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[CompartmentTypeConfig]'))
ALTER TABLE [Airport].[CompartmentTypeConfig] CHECK CONSTRAINT [FK_CompartmentTypeConfig_CompartmentType_CompartmentTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_CompartmentTypeInformation_CompartmentType_CompartmentTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[CompartmentTypeInformation]'))
ALTER TABLE [Airport].[CompartmentTypeInformation]  WITH CHECK ADD  CONSTRAINT [FK_CompartmentTypeInformation_CompartmentType_CompartmentTypeCode] FOREIGN KEY([CompartmentTypeCode])
REFERENCES [Airport].[CompartmentType] ([CompartmentTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_CompartmentTypeInformation_CompartmentType_CompartmentTypeCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[CompartmentTypeInformation]'))
ALTER TABLE [Airport].[CompartmentTypeInformation] CHECK CONSTRAINT [FK_CompartmentTypeInformation_CompartmentType_CompartmentTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_Country_CountryOfResidence]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Crew_Country_CountryOfResidence] FOREIGN KEY([CountryOfResidence])
REFERENCES [Catalog].[Country] ([CountryCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_Country_CountryOfResidence]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew] CHECK CONSTRAINT [FK_Crew_Country_CountryOfResidence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_CrewType_CrewTypeID]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Crew_CrewType_CrewTypeID] FOREIGN KEY([CrewTypeID])
REFERENCES [Airport].[CrewType] ([CrewTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_CrewType_CrewTypeID]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew] CHECK CONSTRAINT [FK_Crew_CrewType_CrewTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_StatusOnBoard_StatusOnBoardCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Crew_StatusOnBoard_StatusOnBoardCode] FOREIGN KEY([StatusOnBoardCode])
REFERENCES [Catalog].[StatusOnBoard] ([StatusOnBoardCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Crew_StatusOnBoard_StatusOnBoardCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Crew]'))
ALTER TABLE [Airport].[Crew] CHECK CONSTRAINT [FK_Crew_StatusOnBoard_StatusOnBoardCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Delay_FunctionalArea_FunctionalAreaID]') AND parent_object_id = OBJECT_ID(N'[Airport].[Delay]'))
ALTER TABLE [Airport].[Delay]  WITH CHECK ADD  CONSTRAINT [FK_Delay_FunctionalArea_FunctionalAreaID] FOREIGN KEY([FunctionalAreaID])
REFERENCES [Catalog].[FunctionalArea] ([FunctionalAreaID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Delay_FunctionalArea_FunctionalAreaID]') AND parent_object_id = OBJECT_ID(N'[Airport].[Delay]'))
ALTER TABLE [Airport].[Delay] CHECK CONSTRAINT [FK_Delay_FunctionalArea_FunctionalAreaID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_DrinkingWater_Airplane_EquipmentNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[DrinkingWater]'))
ALTER TABLE [Airport].[DrinkingWater]  WITH CHECK ADD  CONSTRAINT [FK_DrinkingWater_Airplane_EquipmentNumber] FOREIGN KEY([EquipmentNumber])
REFERENCES [Airport].[Airplane] ([EquipmentNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_DrinkingWater_Airplane_EquipmentNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[DrinkingWater]'))
ALTER TABLE [Airport].[DrinkingWater] CHECK CONSTRAINT [FK_DrinkingWater_Airplane_EquipmentNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Gpu_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Gpu]'))
ALTER TABLE [Airport].[Gpu]  WITH CHECK ADD  CONSTRAINT [FK_Gpu_Airport_StationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_Gpu_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[Gpu]'))
ALTER TABLE [Airport].[Gpu] CHECK CONSTRAINT [FK_Gpu_Airport_StationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelTicket_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket] CHECK CONSTRAINT [FK_JetFuelTicket_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Provider_IntoPlaneProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelTicket_Provider_IntoPlaneProviderNumber] FOREIGN KEY([IntoPlaneProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Provider_IntoPlaneProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket] CHECK CONSTRAINT [FK_JetFuelTicket_Provider_IntoPlaneProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Provider_JetFuelProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelTicket_Provider_JetFuelProviderNumber] FOREIGN KEY([JetFuelProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Provider_JetFuelProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket] CHECK CONSTRAINT [FK_JetFuelTicket_Provider_JetFuelProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelTicket_Service_ServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket] CHECK CONSTRAINT [FK_JetFuelTicket_Service_ServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_User_AorUserID]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelTicket_User_AorUserID] FOREIGN KEY([AorUserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_JetFuelTicket_User_AorUserID]') AND parent_object_id = OBJECT_ID(N'[Airport].[JetFuelTicket]'))
ALTER TABLE [Airport].[JetFuelTicket] CHECK CONSTRAINT [FK_JetFuelTicket_User_AorUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_ManifestTimeConfig_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[ManifestTimeConfig]'))
ALTER TABLE [Airport].[ManifestTimeConfig]  WITH CHECK ADD  CONSTRAINT [FK_ManifestTimeConfig_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_ManifestTimeConfig_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[ManifestTimeConfig]'))
ALTER TABLE [Airport].[ManifestTimeConfig] CHECK CONSTRAINT [FK_ManifestTimeConfig_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelTicket_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket] CHECK CONSTRAINT [FK_NationalJetFuelTicket_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Provider_IntoPlaneProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelTicket_Provider_IntoPlaneProviderNumber] FOREIGN KEY([IntoPlaneProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Provider_IntoPlaneProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket] CHECK CONSTRAINT [FK_NationalJetFuelTicket_Provider_IntoPlaneProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Provider_JetFuelProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelTicket_Provider_JetFuelProviderNumber] FOREIGN KEY([JetFuelProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Provider_JetFuelProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket] CHECK CONSTRAINT [FK_NationalJetFuelTicket_Provider_JetFuelProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelTicket_Service_ServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket] CHECK CONSTRAINT [FK_NationalJetFuelTicket_Service_ServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_User_AorUserID]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelTicket_User_AorUserID] FOREIGN KEY([AorUserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_NationalJetFuelTicket_User_AorUserID]') AND parent_object_id = OBJECT_ID(N'[Airport].[NationalJetFuelTicket]'))
ALTER TABLE [Airport].[NationalJetFuelTicket] CHECK CONSTRAINT [FK_NationalJetFuelTicket_User_AorUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_DepartureManifestInformation_User]') AND parent_object_id = OBJECT_ID(N'[Airport].[PassengerInformation]'))
ALTER TABLE [Airport].[PassengerInformation]  WITH CHECK ADD  CONSTRAINT [FK_DepartureManifestInformation_User] FOREIGN KEY([UserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_DepartureManifestInformation_User]') AND parent_object_id = OBJECT_ID(N'[Airport].[PassengerInformation]'))
ALTER TABLE [Airport].[PassengerInformation] CHECK CONSTRAINT [FK_DepartureManifestInformation_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_PassengerInformation_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[PassengerInformation]'))
ALTER TABLE [Airport].[PassengerInformation]  WITH CHECK ADD  CONSTRAINT [FK_PassengerInformation_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Airport].[FK_PassengerInformation_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Airport].[PassengerInformation]'))
ALTER TABLE [Airport].[PassengerInformation] CHECK CONSTRAINT [FK_PassengerInformation_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance]  WITH CHECK ADD  CONSTRAINT [FK_ReconciliationTolerance_Currency_CurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance] CHECK CONSTRAINT [FK_ReconciliationTolerance_Currency_CurrencyCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance]  WITH CHECK ADD  CONSTRAINT [FK_ReconciliationTolerance_Service_ServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance] CHECK CONSTRAINT [FK_ReconciliationTolerance_Service_ServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_ToleranceType_ToleranceTypeCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance]  WITH CHECK ADD  CONSTRAINT [FK_ReconciliationTolerance_ToleranceType_ToleranceTypeCode] FOREIGN KEY([ToleranceTypeCode])
REFERENCES [Catalog].[ToleranceType] ([ToleranceTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Catalog].[FK_ReconciliationTolerance_ToleranceType_ToleranceTypeCode]') AND parent_object_id = OBJECT_ID(N'[Catalog].[ReconciliationTolerance]'))
ALTER TABLE [Catalog].[ReconciliationTolerance] CHECK CONSTRAINT [FK_ReconciliationTolerance_ToleranceType_ToleranceTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AccountingAccount_AccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_AccountingAccount_AccountingAccountNumber] FOREIGN KEY([AccountingAccountNumber])
REFERENCES [Finance].[AccountingAccount] ([AccountingAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AccountingAccount_AccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_AccountingAccount_AccountingAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AircraftWeightType_AircraftWeightCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_AircraftWeightType_AircraftWeightCode] FOREIGN KEY([AircraftWeightCode])
REFERENCES [Catalog].[AircraftWeightType] ([AircraftWeightCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AircraftWeightType_AircraftWeightCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_AircraftWeightType_AircraftWeightCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AircraftWeightUomType_AircraftWeightUomID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_AircraftWeightUomType_AircraftWeightUomID] FOREIGN KEY([AircraftWeightUomID])
REFERENCES [Catalog].[AircraftWeightUomType] ([AircraftWeightUomID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_AircraftWeightUomType_AircraftWeightUomID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_AircraftWeightUomType_AircraftWeightUomID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Airport_StationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Airport_StationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_CostCenter_CCNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_CostCenter_CCNumber] FOREIGN KEY([CCNumber])
REFERENCES [Finance].[CostCenter] ([CCNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_CostCenter_CCNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_CostCenter_CCNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Currency_CurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Currency_CurrencyCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_LiabilityAccount_LiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_LiabilityAccount_LiabilityAccountNumber] FOREIGN KEY([LiabilityAccountNumber])
REFERENCES [Finance].[LiabilityAccount] ([LiabilityAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_LiabilityAccount_LiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_LiabilityAccount_LiabilityAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_OperationType_OperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_OperationType_OperationTypeID] FOREIGN KEY([OperationTypeID])
REFERENCES [Catalog].[OperationType] ([OperationTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_OperationType_OperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_OperationType_OperationTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Provider_ProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Provider_ProviderNumber] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Provider_ProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Provider_ProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Service_ServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Service_ServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_ServiceCalculationType_CalculationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_ServiceCalculationType_CalculationTypeID] FOREIGN KEY([CalculationTypeID])
REFERENCES [Catalog].[ServiceCalculationType] ([CalculationTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_ServiceCalculationType_CalculationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_ServiceCalculationType_CalculationTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_ServiceType_ServiceTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_ServiceType_ServiceTypeCode] FOREIGN KEY([ServiceTypeCode])
REFERENCES [Catalog].[ServiceType] ([ServiceTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_ServiceType_ServiceTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_ServiceType_ServiceTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_FederalTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Tax_FederalTaxCode] FOREIGN KEY([FederalTaxCode])
REFERENCES [Finance].[Tax] ([TaxCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_FederalTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Tax_FederalTaxCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_LocalTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Tax_LocalTaxCode] FOREIGN KEY([LocalTaxCode])
REFERENCES [Finance].[Tax] ([TaxCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_LocalTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Tax_LocalTaxCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_PortFeeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Tax_PortFeeCode] FOREIGN KEY([PortFeeCode])
REFERENCES [Finance].[Tax] ([TaxCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_PortFeeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Tax_PortFeeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_StateTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract]  WITH CHECK ADD  CONSTRAINT [FK_AirportServiceContract_Tax_StateTaxCode] FOREIGN KEY([StateTaxCode])
REFERENCES [Finance].[Tax] ([TaxCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AirportServiceContract_Tax_StateTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[AirportServiceContract]'))
ALTER TABLE [Finance].[AirportServiceContract] CHECK CONSTRAINT [FK_AirportServiceContract_Tax_StateTaxCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CostCenter_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[CostCenter]'))
ALTER TABLE [Finance].[CostCenter]  WITH CHECK ADD  CONSTRAINT [FK_CostCenter_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CostCenter_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[CostCenter]'))
ALTER TABLE [Finance].[CostCenter] CHECK CONSTRAINT [FK_CostCenter_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ExchangeRates_Currency]') AND parent_object_id = OBJECT_ID(N'[Finance].[ExchangeRates]'))
ALTER TABLE [Finance].[ExchangeRates]  WITH CHECK ADD  CONSTRAINT [FK_ExchangeRates_Currency] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ExchangeRates_Currency]') AND parent_object_id = OBJECT_ID(N'[Finance].[ExchangeRates]'))
ALTER TABLE [Finance].[ExchangeRates] CHECK CONSTRAINT [FK_ExchangeRates_Currency]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_AccountingAccount_AccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_AccountingAccount_AccountingAccountNumber] FOREIGN KEY([AccountingAccountNumber])
REFERENCES [Finance].[AccountingAccount] ([AccountingAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_AccountingAccount_AccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_AccountingAccount_AccountingAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_Airport_StationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Airport_StationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_Airport_StationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_CostCenter_CCNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_CostCenter_CCNumber] FOREIGN KEY([CCNumber])
REFERENCES [Finance].[CostCenter] ([CCNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_CostCenter_CCNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_CostCenter_CCNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_Currency_CurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Currency_CurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_Currency_CurrencyCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_LiabilityAccount_LiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_LiabilityAccount_LiabilityAccountNumber] FOREIGN KEY([LiabilityAccountNumber])
REFERENCES [Finance].[LiabilityAccount] ([LiabilityAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_LiabilityAccount_LiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_LiabilityAccount_LiabilityAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_OperationType_OperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_OperationType_OperationTypeID] FOREIGN KEY([OperationTypeID])
REFERENCES [Catalog].[OperationType] ([OperationTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_OperationType_OperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_OperationType_OperationTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Provider_ProviderNumberPrimary]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_Provider_ProviderNumberPrimary] FOREIGN KEY([ProviderNumberPrimary])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Provider_ProviderNumberPrimary]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_Provider_ProviderNumberPrimary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContract_Service_ServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContract_Service_ServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContract]'))
ALTER TABLE [Finance].[InternationalFuelContract] CHECK CONSTRAINT [FK_InternationalFuelContract_Service_ServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_ChargeFactorType]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContractConcept_ChargeFactorType] FOREIGN KEY([ChargeFactorTypeID])
REFERENCES [Catalog].[ChargeFactorType] ([ChargeFactorTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_ChargeFactorType]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept] CHECK CONSTRAINT [FK_InternationalFuelContractConcept_ChargeFactorType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_FuelConcept]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContractConcept_FuelConcept] FOREIGN KEY([FuelConceptID])
REFERENCES [Airport].[FuelConcept] ([FuelConceptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_FuelConcept]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept] CHECK CONSTRAINT [FK_InternationalFuelContractConcept_FuelConcept]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_FuelConceptType_FuelConceptTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContractConcept_FuelConceptType_FuelConceptTypeID] FOREIGN KEY([FuelConceptTypeCode])
REFERENCES [Airport].[FuelConceptType] ([FuelConceptTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_FuelConceptType_FuelConceptTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept] CHECK CONSTRAINT [FK_InternationalFuelContractConcept_FuelConceptType_FuelConceptTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_InternationalFuelContract]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContractConcept_InternationalFuelContract] FOREIGN KEY([EffectiveDate], [AirlineCode], [StationCode], [ServiceCode], [ProviderNumberPrimary])
REFERENCES [Finance].[InternationalFuelContract] ([EffectiveDate], [AirlineCode], [StationCode], [ServiceCode], [ProviderNumberPrimary])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_InternationalFuelContract]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept] CHECK CONSTRAINT [FK_InternationalFuelContractConcept_InternationalFuelContract]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_Provider]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelContractConcept_Provider] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelContractConcept_Provider]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelContractConcept]'))
ALTER TABLE [Finance].[InternationalFuelContractConcept] CHECK CONSTRAINT [FK_InternationalFuelContractConcept_Provider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelRate_InternationalFuelContractConcept]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelRate]'))
ALTER TABLE [Finance].[InternationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_InternationalFuelRate_InternationalFuelContractConcept] FOREIGN KEY([InternationalFuelContractConceptID])
REFERENCES [Finance].[InternationalFuelContractConcept] ([InternationalFuelContractConceptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InternationalFuelRate_InternationalFuelContractConcept]') AND parent_object_id = OBJECT_ID(N'[Finance].[InternationalFuelRate]'))
ALTER TABLE [Finance].[InternationalFuelRate] CHECK CONSTRAINT [FK_InternationalFuelRate_InternationalFuelContractConcept]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractAccountingAccountNumber_AccountingAccountAccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractAccountingAccountNumber_AccountingAccountAccountingAccountNumber] FOREIGN KEY([AccountingAccountNumber])
REFERENCES [Finance].[AccountingAccount] ([AccountingAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractAccountingAccountNumber_AccountingAccountAccountingAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractAccountingAccountNumber_AccountingAccountAccountingAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractAirlineCode_AirlineAirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractAirlineCode_AirlineAirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractAirlineCode_AirlineAirlineCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractAirlineCode_AirlineAirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractCenterNumber_CostCenterCostCenterNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractCenterNumber_CostCenterCostCenterNumber] FOREIGN KEY([CCNumber])
REFERENCES [Finance].[CostCenter] ([CCNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractCenterNumber_CostCenterCostCenterNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractCenterNumber_CostCenterCostCenterNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractCurrencyCode_CurrencyCurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractCurrencyCode_CurrencyCurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractCurrencyCode_CurrencyCurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractCurrencyCode_CurrencyCurrencyCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractFederalTaxCode_TaxTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractFederalTaxCode_TaxTaxCode] FOREIGN KEY([FederalTaxCode])
REFERENCES [Finance].[Tax] ([TaxCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractFederalTaxCode_TaxTaxCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractFederalTaxCode_TaxTaxCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractLiabilityAccountNumber_LiabilityAccountLiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractLiabilityAccountNumber_LiabilityAccountLiabilityAccountNumber] FOREIGN KEY([LiabilityAccountNumber])
REFERENCES [Finance].[LiabilityAccount] ([LiabilityAccountNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractLiabilityAccountNumber_LiabilityAccountLiabilityAccountNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractLiabilityAccountNumber_LiabilityAccountLiabilityAccountNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractOperationTypeID_OperationTypeOperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractOperationTypeID_OperationTypeOperationTypeID] FOREIGN KEY([OperationTypeID])
REFERENCES [Catalog].[OperationType] ([OperationTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractOperationTypeID_OperationTypeOperationTypeID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractOperationTypeID_OperationTypeOperationTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractProviderNumberPrimary_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractProviderNumberPrimary_ProviderProviderNumber] FOREIGN KEY([ProviderNumberPrimary])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractProviderNumberPrimary_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractProviderNumberPrimary_ProviderProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractServiceCode_ServiceServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractServiceCode_ServiceServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractServiceCode_ServiceServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractServiceCode_ServiceServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractStationCode_AirportStationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelContractStationCode_AirportStationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelContractStationCode_AirportStationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContract]'))
ALTER TABLE [Finance].[NationalFuelContract] CHECK CONSTRAINT [FK_NationalFuelContractStationCode_AirportStationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContract_NationalFuelContract]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelConceptContract_NationalFuelContract] FOREIGN KEY([EffectiveDate], [AirlineCode], [StationCode], [ServiceCode], [ProviderNumberPrimary])
REFERENCES [Finance].[NationalFuelContract] ([EffectiveDate], [AirlineCode], [StationCode], [ServiceCode], [ProviderNumberPrimary])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContract_NationalFuelContract]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept] CHECK CONSTRAINT [FK_NationalFuelConceptContract_NationalFuelContract]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractChargeFactoryID_ChargeFactorTypeChargeFactoryID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelConceptContractChargeFactoryID_ChargeFactorTypeChargeFactoryID] FOREIGN KEY([ChargeFactorTypeID])
REFERENCES [Catalog].[ChargeFactorType] ([ChargeFactorTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractChargeFactoryID_ChargeFactorTypeChargeFactoryID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept] CHECK CONSTRAINT [FK_NationalFuelConceptContractChargeFactoryID_ChargeFactorTypeChargeFactoryID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractFuelConceptID_FuelConceptContractFuelConceptID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelConceptContractFuelConceptID_FuelConceptContractFuelConceptID] FOREIGN KEY([FuelConceptID])
REFERENCES [Airport].[FuelConcept] ([FuelConceptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractFuelConceptID_FuelConceptContractFuelConceptID]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept] CHECK CONSTRAINT [FK_NationalFuelConceptContractFuelConceptID_FuelConceptContractFuelConceptID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelConceptContractFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode] FOREIGN KEY([FuelConceptTypeCode])
REFERENCES [Airport].[FuelConceptType] ([FuelConceptTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept] CHECK CONSTRAINT [FK_NationalFuelConceptContractFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractProviderNumber_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelConceptContractProviderNumber_ProviderProviderNumber] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelConceptContractProviderNumber_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelContractConcept]'))
ALTER TABLE [Finance].[NationalFuelContractConcept] CHECK CONSTRAINT [FK_NationalFuelConceptContractProviderNumber_ProviderProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateCurrencyCode_CurrencyCurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateCurrencyCode_CurrencyCurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Finance].[Currency] ([CurrencyCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateCurrencyCode_CurrencyCurrencyCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateCurrencyCode_CurrencyCurrencyCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode] FOREIGN KEY([FuelConceptTypeCode])
REFERENCES [Airport].[FuelConceptType] ([FuelConceptTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateFuelConceptTypeCode_FuelConceptTypeFuelConceptTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateProviderNumber_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateProviderNumber_ProviderProviderNumber] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateProviderNumber_ProviderProviderNumber]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateProviderNumber_ProviderProviderNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateScheduleTypeCode_ScheduleTypeScheduleTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateScheduleTypeCode_ScheduleTypeScheduleTypeCode] FOREIGN KEY([ScheduleTypeCode])
REFERENCES [Catalog].[ScheduleType] ([ScheduleTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateScheduleTypeCode_ScheduleTypeScheduleTypeCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateScheduleTypeCode_ScheduleTypeScheduleTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateServiceCode_ServiceServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateServiceCode_ServiceServiceCode] FOREIGN KEY([ServiceCode])
REFERENCES [Airport].[Service] ([ServiceCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateServiceCode_ServiceServiceCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateServiceCode_ServiceServiceCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateStationCode_AirportStationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate]  WITH CHECK ADD  CONSTRAINT [FK_NationalFuelRateStationCode_AirportStationCode] FOREIGN KEY([StationCode])
REFERENCES [Airport].[Airport] ([StationCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_NationalFuelRateStationCode_AirportStationCode]') AND parent_object_id = OBJECT_ID(N'[Finance].[NationalFuelRate]'))
ALTER TABLE [Finance].[NationalFuelRate] CHECK CONSTRAINT [FK_NationalFuelRateStationCode_AirportStationCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_AdditionalArrivalInformation_ManifestArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[AdditionalArrivalInformation]'))
ALTER TABLE [Itinerary].[AdditionalArrivalInformation]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalArrivalInformation_ManifestArrival] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[ManifestArrival] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_AdditionalArrivalInformation_ManifestArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[AdditionalArrivalInformation]'))
ALTER TABLE [Itinerary].[AdditionalArrivalInformation] CHECK CONSTRAINT [FK_AdditionalArrivalInformation_ManifestArrival]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_AdditionalDepartureInformation_ManifestDeparture]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[AdditionalDepartureInformation]'))
ALTER TABLE [Itinerary].[AdditionalDepartureInformation]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalDepartureInformation_ManifestDeparture] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[ManifestDeparture] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_AdditionalDepartureInformation_ManifestDeparture]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[AdditionalDepartureInformation]'))
ALTER TABLE [Itinerary].[AdditionalDepartureInformation] CHECK CONSTRAINT [FK_AdditionalDepartureInformation_ManifestDeparture]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrival_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrival]'))
ALTER TABLE [Itinerary].[GendecArrival]  WITH CHECK ADD  CONSTRAINT [FK_GendecArrival_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrival_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrival]'))
ALTER TABLE [Itinerary].[GendecArrival] CHECK CONSTRAINT [FK_GendecArrival_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrivalCrew_Crew_CrewID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrivalCrew]'))
ALTER TABLE [Itinerary].[GendecArrivalCrew]  WITH CHECK ADD  CONSTRAINT [FK_GendecArrivalCrew_Crew_CrewID] FOREIGN KEY([CrewID])
REFERENCES [Airport].[Crew] ([CrewID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrivalCrew_Crew_CrewID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrivalCrew]'))
ALTER TABLE [Itinerary].[GendecArrivalCrew] CHECK CONSTRAINT [FK_GendecArrivalCrew_Crew_CrewID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrivalCrew_GendecArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrivalCrew]'))
ALTER TABLE [Itinerary].[GendecArrivalCrew]  WITH CHECK ADD  CONSTRAINT [FK_GendecArrivalCrew_GendecArrival] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[GendecArrival] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecArrivalCrew_GendecArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecArrivalCrew]'))
ALTER TABLE [Itinerary].[GendecArrivalCrew] CHECK CONSTRAINT [FK_GendecArrivalCrew_GendecArrival]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDeparture_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDeparture]'))
ALTER TABLE [Itinerary].[GendecDeparture]  WITH CHECK ADD  CONSTRAINT [FK_GendecDeparture_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDeparture_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDeparture]'))
ALTER TABLE [Itinerary].[GendecDeparture] CHECK CONSTRAINT [FK_GendecDeparture_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDepartureCrew_Crew_CrewID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDepartureCrew]'))
ALTER TABLE [Itinerary].[GendecDepartureCrew]  WITH CHECK ADD  CONSTRAINT [FK_GendecDepartureCrew_Crew_CrewID] FOREIGN KEY([CrewID])
REFERENCES [Airport].[Crew] ([CrewID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDepartureCrew_Crew_CrewID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDepartureCrew]'))
ALTER TABLE [Itinerary].[GendecDepartureCrew] CHECK CONSTRAINT [FK_GendecDepartureCrew_Crew_CrewID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDepartureCrew_GendecDeparture]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDepartureCrew]'))
ALTER TABLE [Itinerary].[GendecDepartureCrew]  WITH CHECK ADD  CONSTRAINT [FK_GendecDepartureCrew_GendecDeparture] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[GendecDeparture] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_GendecDepartureCrew_GendecDeparture]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[GendecDepartureCrew]'))
ALTER TABLE [Itinerary].[GendecDepartureCrew] CHECK CONSTRAINT [FK_GendecDepartureCrew_GendecDeparture]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_Itinerary_Airplane_EquipmentNumber]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[Itinerary]'))
ALTER TABLE [Itinerary].[Itinerary]  WITH CHECK ADD  CONSTRAINT [FK_Itinerary_Airplane_EquipmentNumber] FOREIGN KEY([EquipmentNumber])
REFERENCES [Airport].[Airplane] ([EquipmentNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_Itinerary_Airplane_EquipmentNumber]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[Itinerary]'))
ALTER TABLE [Itinerary].[Itinerary] CHECK CONSTRAINT [FK_Itinerary_Airplane_EquipmentNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrival_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrival]'))
ALTER TABLE [Itinerary].[ManifestArrival]  WITH CHECK ADD  CONSTRAINT [FK_ManifestArrival_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrival_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrival]'))
ALTER TABLE [Itinerary].[ManifestArrival] CHECK CONSTRAINT [FK_ManifestArrival_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrivalDelay_Delay]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrivalDelay]'))
ALTER TABLE [Itinerary].[ManifestArrivalDelay]  WITH CHECK ADD  CONSTRAINT [FK_ManifestArrivalDelay_Delay] FOREIGN KEY([DelayCode])
REFERENCES [Airport].[Delay] ([DelayCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrivalDelay_Delay]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrivalDelay]'))
ALTER TABLE [Itinerary].[ManifestArrivalDelay] CHECK CONSTRAINT [FK_ManifestArrivalDelay_Delay]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrivalDelay_ManifestArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrivalDelay]'))
ALTER TABLE [Itinerary].[ManifestArrivalDelay]  WITH CHECK ADD  CONSTRAINT [FK_ManifestArrivalDelay_ManifestArrival] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[ManifestArrival] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestArrivalDelay_ManifestArrival]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestArrivalDelay]'))
ALTER TABLE [Itinerary].[ManifestArrivalDelay] CHECK CONSTRAINT [FK_ManifestArrivalDelay_ManifestArrival]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDeparture_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDeparture]'))
ALTER TABLE [Itinerary].[ManifestDeparture]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDeparture_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDeparture_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDeparture]'))
ALTER TABLE [Itinerary].[ManifestDeparture] CHECK CONSTRAINT [FK_ManifestDeparture_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoarding_ManifestDeparture1]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoarding]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoarding]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoarding_ManifestDeparture1] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[ManifestDeparture] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoarding_ManifestDeparture1]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoarding]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoarding] CHECK CONSTRAINT [FK_ManifestDepartureBoarding_ManifestDeparture1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingDetail_CompartmentTypeConfig_CompartmentTypeID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingDetail]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingDetail]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoardingDetail_CompartmentTypeConfig_CompartmentTypeID] FOREIGN KEY([CompartmentTypeID])
REFERENCES [Airport].[CompartmentTypeConfig] ([CompartmentTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingDetail_CompartmentTypeConfig_CompartmentTypeID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingDetail]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingDetail] CHECK CONSTRAINT [FK_ManifestDepartureBoardingDetail_CompartmentTypeConfig_CompartmentTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingDetail_ManifestDepartureBoarding_BoardingID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingDetail]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingDetail]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoardingDetail_ManifestDepartureBoarding_BoardingID] FOREIGN KEY([BoardingID])
REFERENCES [Itinerary].[ManifestDepartureBoarding] ([BoardingID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingDetail_ManifestDepartureBoarding_BoardingID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingDetail]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingDetail] CHECK CONSTRAINT [FK_ManifestDepartureBoardingDetail_ManifestDepartureBoarding_BoardingID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_CompartmentTypeConfig_CompartmentTypeID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoardingInformation_CompartmentTypeConfig_CompartmentTypeID] FOREIGN KEY([CompartmentTypeID])
REFERENCES [Airport].[CompartmentTypeConfig] ([CompartmentTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_CompartmentTypeConfig_CompartmentTypeID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation] CHECK CONSTRAINT [FK_ManifestDepartureBoardingInformation_CompartmentTypeConfig_CompartmentTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_CompartmentTypeInformation_CompartmentTypeInformationID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoardingInformation_CompartmentTypeInformation_CompartmentTypeInformationID] FOREIGN KEY([CompartmentTypeInformationID])
REFERENCES [Airport].[CompartmentTypeInformation] ([CompartmentTypeInformationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_CompartmentTypeInformation_CompartmentTypeInformationID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation] CHECK CONSTRAINT [FK_ManifestDepartureBoardingInformation_CompartmentTypeInformation_CompartmentTypeInformationID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_ManifestDepartureBoarding_BoardingID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureBoardingInformation_ManifestDepartureBoarding_BoardingID] FOREIGN KEY([BoardingID])
REFERENCES [Itinerary].[ManifestDepartureBoarding] ([BoardingID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureBoardingInformation_ManifestDepartureBoarding_BoardingID]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureBoardingInformation]'))
ALTER TABLE [Itinerary].[ManifestDepartureBoardingInformation] CHECK CONSTRAINT [FK_ManifestDepartureBoardingInformation_ManifestDepartureBoarding_BoardingID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureDelay_Delay_DelayCode]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureDelay]'))
ALTER TABLE [Itinerary].[ManifestDepartureDelay]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureDelay_Delay_DelayCode] FOREIGN KEY([DelayCode])
REFERENCES [Airport].[Delay] ([DelayCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureDelay_Delay_DelayCode]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureDelay]'))
ALTER TABLE [Itinerary].[ManifestDepartureDelay] CHECK CONSTRAINT [FK_ManifestDepartureDelay_Delay_DelayCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureDelay_ManifestDeparture1]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureDelay]'))
ALTER TABLE [Itinerary].[ManifestDepartureDelay]  WITH CHECK ADD  CONSTRAINT [FK_ManifestDepartureDelay_ManifestDeparture1] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[ManifestDeparture] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_ManifestDepartureDelay_ManifestDeparture1]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[ManifestDepartureDelay]'))
ALTER TABLE [Itinerary].[ManifestDepartureDelay] CHECK CONSTRAINT [FK_ManifestDepartureDelay_ManifestDeparture1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_Timeline_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[Timeline]'))
ALTER TABLE [Itinerary].[Timeline]  WITH CHECK ADD  CONSTRAINT [FK_Timeline_Itinerary] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Itinerary] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_Timeline_Itinerary]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[Timeline]'))
ALTER TABLE [Itinerary].[Timeline] CHECK CONSTRAINT [FK_Timeline_Itinerary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_MovementType_MovementTypeCode]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement]  WITH CHECK ADD  CONSTRAINT [FK_TimelineMovement_MovementType_MovementTypeCode] FOREIGN KEY([MovementTypeCode])
REFERENCES [Catalog].[MovementType] ([MovementTypeCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_MovementType_MovementTypeCode]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement] CHECK CONSTRAINT [FK_TimelineMovement_MovementType_MovementTypeCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_OperationType]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement]  WITH CHECK ADD  CONSTRAINT [FK_TimelineMovement_OperationType] FOREIGN KEY([OperationTypeID])
REFERENCES [Catalog].[OperationType] ([OperationTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_OperationType]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement] CHECK CONSTRAINT [FK_TimelineMovement_OperationType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_Provider]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement]  WITH CHECK ADD  CONSTRAINT [FK_TimelineMovement_Provider] FOREIGN KEY([ProviderNumber])
REFERENCES [Finance].[Provider] ([ProviderNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_Provider]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement] CHECK CONSTRAINT [FK_TimelineMovement_Provider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_Timeline]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement]  WITH CHECK ADD  CONSTRAINT [FK_TimelineMovement_Timeline] FOREIGN KEY([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
REFERENCES [Itinerary].[Timeline] ([Sequence], [AirlineCode], [FlightNumber], [ItineraryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Itinerary].[FK_TimelineMovement_Timeline]') AND parent_object_id = OBJECT_ID(N'[Itinerary].[TimelineMovement]'))
ALTER TABLE [Itinerary].[TimelineMovement] CHECK CONSTRAINT [FK_TimelineMovement_Timeline]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelLogError_JetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelLogError]'))
ALTER TABLE [Process].[JetFuelLogError]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelLogError_JetFuelProcess_PeriodID] FOREIGN KEY([PeriodCode])
REFERENCES [Process].[JetFuelProcess] ([PeriodCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelLogError_JetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelLogError]'))
ALTER TABLE [Process].[JetFuelLogError] CHECK CONSTRAINT [FK_JetFuelLogError_JetFuelProcess_PeriodID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelPolicy_JetFuelPolicyControl_PolicyID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelPolicy]'))
ALTER TABLE [Process].[JetFuelPolicy]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelPolicy_JetFuelPolicyControl_PolicyID] FOREIGN KEY([PolicyID])
REFERENCES [Process].[JetFuelPolicyControl] ([PolicyID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelPolicy_JetFuelPolicyControl_PolicyID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelPolicy]'))
ALTER TABLE [Process].[JetFuelPolicy] CHECK CONSTRAINT [FK_JetFuelPolicy_JetFuelPolicyControl_PolicyID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_CalculationStatus_CalculationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_JetFuelProcess_CalculationStatus_CalculationStatusID] FOREIGN KEY([CalculationStatusCode])
REFERENCES [Process].[CalculationStatus] ([CalculationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_CalculationStatus_CalculationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess] CHECK CONSTRAINT [FK_JetFuelProcess_CalculationStatus_CalculationStatusID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_ConfirmationStatus_ConfirmationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_JetFuelProcess_ConfirmationStatus_ConfirmationStatusID] FOREIGN KEY([ConfirmationStatusCode])
REFERENCES [Process].[ConfirmationStatus] ([ConfirmationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_ConfirmationStatus_ConfirmationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess] CHECK CONSTRAINT [FK_JetFuelProcess_ConfirmationStatus_ConfirmationStatusID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_StatusProcess]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_JetFuelProcess_StatusProcess] FOREIGN KEY([StatusProcessCode])
REFERENCES [Process].[StatusProcess] ([StatusProcessCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProcess_StatusProcess]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProcess]'))
ALTER TABLE [Process].[JetFuelProcess] CHECK CONSTRAINT [FK_JetFuelProcess_StatusProcess]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProvision_JetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProvision]'))
ALTER TABLE [Process].[JetFuelProvision]  WITH CHECK ADD  CONSTRAINT [FK_JetFuelProvision_JetFuelProcess_PeriodID] FOREIGN KEY([PeriodCode])
REFERENCES [Process].[JetFuelProcess] ([PeriodCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_JetFuelProvision_JetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[JetFuelProvision]'))
ALTER TABLE [Process].[JetFuelProvision] CHECK CONSTRAINT [FK_JetFuelProvision_JetFuelProcess_PeriodID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelCost_NationalJetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelCost]'))
ALTER TABLE [Process].[NationalJetFuelCost]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelCost_NationalJetFuelProcess_PeriodID] FOREIGN KEY([PeriodCode])
REFERENCES [Process].[NationalJetFuelProcess] ([PeriodCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelCost_NationalJetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelCost]'))
ALTER TABLE [Process].[NationalJetFuelCost] CHECK CONSTRAINT [FK_NationalJetFuelCost_NationalJetFuelProcess_PeriodID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_CalculationStatus_CalculationStatusCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceControl_CalculationStatus_CalculationStatusCode] FOREIGN KEY([CalculationStatusCode])
REFERENCES [Process].[CalculationStatus] ([CalculationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_CalculationStatus_CalculationStatusCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceControl_CalculationStatus_CalculationStatusCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_ConfirmationStatus_ConfirmationStatusCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceControl_ConfirmationStatus_ConfirmationStatusCode] FOREIGN KEY([ConfirmationStatusCode])
REFERENCES [Process].[ConfirmationStatus] ([ConfirmationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_ConfirmationStatus_ConfirmationStatusCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceControl_ConfirmationStatus_ConfirmationStatusCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_DocumentStatus_DocumentStatus]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceControl_DocumentStatus_DocumentStatus] FOREIGN KEY([DocumentStatusCode])
REFERENCES [Process].[DocumentStatus] ([DocumentStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_DocumentStatus_DocumentStatus]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceControl_DocumentStatus_DocumentStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_RemittanceStatus_RemittanceStatus]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceControl_RemittanceStatus_RemittanceStatus] FOREIGN KEY([RemittanceStatusCode])
REFERENCES [Process].[RemittanceStatus] ([RemittanceStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_RemittanceStatus_RemittanceStatus]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceControl_RemittanceStatus_RemittanceStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_StatusProcess_StatusProcessCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceControl_StatusProcess_StatusProcessCode] FOREIGN KEY([StatusProcessCode])
REFERENCES [Process].[StatusProcess] ([StatusProcessCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceControl_StatusProcess_StatusProcessCode]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceControl]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceControl] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceControl_StatusProcess_StatusProcessCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceDetail_NationalJetFuelInvoiceControl]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceDetail]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoiceDetail_NationalJetFuelInvoiceControl] FOREIGN KEY([RemittanceID], [MonthYear], [Period])
REFERENCES [Process].[NationalJetFuelInvoiceControl] ([RemittanceID], [MonthYear], [Period])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoiceDetail_NationalJetFuelInvoiceControl]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoiceDetail]'))
ALTER TABLE [Process].[NationalJetFuelInvoiceDetail] CHECK CONSTRAINT [FK_NationalJetFuelInvoiceDetail_NationalJetFuelInvoiceControl]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoicePolicy_NationalJetFuelInvoiceControl]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoicePolicy]'))
ALTER TABLE [Process].[NationalJetFuelInvoicePolicy]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelInvoicePolicy_NationalJetFuelInvoiceControl] FOREIGN KEY([RemittanceID], [MonthYear], [Period])
REFERENCES [Process].[NationalJetFuelInvoiceControl] ([RemittanceID], [MonthYear], [Period])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelInvoicePolicy_NationalJetFuelInvoiceControl]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelInvoicePolicy]'))
ALTER TABLE [Process].[NationalJetFuelInvoicePolicy] CHECK CONSTRAINT [FK_NationalJetFuelInvoicePolicy_NationalJetFuelInvoiceControl]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelLogError_NationalJetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelLogError]'))
ALTER TABLE [Process].[NationalJetFuelLogError]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelLogError_NationalJetFuelProcess_PeriodID] FOREIGN KEY([PeriodCode])
REFERENCES [Process].[NationalJetFuelProcess] ([PeriodCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelLogError_NationalJetFuelProcess_PeriodID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelLogError]'))
ALTER TABLE [Process].[NationalJetFuelLogError] CHECK CONSTRAINT [FK_NationalJetFuelLogError_NationalJetFuelProcess_PeriodID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelPolicy_NationalJetFuelPolicyControl_NationalPolicyID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelPolicy]'))
ALTER TABLE [Process].[NationalJetFuelPolicy]  WITH CHECK ADD  CONSTRAINT [FK_NationalJetFuelPolicy_NationalJetFuelPolicyControl_NationalPolicyID] FOREIGN KEY([NationalPolicyID])
REFERENCES [Process].[NationalJetFuelPolicyControl] ([NationalPolicyID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelPolicy_NationalJetFuelPolicyControl_NationalPolicyID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelPolicy]'))
ALTER TABLE [Process].[NationalJetFuelPolicy] CHECK CONSTRAINT [FK_NationalJetFuelPolicy_NationalJetFuelPolicyControl_NationalPolicyID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_CalculationStatus_CalculationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_NationalJetFuelProcess_CalculationStatus_CalculationStatusID] FOREIGN KEY([CalculationStatusCode])
REFERENCES [Process].[CalculationStatus] ([CalculationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_CalculationStatus_CalculationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess] CHECK CONSTRAINT [FK_NationalJetFuelProcess_CalculationStatus_CalculationStatusID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_ConfirmationStatus_ConfirmationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_NationalJetFuelProcess_ConfirmationStatus_ConfirmationStatusID] FOREIGN KEY([ConfirmationStatusCode])
REFERENCES [Process].[ConfirmationStatus] ([ConfirmationStatusCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_ConfirmationStatus_ConfirmationStatusID]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess] CHECK CONSTRAINT [FK_NationalJetFuelProcess_ConfirmationStatus_ConfirmationStatusID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_StatusProcess]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess]  WITH NOCHECK ADD  CONSTRAINT [FK_NationalJetFuelProcess_StatusProcess] FOREIGN KEY([StatusProcessCode])
REFERENCES [Process].[StatusProcess] ([StatusProcessCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Process].[FK_NationalJetFuelProcess_StatusProcess]') AND parent_object_id = OBJECT_ID(N'[Process].[NationalJetFuelProcess]'))
ALTER TABLE [Process].[NationalJetFuelProcess] CHECK CONSTRAINT [FK_NationalJetFuelProcess_StatusProcess]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Module_Menu_MenuCode]') AND parent_object_id = OBJECT_ID(N'[Security].[Module]'))
ALTER TABLE [Security].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Menu_MenuCode] FOREIGN KEY([MenuCode])
REFERENCES [Security].[Menu] ([MenuCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Module_Menu_MenuCode]') AND parent_object_id = OBJECT_ID(N'[Security].[Module]'))
ALTER TABLE [Security].[Module] CHECK CONSTRAINT [FK_Module_Menu_MenuCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ModulePermissionModuleCode_ModuleModuleCode]') AND parent_object_id = OBJECT_ID(N'[Security].[ModulePermission]'))
ALTER TABLE [Security].[ModulePermission]  WITH NOCHECK ADD  CONSTRAINT [FK_ModulePermissionModuleCode_ModuleModuleCode] FOREIGN KEY([ModuleCode])
REFERENCES [Security].[Module] ([ModuleCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ModulePermissionModuleCode_ModuleModuleCode]') AND parent_object_id = OBJECT_ID(N'[Security].[ModulePermission]'))
ALTER TABLE [Security].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermissionModuleCode_ModuleModuleCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ModulePermissionPermissionID_PermissionPermissionID]') AND parent_object_id = OBJECT_ID(N'[Security].[ModulePermission]'))
ALTER TABLE [Security].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermissionPermissionID_PermissionPermissionID] FOREIGN KEY([PermissionCode])
REFERENCES [Security].[Permission] ([PermissionCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ModulePermissionPermissionID_PermissionPermissionID]') AND parent_object_id = OBJECT_ID(N'[Security].[ModulePermission]'))
ALTER TABLE [Security].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermissionPermissionID_PermissionPermissionID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ProfileProfileID_RoleProfileID]') AND parent_object_id = OBJECT_ID(N'[Security].[ProfileRole]'))
ALTER TABLE [Security].[ProfileRole]  WITH CHECK ADD  CONSTRAINT [FK_ProfileProfileID_RoleProfileID] FOREIGN KEY([ProfileCode])
REFERENCES [Security].[Profile] ([ProfileCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ProfileProfileID_RoleProfileID]') AND parent_object_id = OBJECT_ID(N'[Security].[ProfileRole]'))
ALTER TABLE [Security].[ProfileRole] CHECK CONSTRAINT [FK_ProfileProfileID_RoleProfileID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ProfileRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[ProfileRole]'))
ALTER TABLE [Security].[ProfileRole]  WITH CHECK ADD  CONSTRAINT [FK_ProfileRole_Role] FOREIGN KEY([RoleCode])
REFERENCES [Security].[Role] ([RoleCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_ProfileRole_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[ProfileRole]'))
ALTER TABLE [Security].[ProfileRole] CHECK CONSTRAINT [FK_ProfileRole_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RoleModulePermission_ModulePermission]') AND parent_object_id = OBJECT_ID(N'[Security].[RoleModulePermission]'))
ALTER TABLE [Security].[RoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleModulePermission_ModulePermission] FOREIGN KEY([ModuleCode], [PermissionCode])
REFERENCES [Security].[ModulePermission] ([ModuleCode], [PermissionCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RoleModulePermission_ModulePermission]') AND parent_object_id = OBJECT_ID(N'[Security].[RoleModulePermission]'))
ALTER TABLE [Security].[RoleModulePermission] CHECK CONSTRAINT [FK_RoleModulePermission_ModulePermission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RoleModulePermission_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[RoleModulePermission]'))
ALTER TABLE [Security].[RoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleModulePermission_Role] FOREIGN KEY([RoleCode])
REFERENCES [Security].[Role] ([RoleCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_RoleModulePermission_Role]') AND parent_object_id = OBJECT_ID(N'[Security].[RoleModulePermission]'))
ALTER TABLE [Security].[RoleModulePermission] CHECK CONSTRAINT [FK_RoleModulePermission_Role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_User_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Security].[User]'))
ALTER TABLE [Security].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Airline_AirlineCode] FOREIGN KEY([AirlineCode])
REFERENCES [Airport].[Airline] ([AirlineCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_User_Airline_AirlineCode]') AND parent_object_id = OBJECT_ID(N'[Security].[User]'))
ALTER TABLE [Security].[User] CHECK CONSTRAINT [FK_User_Airline_AirlineCode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Users_Department]') AND parent_object_id = OBJECT_ID(N'[Security].[User]'))
ALTER TABLE [Security].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Department] FOREIGN KEY([DepartmentID])
REFERENCES [Security].[Department] ([DepartmentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_Users_Department]') AND parent_object_id = OBJECT_ID(N'[Security].[User]'))
ALTER TABLE [Security].[User] CHECK CONSTRAINT [FK_Users_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserAirport_User_UserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserAirport]'))
ALTER TABLE [Security].[UserAirport]  WITH CHECK ADD  CONSTRAINT [FK_UserAirport_User_UserID] FOREIGN KEY([UserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserAirport_User_UserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserAirport]'))
ALTER TABLE [Security].[UserAirport] CHECK CONSTRAINT [FK_UserAirport_User_UserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserModulePermission_ModulePermission]') AND parent_object_id = OBJECT_ID(N'[Security].[UserModulePermission]'))
ALTER TABLE [Security].[UserModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_UserModulePermission_ModulePermission] FOREIGN KEY([ModuleCode], [PermissionCode])
REFERENCES [Security].[ModulePermission] ([ModuleCode], [PermissionCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserModulePermission_ModulePermission]') AND parent_object_id = OBJECT_ID(N'[Security].[UserModulePermission]'))
ALTER TABLE [Security].[UserModulePermission] CHECK CONSTRAINT [FK_UserModulePermission_ModulePermission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRoleModulePermissionUserID_UserUserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserModulePermission]'))
ALTER TABLE [Security].[UserModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleModulePermissionUserID_UserUserID] FOREIGN KEY([UserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRoleModulePermissionUserID_UserUserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserModulePermission]'))
ALTER TABLE [Security].[UserModulePermission] CHECK CONSTRAINT [FK_UserRoleModulePermissionUserID_UserUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserProfileRole_ProfileRole]') AND parent_object_id = OBJECT_ID(N'[Security].[UserProfileRole]'))
ALTER TABLE [Security].[UserProfileRole]  WITH CHECK ADD  CONSTRAINT [FK_UserProfileRole_ProfileRole] FOREIGN KEY([ProfileCode], [RoleCode])
REFERENCES [Security].[ProfileRole] ([ProfileCode], [RoleCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserProfileRole_ProfileRole]') AND parent_object_id = OBJECT_ID(N'[Security].[UserProfileRole]'))
ALTER TABLE [Security].[UserProfileRole] CHECK CONSTRAINT [FK_UserProfileRole_ProfileRole]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRoleUserID_UserUserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserProfileRole]'))
ALTER TABLE [Security].[UserProfileRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleUserID_UserUserID] FOREIGN KEY([UserID])
REFERENCES [Security].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Security].[FK_UserRoleUserID_UserUserID]') AND parent_object_id = OBJECT_ID(N'[Security].[UserProfileRole]'))
ALTER TABLE [Security].[UserProfileRole] CHECK CONSTRAINT [FK_UserRoleUserID_UserUserID]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'AirplaneModel'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelo Aeronave' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'AirplaneModel'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'MaximumTakeoffWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Maximo de Despegue en KGS' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'MaximumTakeoffWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'WeightInPound'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso en libas' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'WeightInPound'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'WeightInTonnes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso en Toneladas' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'WeightInTonnes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'EmptyOperatingWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Vacio de Operación' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'EmptyOperatingWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'FilmingMaximumWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Maximo de Rodaje en Kgs' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'FilmingMaximumWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'TakeoffWeightInTonnes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Despegue en Toneladas' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'TakeoffWeightInTonnes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'GroupWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Cobro Grupos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'GroupWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'MaximumLandingWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Maximo Aterrizaje' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'MaximumLandingWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'MaximumZeroFuelWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Máximo Cero Combustible' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'MaximumZeroFuelWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'PassengerCapacity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Capacidad de Pasajeros' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'PassengerCapacity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'CrewCapacity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Capacidad de Tripulantes' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'CrewCapacity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Airplane', N'COLUMN',N'Magnitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Envergadura en Metros' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Airplane', @level2type=N'COLUMN',@level2name=N'Magnitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'MaximumTakeoffWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Máximo de Despegue en Kgs' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'MaximumTakeoffWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'WeightInPound'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso en Libras' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'WeightInPound'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'WeightInTonnes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso en Toneladas' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'WeightInTonnes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'EmptyOperatingWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Vacío de Operación' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'EmptyOperatingWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'FilmingMaximumWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Máximo de Rodaje en Kilogramos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'FilmingMaximumWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'TakeoffWeightInTonnes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Despegue en Toneladas' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'TakeoffWeightInTonnes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'GroupWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Cobro Grupos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'GroupWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'MaximumLandingWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Máximo Aterrizaje' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'MaximumLandingWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'MaximumZeroFuelWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso Máximo Cero Combustible' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'MaximumZeroFuelWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'PassengerCapacity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Capacidad de Pasajeros' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'PassengerCapacity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'CrewCapacity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Capacidad de Tripulantes' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'CrewCapacity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'Magnitude'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Envergadura en Metros' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'Magnitude'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'FuelInLiters'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Combustible en Litros' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'FuelInLiters'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'FuelInKg'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Combustible en Kilogramos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'FuelInKg'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'FuelInGallon'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Combustible en Galones' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'FuelInGallon'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'AirplaneType', N'COLUMN',N'CompartmentTypeCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo Compartimento' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'AirplaneType', @level2type=N'COLUMN',@level2name=N'CompartmentTypeCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'CrewID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id Tripulante' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'CrewID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'LastName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'LastName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'FirstName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'MiddleName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Segundo Nombre' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'MiddleName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'Gender'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Genero' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'Gender'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'CountryOfResidence'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pais de Residencia' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'CountryOfResidence'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'PlaceBirthCity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lugar de Nacimiento' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'PlaceBirthCity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'State'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'State'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'CountryOfBird'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pais' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'CountryOfBird'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'DateOfBird'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de nacimiento' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'DateOfBird'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'Citizenship'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ciudadania' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'Citizenship'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'StatusOnBoardCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Edo.abordo; Datos actualmente en duro CR1,CR2,CR3,CR4,CR5' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'StatusOnBoardCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'HomeAddress'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'HomeAddress'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'HomeAddressCity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Del. o Municipio' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'HomeAddressCity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'HomeAddressState'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado(Dir.)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'HomeAddressState'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'HomeAddressZipCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C.P' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'HomeAddressZipCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'HomeAddressCountry'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pais(Dir.)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'HomeAddressCountry'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'PassportNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No. Pasaporte' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'PassportNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'PassportCountryIssuance'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pais Emisión' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'PassportCountryIssuance'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'PassportExpiration'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expira' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'PassportExpiration'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'LicenceNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No. Licencia' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'LicenceNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'LicenceCountryIssuance'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pais Emisión ' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'LicenceCountryIssuance'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'LicenceNumberExpiration'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expira' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'LicenceNumberExpiration'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'NickName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NickName' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'NickName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'NickNameSabre'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NickNameSabre' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'NickNameSabre'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'VisaExpirationDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expira(VISA)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'VisaExpirationDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Crew', N'COLUMN',N'EmployeeNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de Empleado' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Crew', @level2type=N'COLUMN',@level2name=N'EmployeeNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'DrinkingWater', N'COLUMN',N'DrinkingWaterID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[AguaPotableKey] de tabla [SISA].[dbo].[AdmonAguaPotable]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'DrinkingWater', @level2type=N'COLUMN',@level2name=N'DrinkingWaterID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'DrinkingWater', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[Matricula]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'DrinkingWater', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'DrinkingWater', N'COLUMN',N'DrinkingWaterName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[Description]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'DrinkingWater', @level2type=N'COLUMN',@level2name=N'DrinkingWaterName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Gpu', N'COLUMN',N'GpuCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[NoEconomico] de tabla [CatGpus]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Gpu', @level2type=N'COLUMN',@level2name=N'GpuCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Gpu', N'COLUMN',N'GpuName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[Descripcion]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Gpu', @level2type=N'COLUMN',@level2name=N'GpuName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'Gpu', N'COLUMN',N'StationCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[Localizacion]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'Gpu', @level2type=N'COLUMN',@level2name=N'StationCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'GpuObservation', N'COLUMN',N'GpuObservationCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo en tabla CatObservacionesGPU' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'GpuObservation', @level2type=N'COLUMN',@level2name=N'GpuObservationCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'GpuObservation', N'COLUMN',N'GpuObservationCodeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'GpuObservation', @level2type=N'COLUMN',@level2name=N'GpuObservationCodeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'GpuObservation', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tabla [CatObservacionesGPU]' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'GpuObservation', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'AirlineCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de aerolínea' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'AirlineCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'FlightNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de vuelo' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'FlightNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ItineraryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id único para el vuelo. Consta de la cpncatenación del año, mes y el día provenientes de la fecha de salida (YYYYMMDD)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ItineraryKey'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'AdultsCabinA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adultos en cabina A' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'AdultsCabinA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'AdultsCabinB'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adultos en cabina B' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'AdultsCabinB'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TeenageCabinA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adolecentes en cabina A (Validar si en verdad se refiere a adolecentes)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TeenageCabinA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TeenageCabinB'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adolecentes en cabina B (Validar si en verdad se refiere a adolecentes)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TeenageCabinB'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ChildrenCabinA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infantes en cabina A' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ChildrenCabinA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ChildrenCabinB'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infantes en cabina B' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ChildrenCabinB'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'LocalAdults'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adultos locales' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'LocalAdults'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'LocalTeenage'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adolecentes locales' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'LocalTeenage'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'LocalChildren'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infantes locales' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'LocalChildren'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TransitoryAdults'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adultos transitorios' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TransitoryAdults'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TransitoryTeenage'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adolecentes transitorios' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TransitoryTeenage'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TransitoryChildren'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infantes transitorios' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TransitoryChildren'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ConnectionAdults'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adultos conexiones' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ConnectionAdults'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ConnectionTeenage'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adolecentes conexiones' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ConnectionTeenage'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ConnectionChildren'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infantes conexiones' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ConnectionChildren'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'Diplomatic'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Diplomáticos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'Diplomatic'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ExtraCrew'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tripulación extra' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ExtraCrew'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'Other'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Otros exentos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'Other'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'LocalBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje local' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'LocalBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TransitoryBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje transitorio' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TransitoryBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ConnectionBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje conexión' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ConnectionBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'DiplomaticBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje diplomáticos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'DiplomaticBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ExtraCrewBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje de tripulación extra' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ExtraCrewBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'OtherBaggageQuantity'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de equipaje de otros exentos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'OtherBaggageQuantity'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'LocalBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje local' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'LocalBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'TransitoryBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje transitorio' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'TransitoryBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ConnectionBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje conexión' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ConnectionBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'DiplomaticBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje diplomático' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'DiplomaticBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'ExtraCrewBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje de tripulación extra' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'ExtraCrewBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'OtherBaggageWeight'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peso equipaje de otros exentos' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'OtherBaggageWeight'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'Observation'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Observaciones' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'Observation'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'InternationalTUA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TUA internacional' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'InternationalTUA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'UserID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ASC Responsable' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'UserID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'PreviousAirlineCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de aerolínea' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'PreviousAirlineCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'PreviousFlightNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de vuelo' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'PreviousFlightNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Airport', N'TABLE',N'PassengerInformation', N'COLUMN',N'PreviousItineraryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id único para el vuelo. Consta de la cpncatenación del año, mes y el día provenientes de la fecha de salida (YYYYMMDD)' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'TABLE',@level1name=N'PassengerInformation', @level2type=N'COLUMN',@level2name=N'PreviousItineraryKey'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Catalog', N'TABLE',N'ScheduleType', N'COLUMN',N'ScheduleTypeCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del tipo de horario' , @level0type=N'SCHEMA',@level0name=N'Catalog', @level1type=N'TABLE',@level1name=N'ScheduleType', @level2type=N'COLUMN',@level2name=N'ScheduleTypeCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Catalog', N'TABLE',N'ScheduleType', N'COLUMN',N'ScheduleTypeName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del tipo de horario' , @level0type=N'SCHEMA',@level0name=N'Catalog', @level1type=N'TABLE',@level1name=N'ScheduleType', @level2type=N'COLUMN',@level2name=N'ScheduleTypeName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Catalog', N'TABLE',N'ScheduleType', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estatus del tipo de horario' , @level0type=N'SCHEMA',@level0name=N'Catalog', @level1type=N'TABLE',@level1name=N'ScheduleType', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Finance', N'TABLE',N'AirportServiceContract', N'COLUMN',N'PortFeeFlag'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-%, 0-Valor Fijo' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'AirportServiceContract', @level2type=N'COLUMN',@level2name=N'PortFeeFlag'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Finance', N'TABLE',N'CostCenter', N'COLUMN',N'CCNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero Centro de Costos' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'CostCenter', @level2type=N'COLUMN',@level2name=N'CCNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Itinerary', N'TABLE',N'GendecDeparture', N'COLUMN',N'ActualTimeOfDeparture'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Este campo sólo es capturado para Manifiesto de Salida, es la única diferencia con los manifiestos de Salida/LLegada' , @level0type=N'SCHEMA',@level0name=N'Itinerary', @level1type=N'TABLE',@level1name=N'GendecDeparture', @level2type=N'COLUMN',@level2name=N'ActualTimeOfDeparture'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Itinerary', N'TABLE',N'GendecDeparture', N'COLUMN',N'Closed'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-cerrado, 1-abierto' , @level0type=N'SCHEMA',@level0name=N'Itinerary', @level1type=N'TABLE',@level1name=N'GendecDeparture', @level2type=N'COLUMN',@level2name=N'Closed'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'JetFuelLogError', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'JetFuelLogError', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'JetFuelProvision', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'JetFuelProvision', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'JetFuelProvision', N'COLUMN',N'FuelConceptTypeCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'El tipo del concepto: Diferencia, Fees, Into Plane, Jet Fuel y Taxes' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'JetFuelProvision', @level2type=N'COLUMN',@level2name=N'FuelConceptTypeCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'JetFuelProvision', N'COLUMN',N'ChargeFactorTypeID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'El tipo de operación: operación o galones' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'JetFuelProvision', @level2type=N'COLUMN',@level2name=N'ChargeFactorTypeID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'NationalJetFuelCost', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'NationalJetFuelCost', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'NationalJetFuelCost', N'COLUMN',N'FuelConceptTypeCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'El tipo del concepto: Diferencia, Fees, Into Plane, Jet Fuel y Taxes' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'NationalJetFuelCost', @level2type=N'COLUMN',@level2name=N'FuelConceptTypeCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'NationalJetFuelCost', N'COLUMN',N'ChargeFactorTypeID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'El tipo de operación: operación o galones' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'NationalJetFuelCost', @level2type=N'COLUMN',@level2name=N'ChargeFactorTypeID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'NationalJetFuelLogError', N'COLUMN',N'EquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'NationalJetFuelLogError', @level2type=N'COLUMN',@level2name=N'EquipmentNumber'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Process', N'TABLE',N'NationalJetFuelReconciliationDetail', N'COLUMN',N'CostEquipmentNumber'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matricula del avion' , @level0type=N'SCHEMA',@level0name=N'Process', @level1type=N'TABLE',@level1name=N'NationalJetFuelReconciliationDetail', @level2type=N'COLUMN',@level2name=N'CostEquipmentNumber'
GO
