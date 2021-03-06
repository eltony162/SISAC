USE [SISAC_DEV]
GO
/****** Object:  UserDefinedTableType [Process].[NationalJetFuelInvoiceDetailType]    Script Date: 13/01/2017 01:39:07 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NationalJetFuelInvoiceDetailType' AND ss.name = N'Process')
CREATE TYPE [Process].[NationalJetFuelInvoiceDetailType] AS TABLE(
	[RemittanceID] [varchar](8) NULL,
	[MonthYear] [varchar](4) NULL,
	[Period] [varchar](5) NULL,
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
	[TotalAmount] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [Process].[NationalJetFuelManualReconcileType]    Script Date: 13/01/2017 01:39:13 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NationalJetFuelManualReconcileType' AND ss.name = N'Process')
CREATE TYPE [Process].[NationalJetFuelManualReconcileType] AS TABLE(
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
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
	[Total] [numeric](38, 5) NOT NULL
)
GO
/****** Object:  UserDefinedTableType [Process].[NationalJetFuelNonconformityType]    Script Date: 13/01/2017 01:39:17 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NationalJetFuelNonconformityType' AND ss.name = N'Process')
CREATE TYPE [Process].[NationalJetFuelNonconformityType] AS TABLE(
	[RemittanceID] [varchar](8) NOT NULL,
	[MonthYear] [varchar](4) NOT NULL,
	[Period] [varchar](5) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
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
	[InvoiceCostVariance] [numeric](18, 5) NULL
)
GO
/****** Object:  StoredProcedure [Itinerary].[AutomaticTimeline]    Script Date: 13/01/2017 01:39:24 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Itinerary].[AutomaticTimeline]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano	
-- Create date: 21/10/2016
-- Description:	Automatic Timeline
-- =============================================
CREATE PROCEDURE [Itinerary].[AutomaticTimeline]	
	@StartDateParam AS DATETIME = NULL,
	@EndDateParam AS DATETIME = NULL
AS
BEGIN
	
	
	DECLARE @MesesTolerancia INT
	SET @MesesTolerancia = 1

	DECLARE @Today DATETIME
	DECLARE @StartDate DATETIME
	DECLARE @EndDate DATETIME
	DECLARE @Timeline AS TABLE (
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
		[NextItineraryKey] [varchar](8) NULL)

	SET @Today = CONVERT(VARCHAR(8), GETDATE(), 112 )


	IF((@StartDateParam IS NULL OR @StartDateParam = '''') OR (@EndDateParam IS NULL OR @EndDateParam = ''''))
	BEGIN
		SET @StartDate = DATEADD(MONTH, -(@MesesTolerancia), @Today)
		SET @EndDate = DATEADD(MONTH, @MesesTolerancia, @Today) + '' 23:59:59''
	END
	ELSE
	BEGIN
		SET @StartDate = @StartDateParam
		SET @EndDate = @EndDateParam
	END


	--Guardar Copia de Timeline a Trabajar
	INSERT @Timeline  
		  ([Sequence]
		  ,[AirlineCode]
		  ,[FlightNumber]
		  ,[ItineraryKey]
		  ,[PreviousSequence]
		  ,[PreviousAirlineCode]
		  ,[PreviousFlightNumber]
		  ,[PreviousItineraryKey]
		  ,[NextSequence]
		  ,[NextAirlineCode]
		  ,[NextFlightNumber]
		  ,[NextItineraryKey])
	SELECT A.[Sequence]
		  ,A.[AirlineCode]
		  ,A.[FlightNumber]
		  ,A.[ItineraryKey]
		  ,C.Sequence [PreviousSequence]
		  ,C.AirlineCode [PreviousAirlineCode]
		  ,C.FlightNumber [PreviousFlightNumber]
		  ,C.ItineraryKey [PreviousItineraryKey]
		  ,B.Sequence [NextSequence]
		  ,B.AirlineCode [NextAirlineCode]
		  ,B.FlightNumber [NextFlightNumber]
		  ,B.ItineraryKey [NextItineraryKey]
	  FROM [Itinerary].[VW_ItineraryOrder] AS A														LEFT JOIN
		   [Itinerary].[VW_ItineraryOrder] AS B ON (A.NUM = B.NUM-1
												AND A.EquipmentNumber = B.EquipmentNumber
												AND A.AirlineCode = B.AirlineCode
												AND A.ArrivalDate <= B.DepartureDate
												AND A.ArrivalStation = B.DepartureStation)			LEFT JOIN
		   [Itinerary].[VW_ItineraryOrder] AS C ON (A.NUM-1 = C.NUM
												AND A.EquipmentNumber = C.EquipmentNumber
												AND A.AirlineCode = C.AirlineCode
												AND A.DepartureDate >= C.ArrivalDate
												AND A.DepartureStation = C.ArrivalStation)
	 WHERE A.DepartureDate BETWEEN @StartDate and @EndDate
	 ORDER BY A.[AirlineCode],
			  A.[EquipmentNumber],
			  A.[DepartureDate]

	--SELECT * FROM @Timeline

	--UPDATE CON TIMELINE ACTUAL
	UPDATE [Itinerary].[Timeline]
	   SET PreviousSequence = B.PreviousSequence,
		   PreviousAirlineCode = B.PreviousAirlineCode,
		   PreviousFlightNumber = B.PreviousFlightNumber,
		   PreviousItineraryKey = B.PreviousItineraryKey,
		   NextSequence = B.NextSequence,
		   NextAirlineCode = B.NextAirlineCode,
		   NextFlightNumber = B.NextFlightNumber,
		   NextItineraryKey = B.NextItineraryKey
	  FROM [Itinerary].[Timeline] A INNER JOIN
		   @Timeline B ON (A.Sequence = B.Sequence 
					   AND A.AirlineCode = B.AirlineCode
					   AND A.FlightNumber = B.FlightNumber
					   AND A.ItineraryKey = B.ItineraryKey)
	WHERE A.SpecialCase = 0


	--SELECT *
	--  FROM [Itinerary].[Timeline] A INNER JOIN
	--       @Timeline B ON (A.Sequence = B.Sequence 
	--	               AND A.AirlineCode = B.AirlineCode
	--				   AND A.FlightNumber = B.FlightNumber
	--				   AND A.ItineraryKey = B.ItineraryKey)

	--INSERT DE REGISTROS NUEVOS EN TIMELINE
	INSERT INTO [Itinerary].[Timeline]
		  ([Sequence]
		  ,[AirlineCode]
		  ,[FlightNumber]
		  ,[ItineraryKey]
		  ,[PreviousSequence]
		  ,[PreviousAirlineCode]
		  ,[PreviousFlightNumber]
		  ,[PreviousItineraryKey]
		  ,[NextSequence]
		  ,[NextAirlineCode]
		  ,[NextFlightNumber]
		  ,[NextItineraryKey]) 
	SELECT [Sequence]
		  ,[AirlineCode]
		  ,[FlightNumber]
		  ,[ItineraryKey]
		  ,[PreviousSequence]
		  ,[PreviousAirlineCode]
		  ,[PreviousFlightNumber]
		  ,[PreviousItineraryKey]
		  ,[NextSequence]
		  ,[NextAirlineCode]
		  ,[NextFlightNumber]
		  ,[NextItineraryKey] 
	  FROM @Timeline
	 WHERE (CAST(Sequence AS VARCHAR)+AirlineCode+FlightNumber+ItineraryKey) NOT IN (SELECT CAST(Sequence AS VARCHAR)+AirlineCode+FlightNumber+ItineraryKey
																					   FROM [Itinerary].[Timeline]) 

	--SELECT [Sequence]
	--      ,[AirlineCode]
	--      ,[FlightNumber]
	--      ,[ItineraryKey]
	--      ,[PreviousSequence]
	--      ,[PreviousAirlineCode]
	--      ,[PreviousFlightNumber]
	--      ,[PreviousItineraryKey]
	--      ,[NextSequence]
	--      ,[NextAirlineCode]
	--      ,[NextFlightNumber]
	--      ,[NextItineraryKey] 
	--  FROM @Timeline
	-- WHERE (CAST(Sequence AS VARCHAR)+AirlineCode+FlightNumber+ItineraryKey) NOT IN (SELECT CAST(Sequence AS VARCHAR)+AirlineCode+FlightNumber+ItineraryKey
	--																				   FROM [Itinerary].[Timeline]) 



END
' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateInternationalFuel]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateInternationalFuel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Jose Luis Alvarez, Leonardo Eduardo Ramirez		
-- Create date: 20160310
-- Description:	Proceso de Calculo de Combustible
-- EXEC [Process].[CalculateInternationalFuel] ''Fuel201512'', 1
-- =======================================================
CREATE PROCEDURE [Process].[CalculateInternationalFuel]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30),
	@TypeProcess INT
AS
BEGIN

	SET NOCOUNT ON 
	
	IF @TypeProcess = 1
	BEGIN
		EXEC [Process].[CalculateInternationalFuelTotal] @PeriodCode
		--select 1
	END
	
	IF @TypeProcess = 2
	BEGIN
		EXEC [Process].[CalculateInternationalFuelPending] @PeriodCode
		--select 2
	END

	IF @TypeProcess = 3
	BEGIN
		EXEC [Process].[CalculateInternationalFuelRevert] @PeriodCode
		--select 3
	END

	SET NOCOUNT OFF
	RETURN 0

END' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateInternationalFuelPending]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateInternationalFuelPending]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Jose Luis Alvarez, Leonardo Eduardo Ramirez		
-- Create date: 20160310
-- Description:	Proceso de Calculo de Combustible Total
-- EXEC [Process].[CalculateInternationalFuelPending] ''Fuel201601''
-- =======================================================
CREATE PROCEDURE [Process].[CalculateInternationalFuelPending]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30)
AS
BEGIN	
	
--step 0 Inicializar variables 
DECLARE @startDate AS DATETIME 
DECLARE @endDate AS DATETIME 
DECLARE @NumberFlights INT 
DECLARE @NumberRecordsProcess INT 
		  DECLARE @POR INT

SELECT @startDate = StartDatePeriod, 
       @endDate = Cast(EndDatePeriod AS DATETIME) 
                  + '' 23:59:59'' 
FROM   [Process].[JetFuelProcess] 
WHERE  PeriodCode = @periodCode 

BEGIN TRANSACTION 

BEGIN TRY 
    --step 1 Total de Vuelos a Procesar en Periodo Indicado 
    SELECT @NumberFlights = COUNT(DISTINCT CAST(A.[Sequence] AS VARCHAR)+A.[AirlineCode]+A.[FlightNumber]+A.[ItineraryKey])
    FROM   [Process].[VW_JetFuelProcess]  A LEFT JOIN
	       [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
    WHERE  B.DepartureStation IN (SELECT [StationCode] 
                                  FROM   [Airport].[Airport] 
                                  WHERE  CountryCode != ''MEX'') 
           AND A.DepartureDate BETWEEN @startDate AND @endDate 

	--step 2 Eliminar información procesada para este periodo en Log 
    --Revisar si valida desde la vista valida lo de abierto o pendiente     
	DELETE FROM [Process].[JetFuelLogError]
	 WHERE PeriodCode = @PeriodCode

	  --UPDATE [Process].[JetFuelProcess] 
   -- SET    StatusProcessCode = ''RUN'' 
   -- WHERE  PeriodCode = @periodCode 

    --step 3 Indicar que proceso inica 
    UPDATE [Process].[JetFuelProcess] 
    SET    StartDateProcess = Getdate(), 
           RecordsToProcess = @NumberFlights, 
		   [RecordsProcessed] = 0,
		   [ProcessProgress] = 0,
           StatusProcessCode = ''RUN'' 
    WHERE  PeriodCode = @periodCode 
   

    --step 4 Buscar Vuelos sin Tickets vinculados 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey] 
               ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey]) 
           AS 
           LineNumber, 
           ''FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO'' 
           Description, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           A.[EquipmentNumber] 
    FROM   [Process].[VW_JetFuelProcess] A
	       LEFT OUTER JOIN
		   (SELECT DISTINCT
				   [Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
			  FROM [Process].[JetFuelProvision]
			 WHERE PeriodCode = @PeriodCode) B ON (A.Sequence = B.Sequence
												AND A.AirlineCode = B.AirlineCode
												AND A.FlightNumber = B.FlightNumber
												AND A.ItineraryKey = B.ItineraryKey)
    WHERE  A.DepartureDate BETWEEN @startDate AND @endDate 
           AND A.JetFuelTicketID IS NULL 
		   AND (B.Sequence IS NULL AND B.AirlineCode IS NULL
			AND B.FlightNumber IS NULL AND B.ItineraryKey IS NULL)
    --FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO 
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 
		  
		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
      END 

    --step 5 Buscar Vuelos con Ticket sin contrato vinculado 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [TicketNumber], 
                 [FueledQtyGals]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey] 
               ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey]) 
           AS 
           LineNumber, 
           ''CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO'' 
           Description, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           [EquipmentNumber], 
           [JetFuelTicketID], 
           [FuelingDate], 
           [TicketNumber], 
           [FueledQtyGals] 
    FROM   [Process].[VW_JetFuelProcess] A
	LEFT OUTER JOIN
		   (SELECT DISTINCT
				   [Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
			  FROM [Process].[JetFuelProvision]
			 WHERE PeriodCode = @PeriodCode) B ON (A.Sequence = B.Sequence
												AND A.AirlineCode = B.AirlineCode
												AND A.FlightNumber = B.FlightNumber
												AND A.ItineraryKey = B.ItineraryKey)
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND (Status = 0 OR Status IS NULL) --CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO 
		   AND (B.Sequence IS NULL AND B.AirlineCode IS NULL
		    AND B.FlightNumber IS NULL AND B.ItineraryKey IS NULL)
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 
		  
		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
      END 

    --step 6 Rates no encontradas 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [OperationTypeID], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [TicketNumber], 
                 [FueledQtyGals], 
                 [ServiceCode], 
                 [ProviderNumberPrimary], 
                 [InternationalFuelContractConceptID], 
                 [FuelConceptID], 
                 [FuelConceptTypeCode], 
                 [ChargeFactorTypeID], 
                 [ProviderNumber], 
                 [Rate]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey] 
               ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey]) 
                                                    AS LineNumber, 
           ''RATES NOT FOUND/TARIFAS NO ENCONTRADAS'' Description, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           A.[EquipmentNumber], 
           A.OperationTypeID, 
           A.[JetFuelTicketID], 
           A.[FuelingDate], 
           A.[TicketNumber], 
           A.[FueledQtyGals], 
           A.ServiceCode, 
           A.ProviderNumberPrimary, 
           A.InternationalFuelContractConceptID, 
           A.FuelConceptID, 
           A.FuelConceptTypeCode, 
           A.ChargeFactorTypeID, 
           A.ProviderNumber, 
           A.Rate 
    FROM   [Process].[VW_JetFuelProcess] A 
           INNER JOIN (SELECT [Sequence], 
                              [AirlineCode], 
                              [FlightNumber], 
                              [ItineraryKey], 
                              Count(TicketsNum) Tarifas, 
                              Count(Rate)       TarifasValidas 
                       FROM   [Process].[VW_JetFuelProcess] 
                       WHERE  DepartureDate BETWEEN @startDate AND @endDate 
                              AND JetFuelTicketID IS NOT NULL 
                              AND Status = 1 
                       GROUP  BY [Sequence], 
                                 [AirlineCode], 
                                 [FlightNumber], 
                                 [ItineraryKey] 
                       HAVING Count(Rate) < Count(TicketsNum)) B 
                   ON ( A.Sequence = B.Sequence 
                        AND A.AirlineCode = B.AirlineCode 
                        AND A.FlightNumber = B.FlightNumber 
                        AND A.ItineraryKey = B.ItineraryKey ) 
		   LEFT OUTER JOIN
		   (SELECT DISTINCT
				   [Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
			  FROM [Process].[JetFuelProvision]
			 WHERE PeriodCode = @PeriodCode) C ON (A.Sequence = C.Sequence
												AND A.AirlineCode = C.AirlineCode
												AND A.FlightNumber = C.FlightNumber
												AND A.ItineraryKey = C.ItineraryKey)
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND Status = 1 
           AND TicketsNum = 1 --RATES NOT FOUND/TARIFAS NO ENCONTRADAS 
		   AND (C.Sequence IS NULL AND C.AirlineCode IS NULL
		    AND C.FlightNumber IS NULL AND C.ItineraryKey IS NULL)
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 
		  
		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
      END 

    --step 7 Guardar en [Process].[JetFuelProvision] 
    INSERT INTO [Process].[JetFuelProvision] 
                ([PeriodCode], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [OperationTypeID], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [FuelingTime], 
                 [ApronPosition], 
                 [TicketNumber], 
                 [FueledQtyGals], 
                 [RemainingQry], 
                 [RequestedQry], 
                 [FueledQry], 
                 [DensityFactor], 
                 [ServiceCode], 
                 [ProviderNumberPrimary], 
                 [CurrencyCode], 
                 [CCNumber], 
                 [AccountingAccountNumber], 
                 [LiabilityAccountNumber], 
                 [InternationalFuelContractConceptID], 
                 [FuelConceptID], 
                 [FuelConceptTypeCode], 
                 [ChargeFactorTypeID], 
                 [ProviderNumber], 
                 [Rate], 
                 [ConceptAmount], 
                 [PolicyID]) 
    SELECT @PeriodCode, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           A.[EquipmentNumber], 
           A.[OperationTypeID], 
           A.[JetFuelTicketID], 
           A.[FuelingDate], 
           A.[FuelingTime], 
           A.Apron, 
           A.[TicketNumber], 
           A.[FueledQtyGals], 
           A.[RemainingQry], 
           A.[RequestedQry], 
           A.[FueledQry], 
           A.[DensityFactor], 
           A.ServiceCode, 
           A.ProviderNumberPrimary, 
           A.[CurrencyCode], 
           A.[CCNumber], 
           A.[AccountingAccountNumber], 
           A.[LiabilityAccountNumber], 
           A.InternationalFuelContractConceptID, 
           A.FuelConceptID, 
           A.FuelConceptTypeCode, 
           A.ChargeFactorTypeID, 
           A.ProviderNumber, 
           A.Rate, 
           0, 
           NULL --PolicyID 
    FROM   [Process].[VW_JetFuelProcess] A 
           INNER JOIN (SELECT [Sequence], 
                              [AirlineCode], 
                              [FlightNumber], 
                              [ItineraryKey], 
                              Count(TicketsNum) Tarifas, 
                              Count(Rate)       TarifasValidas 
                       FROM   [Process].[VW_JetFuelProcess] 
                       WHERE  DepartureDate BETWEEN @startDate AND @endDate 
                              AND JetFuelTicketID IS NOT NULL 
                              AND Status = 1 
                       GROUP  BY [Sequence], 
                                 [AirlineCode], 
                                 [FlightNumber], 
                                 [ItineraryKey] 
                       HAVING Count(Rate) = Count(TicketsNum)) B 
                   ON ( A.Sequence = B.Sequence 
                        AND A.AirlineCode = B.AirlineCode 
                        AND A.FlightNumber = B.FlightNumber 
                        AND A.ItineraryKey = B.ItineraryKey ) 
		   LEFT OUTER JOIN
					   (SELECT DISTINCT
							   [Sequence]
							  ,[AirlineCode]
							  ,[FlightNumber]
							  ,[ItineraryKey]
						  FROM [Process].[JetFuelProvision]
						 WHERE PeriodCode = @PeriodCode) C ON (A.Sequence = C.Sequence
															AND A.AirlineCode = C.AirlineCode
															AND A.FlightNumber = C.FlightNumber
															AND A.ItineraryKey = C.ItineraryKey)

    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND Status = 1 --RATES FOUND/TARIFAS ENCONTRADAS 
		    AND (C.Sequence IS NULL AND C.AirlineCode IS NULL
		    AND C.FlightNumber IS NULL AND C.ItineraryKey IS NULL)

	--set @NumberRecordsProcess = 
	--SELECT @NumberRecordsProcess = COUNT(DISTINCT CAST(A.[Sequence] AS VARCHAR)+A.[AirlineCode]+A.[FlightNumber]+A.[ItineraryKey])
 --     FROM [Process].[JetFuelProvision]  A 
 --    WHERE [PeriodCode] = @PeriodCode
	--   AND (CAST(A.[Sequence] AS VARCHAR)+A.[AirlineCode]+A.[FlightNumber]+A.[ItineraryKey]) NOT IN
	--	   (SELECT CAST(A.[Sequence] AS VARCHAR)+A.[AirlineCode]+A.[FlightNumber]+A.[ItineraryKey] 
	--	      FROM [Process].[JetFuelLogError]
	--		 WHERE PeriodCode = @PeriodCode)
	SELECT @NumberRecordsProcess = @NumberFlights - (SELECT ISNULL([RecordsProcessed],0) FROM  [Process].[JetFuelProcess] WHERE  [PeriodCode] = @periodCode)		       
		   

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 
		  
		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
      END 

	--step 7.5 Sino hay vuelos
	if ( @NumberFlights = 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = 0
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = 100.00 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
      END 

    --step 8 Calculo de Combustible por Galon 
    UPDATE [Process].[JetFuelProvision] 
    SET    ConceptAmount = Rate * ISNULL([FueledQtyGals], 0) 
    WHERE  PeriodCode = @PeriodCode 
           AND ChargeFactorTypeID = 2 --2  PER GALLON 

    --step 9 Calculo de Combustible por Operacion 
    UPDATE [Process].[JetFuelProvision] 
    SET    ConceptAmount = Rate * 1.00 
    WHERE  PeriodCode = @PeriodCode 
           AND ChargeFactorTypeID = 1 --1  PER FLIGHT 

    --step 10 Indicar que el proceso termino en Status de Proceso  --FIN Code de tabla [Process].[StatusProcess] 
    UPDATE [Process].[JetFuelProcess] 
    SET    StatusProcessCode = ''FIN'', 
           EndDateProcess = Getdate() 
    WHERE  PeriodCode = @PeriodCode 

    --step 11 Revisar si el proceso fue OK o termino con registros erroneos 
    declare @numError int 

    select @numError = Count(LogId) 
    from   [Process].[JetFuelLogError] 
    WHERE  PeriodCode = @PeriodCode 

    if( @numError > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [CalculationStatusCode] = ''ERR'' --CALCULATED WITH ERRORS 
          WHERE  PeriodCode = @PeriodCode 
      end 
    else 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [CalculationStatusCode] = ''CAL'' --CALCULATED 
          WHERE  PeriodCode = @PeriodCode 
      end 
END TRY 

BEGIN CATCH 
    --SELECT  
    --  ERROR_NUMBER() AS ErrorNumber 
    --  ,ERROR_SEVERITY() AS ErrorSeverity 
    --  ,ERROR_STATE() AS ErrorState 
    --  ,ERROR_PROCEDURE() AS ErrorProcedure 
    --  ,ERROR_LINE() AS ErrorLine 
    --  ,ERROR_MESSAGE() AS ErrorMessage;     
    IF @@TRANCOUNT > 0 
      BEGIN 
          ROLLBACK TRANSACTION 
      END 
END CATCH; 

IF @@TRANCOUNT > 0 
  begin 
      COMMIT TRANSACTION 
  end 

END' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateInternationalFuelRevert]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateInternationalFuelRevert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Jose Luis Alvarez, Leonardo Eduardo Ramirez		
-- Create date: 20160310
-- Description:	Proceso de Calculo de Combustible
-- EXEC 
-- =======================================================
CREATE PROCEDURE [Process].[CalculateInternationalFuelRevert]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30)
AS
BEGIN
	
	--step 1 Eliminar en LOG
	DELETE FROM [Process].[JetFuelLogError]
	 WHERE PeriodCode = @PeriodCode

	--step 2 Eliminar de JetFuelProvission
	DELETE FROM [Process].[JetFuelProvision]
	 WHERE PeriodCode = @PeriodCode

	--step 3 Actualizar Status JetFuelProcess a Revert
	UPDATE [Process].[JetFuelProcess]
	   SET StatusProcessCode = ''REV''
	      ,[RecordsProcessed] = NULL
		  ,[RecordsToProcess] = NULL
		  ,[ProcessProgress] = NULL
		  ,[StartDateProcess] = NULL
		  ,[EndDateProcess] = NULL
		  ,CalculationStatusCode = NULL
	 WHERE PeriodCode = @periodCode


END' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateInternationalFuelTotal]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateInternationalFuelTotal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Jose Luis Alvarez, Leonardo Eduardo Ramirez		
-- Create date: 20160310
-- Description:	Proceso de Calculo de Combustible Total
-- EXEC [Process].[CalculateInternationalFuelTotal] ''FUEL201604''
-- =======================================================
CREATE PROCEDURE [Process].[CalculateInternationalFuelTotal]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30)
AS
BEGIN

--step 0 Inicializar variables 
DECLARE @startDate AS DATETIME 
DECLARE @endDate AS DATETIME 
DECLARE @NumberFlights INT 
DECLARE @NumberRecordsProcess INT 
		  DECLARE @POR INT

SELECT @startDate = StartDatePeriod, 
       @endDate = Cast(EndDatePeriod AS DATETIME) 
                  + '' 23:59:59'' 
FROM   [Process].[JetFuelProcess] 
WHERE  PeriodCode = @periodCode 

BEGIN TRANSACTION 

BEGIN TRY 
    --step 1 Total de Vuelos a Procesar en Periodo Indicado 
    SELECT @NumberFlights = COUNT(DISTINCT CAST(A.[Sequence] AS VARCHAR)+A.[AirlineCode]+A.[FlightNumber]+A.[ItineraryKey])
    FROM   [Process].[VW_JetFuelProcess]  A LEFT JOIN
	       [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
    WHERE  B.DepartureStation IN (SELECT [StationCode] 
                                  FROM   [Airport].[Airport] 
                                  WHERE  CountryCode != ''MEX'') 
           AND A.DepartureDate BETWEEN @startDate AND @endDate 

    --step 2 Eliminar información procesada para este periodo    
    --Revisar si valida desde la vista valida lo de abierto o pendiente 
    EXEC [Process].[CalculateInternationalFuelRevert] 
      @PeriodCode 

    --UPDATE [Process].[JetFuelProcess] 
    --SET    StatusProcessCode = ''RUN'' 
    --WHERE  PeriodCode = @periodCode 

	--step 3 Indicar que proceso inica 
    UPDATE [Process].[JetFuelProcess] 
    SET    StartDateProcess = Getdate(), 
           RecordsToProcess = @NumberFlights, 
           StatusProcessCode = ''RUN'' 
    WHERE  PeriodCode = @periodCode 

    --step 4 Buscar Vuelos sin Tickets vinculados 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY [Sequence], [AirlineCode], [FlightNumber], 
             [ItineraryKey] 
               ORDER BY [Sequence], [AirlineCode], [FlightNumber], 
             [ItineraryKey]) 
           AS 
           LineNumber, 
           ''FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO'' 
           Description, 
           [Sequence], 
           [AirlineCode], 
           [FlightNumber], 
           [ItineraryKey], 
           [EquipmentNumber] 
    FROM   [Process].[VW_JetFuelProcess] 
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NULL 
    --FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO 
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR
		  --PRINT '' ticket not found'' + CAST(@NumberRecordsProcess AS VARCHAR)
      END 

    --step 5 Buscar Vuelos con Ticket sin contrato vinculado 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [TicketNumber], 
                 [FueledQtyGals]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY [Sequence], [AirlineCode], [FlightNumber], 
             [ItineraryKey] 
               ORDER BY [Sequence], [AirlineCode], [FlightNumber], 
             [ItineraryKey]) 
           AS 
           LineNumber, 
           ''CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO'' 
           Description, 
           [Sequence], 
           [AirlineCode], 
           [FlightNumber], 
           [ItineraryKey], 
           [EquipmentNumber], 
           [JetFuelTicketID], 
           [FuelingDate], 
           [TicketNumber], 
           [FueledQtyGals] 
    FROM   [Process].[VW_JetFuelProcess] 
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND (Status = 0 OR Status IS NULL) --CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO 
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR 
		  --PRINT ''contract not found'' + CAST(@NumberRecordsProcess AS VARCHAR)
      END 

    --step 6 Rates no encontradas 
    INSERT INTO [Process].[JetFuelLogError] 
                ([PeriodCode], 
                 [LineNumber], 
                 [Description], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [OperationTypeID], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [TicketNumber], 
                 [FueledQtyGals], 
                 [ServiceCode], 
                 [ProviderNumberPrimary], 
                 [InternationalFuelContractConceptID], 
                 [FuelConceptID], 
                 [FuelConceptTypeCode], 
                 [ChargeFactorTypeID], 
                 [ProviderNumber], 
                 [Rate]) 
    SELECT @PeriodCode, 
           ROW_NUMBER() 
             OVER( 
               PARTITION BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey] 
               ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], 
             A.[ItineraryKey]) 
                                                    AS LineNumber, 
           ''RATES NOT FOUND/TARIFAS NO ENCONTRADAS'' Description, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           A.[EquipmentNumber], 
           A.OperationTypeID, 
           A.[JetFuelTicketID], 
           A.[FuelingDate], 
           A.[TicketNumber], 
           A.[FueledQtyGals], 
           A.ServiceCode, 
           A.ProviderNumberPrimary, 
           A.InternationalFuelContractConceptID, 
           A.FuelConceptID, 
           A.FuelConceptTypeCode, 
           A.ChargeFactorTypeID, 
           A.ProviderNumber, 
           A.Rate 
    FROM   [Process].[VW_JetFuelProcess] A 
           INNER JOIN (SELECT [Sequence], 
                              [AirlineCode], 
                              [FlightNumber], 
                              [ItineraryKey], 
                              Count(TicketsNum) Tarifas, 
                              Count(Rate)       TarifasValidas 
                       FROM   [Process].[VW_JetFuelProcess] 
                       WHERE  DepartureDate BETWEEN @startDate AND @endDate 
                              AND JetFuelTicketID IS NOT NULL 
                              AND Status = 1 
                       GROUP  BY [Sequence], 
                                 [AirlineCode], 
                                 [FlightNumber], 
                                 [ItineraryKey] 
                       HAVING Count(Rate) < Count(TicketsNum)) B 
                   ON ( A.Sequence = B.Sequence 
                        AND A.AirlineCode = B.AirlineCode 
                        AND A.FlightNumber = B.FlightNumber 
                        AND A.ItineraryKey = B.ItineraryKey ) 
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND Status = 1 
           AND TicketsNum = 1 --RATES NOT FOUND/TARIFAS NO ENCONTRADAS 
    set @NumberRecordsProcess = @@ROWCOUNT 

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR 
		  --PRINT ''rates not found'' + CAST(@NumberRecordsProcess AS VARCHAR)
      END 

    --step 7 Guardar en [Process].[JetFuelProvision] 
    INSERT INTO [Process].[JetFuelProvision] 
                ([PeriodCode], 
                 [Sequence], 
                 [AirlineCode], 
                 [FlightNumber], 
                 [ItineraryKey], 
                 [EquipmentNumber], 
                 [OperationTypeID], 
                 [JetFuelTicketID], 
                 [FuelingDate], 
                 [FuelingTime], 
                 [ApronPosition], 
                 [TicketNumber], 
                 [FueledQtyGals], 
                 [RemainingQry], 
                 [RequestedQry], 
                 [FueledQry], 
                 [DensityFactor], 
                 [ServiceCode], 
                 [ProviderNumberPrimary], 
                 [CurrencyCode], 
                 [CCNumber], 
                 [AccountingAccountNumber], 
                 [LiabilityAccountNumber], 
                 [InternationalFuelContractConceptID], 
                 [FuelConceptID], 
                 [FuelConceptTypeCode], 
                 [ChargeFactorTypeID], 
                 [ProviderNumber], 
                 [Rate], 
                 [ConceptAmount], 
                 [PolicyID]) 
    SELECT @PeriodCode, 
           A.[Sequence], 
           A.[AirlineCode], 
           A.[FlightNumber], 
           A.[ItineraryKey], 
           A.[EquipmentNumber], 
           A.[OperationTypeID], 
           A.[JetFuelTicketID], 
           A.[FuelingDate], 
           A.[FuelingTime], 
           A.Apron, 
           A.[TicketNumber], 
           A.[FueledQtyGals], 
           A.[RemainingQry], 
           A.[RequestedQry], 
           A.[FueledQry], 
           A.[DensityFactor], 
           A.ServiceCode, 
           A.ProviderNumberPrimary, 
           A.[CurrencyCode], 
           A.[CCNumber], 
           A.[AccountingAccountNumber], 
           A.[LiabilityAccountNumber], 
           A.InternationalFuelContractConceptID, 
           A.FuelConceptID, 
           A.FuelConceptTypeCode, 
           A.ChargeFactorTypeID, 
           A.ProviderNumber, 
           A.Rate, 
           0, 
           NULL --PolicyID 
    FROM   [Process].[VW_JetFuelProcess] A 
           INNER JOIN (SELECT [Sequence], 
                              [AirlineCode], 
                              [FlightNumber], 
                              [ItineraryKey], 
                              Count(TicketsNum) Tarifas, 
                              Count(Rate)       TarifasValidas 
                       FROM   [Process].[VW_JetFuelProcess] 
                       WHERE  DepartureDate BETWEEN @startDate AND @endDate 
                              AND JetFuelTicketID IS NOT NULL 
                              AND Status = 1 
                       GROUP  BY [Sequence], 
                                 [AirlineCode], 
                                 [FlightNumber], 
                                 [ItineraryKey] 
                       HAVING Count(Rate) = Count(TicketsNum)) B 
                   ON ( A.Sequence = B.Sequence 
                        AND A.AirlineCode = B.AirlineCode 
                        AND A.FlightNumber = B.FlightNumber 
                        AND A.ItineraryKey = B.ItineraryKey ) 
    WHERE  DepartureDate BETWEEN @startDate AND @endDate 
           AND JetFuelTicketID IS NOT NULL 
           AND Status = 1 --RATES FOUND/TARIFAS ENCONTRADAS 

	--set @NumberRecordsProcess = 
	SELECT @NumberRecordsProcess = @NumberFlights - (SELECT ISNULL([RecordsProcessed],0) FROM  [Process].[JetFuelProcess] WHERE  [PeriodCode] = @periodCode)		       
		   

    if ( @NumberRecordsProcess > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = isnull([RecordsProcessed], 0) 
                                      + @NumberRecordsProcess 
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = ( [RecordsProcessed] * 100.00 / 
                                       [RecordsToProcess] ) 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  --PRINT @POR 
		  --PRINT ''provision found'' + CAST(@NumberRecordsProcess AS VARCHAR)
      END 

	--step 7.5 Sino hay vuelos
	if ( @NumberFlights = 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [RecordsProcessed] = 0
          WHERE  [PeriodCode] = @periodCode 

          UPDATE [Process].[JetFuelProcess] 
          SET    [ProcessProgress] = 100.00 
          WHERE  [PeriodCode] = @periodCode 

		  SELECT @POR = [ProcessProgress] FROM [Process].[JetFuelProcess]  WHERE [PeriodCode] = @periodCode
		  PRINT @POR
      END 

    --step 8 Calculo de Combustible por Galon 
    UPDATE [Process].[JetFuelProvision] 
    SET    ConceptAmount = Rate * ISNULL([FueledQtyGals], 0) 
    WHERE  PeriodCode = @PeriodCode 
           AND ChargeFactorTypeID = 2 --2  PER GALLON 
    
	--step 9 Calculo de Combustible por Operacion 
    UPDATE [Process].[JetFuelProvision] 
    SET    ConceptAmount = Rate * 1.00 
    WHERE  PeriodCode = @PeriodCode 
           AND ChargeFactorTypeID = 1 --1  PER FLIGHT 
    
	--step 10 Indicar que el proceso termino en Status de Proceso  --FIN Code de tabla [Process].[StatusProcess] 
    UPDATE [Process].[JetFuelProcess] 
    SET    StatusProcessCode = ''FIN'', 
           EndDateProcess = Getdate() 
    WHERE  PeriodCode = @PeriodCode 

    --step 11 Revisar si el proceso fue OK o termino con registros erroneos 
    declare @numError int 

    select @numError = Count(LogId) 
    from   [Process].[JetFuelLogError] 
    WHERE  PeriodCode = @PeriodCode 

    if( @numError > 0 ) 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [CalculationStatusCode] = ''ERR'' --CALCULATED WITH ERRORS 
          WHERE  PeriodCode = @PeriodCode 
      end 
    else 
      begin 
          UPDATE [Process].[JetFuelProcess] 
          SET    [CalculationStatusCode] = ''CAL'' --CALCULATED 
          WHERE  PeriodCode = @PeriodCode 
      end 
END TRY 

BEGIN CATCH 
    --SELECT  
    --  ERROR_NUMBER() AS ErrorNumber 
    --  ,ERROR_SEVERITY() AS ErrorSeverity 
    --  ,ERROR_STATE() AS ErrorState 
    --  ,ERROR_PROCEDURE() AS ErrorProcedure 
    --  ,ERROR_LINE() AS ErrorLine 
    --  ,ERROR_MESSAGE() AS ErrorMessage;     
    IF @@TRANCOUNT > 0 
      BEGIN 
          ROLLBACK TRANSACTION 
      END 
END CATCH; 

IF @@TRANCOUNT > 0 
  begin 
      COMMIT TRANSACTION 
  end 

END' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateNationalFuel]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateNationalFuel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================
-- Author: Antonio Acosta Murillo		
-- Create date: Mayo 2016
-- Description:	Proceso de Calculo de Combustible Nacional
-- EXEC [Process].[CalculateNationalFuel] ''FUEL201512'', 1
-- ==========================================================
CREATE PROCEDURE [Process].[CalculateNationalFuel]
	-- Add the parameters for the stored procedure here
    @PeriodCode VARCHAR(30) ,
    @TypeProcess INT
AS
    BEGIN

        SET NOCOUNT ON; 
	
        IF @TypeProcess = 1
            BEGIN
                EXEC [Process].[CalculateNationalFuelTotal] @PeriodCode;
            END;
	
        IF @TypeProcess = 2
            BEGIN
                EXEC [Process].[CalculateNationalFuelPending] @PeriodCode;
            END;

        IF @TypeProcess = 3
            BEGIN
                EXEC [Process].[CalculateNationalFuelRevert] @PeriodCode;
            END;

        SET NOCOUNT OFF;
        RETURN 0;

    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateNationalFuelPending]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateNationalFuelPending]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: 	Israel Arellano, Leonardo Ramirez
-- Create date: Mayo 2016
-- Description:	Proceso de Calculo de Combustible Total
-- EXEC [Process].[CalculateNationalFuelPending] ''FUEL201601''
-- =======================================================
CREATE PROCEDURE [Process].[CalculateNationalFuelPending]
    @PeriodCode VARCHAR(30)
AS
    BEGIN	
	
		--STEP 0 INICIALIZAR VARIABLES 
        DECLARE @startDate AS DATETIME; 
        DECLARE @endDate AS DATETIME; 
        DECLARE @NumberFlights INT; 
        DECLARE @NumberRecordsProcess INT; 
        DECLARE @POR INT;

        SELECT  @startDate = StartDatePeriod ,
                @endDate = CAST(EndDatePeriod AS DATETIME) + '' 23:59:59''
        FROM    [Process].[NationalJetFuelProcess]
        WHERE   PeriodCode = @PeriodCode; 

        BEGIN TRANSACTION; 

        BEGIN TRY 
		    --STEP 1 TOTAL DE VUELOS A PROCESAR EN PERIODO INDICADO 
            SELECT  @NumberFlights = COUNT(DISTINCT CAST(A.[Sequence] AS VARCHAR)
                                           + A.[AirlineCode]
                                           + A.[FlightNumber]
                                           + A.[ItineraryKey])
            FROM    [Process].[VW_NationalJetFuelProcess] A
                    LEFT JOIN [Itinerary].[Itinerary] B ON ( A.Sequence = B.Sequence
                                                             AND A.AirlineCode = B.AirlineCode
                                                             AND A.FlightNumber = B.FlightNumber
                                                             AND A.ItineraryKey = B.ItineraryKey
                                                           )
            WHERE   B.DepartureStation IN ( SELECT  [StationCode]
                                            FROM    [Airport].[Airport]
                                            WHERE   CountryCode = ''MEX'' )
                    AND A.DepartureDate BETWEEN @startDate AND @endDate; 

			--STEP 2 ELIMINAR INFORMACIÓN PROCESADA PARA ESTE PERIODO EN LOG 
			--REVISAR SI VALIDA DESDE LA VISTA VALIDA LO DE ABIERTO O PENDIENTE     
            DELETE  FROM [Process].[NationalJetFuelLogError]
            WHERE   PeriodCode = @PeriodCode;

			--UPDATE [Process].[JetFuelProcess] 
			-- SET    StatusProcessCode = ''RUN'' 
			-- WHERE  PeriodCode = @periodCode 

		    --STEP 3 INDICAR QUE PROCESO INICA 
            UPDATE  [Process].[NationalJetFuelProcess]
            SET     StartDateProcess = GETDATE() ,
                    RecordsToProcess = @NumberFlights ,
                    [RecordsProcessed] = 0 ,
                    [ProcessProgress] = 0 ,
                    StatusProcessCode = ''RUN''
            WHERE   PeriodCode = @PeriodCode; 
   

		    --STEP 4 BUSCAR VUELOS SIN TICKETS VINCULADOS 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( [PeriodCode] ,
                      [LineNumber] ,
                      [Description] ,
                      [Sequence] ,
                      [AirlineCode] ,
                      [FlightNumber] ,
                      [ItineraryKey] ,
                      [EquipmentNumber]
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY A.[Sequence],
                                                A.[AirlineCode],
                                                A.[FlightNumber],
                                                A.[ItineraryKey] ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], A.[ItineraryKey] ) AS LineNumber ,
                            ''FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO'' Description ,
                            A.[Sequence] ,
                            A.[AirlineCode] ,
                            A.[FlightNumber] ,
                            A.[ItineraryKey] ,
                            A.[EquipmentNumber]
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            LEFT OUTER JOIN ( SELECT DISTINCT
                                                        [Sequence] ,
                                                        [AirlineCode] ,
                                                        [FlightNumber] ,
                                                        [ItineraryKey]
                                              FROM      [Process].[NationalJetFuelCost]
                                              WHERE     PeriodCode = @PeriodCode
                                            ) B ON ( A.Sequence = B.Sequence
                                                     AND A.AirlineCode = B.AirlineCode
                                                     AND A.FlightNumber = B.FlightNumber
                                                     AND A.ItineraryKey = B.ItineraryKey
                                                   )
                    WHERE   A.DepartureDate BETWEEN @startDate AND @endDate
                            AND A.NationalJetFuelTicketID IS NULL
                            AND ( B.Sequence IS NULL
                                  AND B.AirlineCode IS NULL
                                  AND B.FlightNumber IS NULL
                                  AND B.ItineraryKey IS NULL
                                );

			--FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO 
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 
		  
                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

		    --STEP 5 BUSCAR VUELOS CON TICKET SIN CONTRATO VINCULADO 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( [PeriodCode] ,
                      [LineNumber] ,
                      [Description] ,
                      [Sequence] ,
                      [AirlineCode] ,
                      [FlightNumber] ,
                      [ItineraryKey] ,
                      [EquipmentNumber] ,
                      [NationalJetFuelTicketID] ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY A.[Sequence],
                                                A.[AirlineCode],
                                                A.[FlightNumber],
                                                A.[ItineraryKey] ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], A.[ItineraryKey] ) AS LineNumber ,
                            ''CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO'' Description ,
                            A.[Sequence] ,
                            A.[AirlineCode] ,
                            A.[FlightNumber] ,
                            A.[ItineraryKey] ,
                            [EquipmentNumber] ,
                            [NationalJetFuelTicketID] ,
                            FuelingDateStart ,
                            FuelingTimeStart ,
                            FuelingDateEnd ,
                            FuelingTimeEnd ,
                            ApronPosition ,
                            TicketNumber ,
                            FueledQtyLts ,
                            RemainingQtyKgs ,
                            RequestedQtyKgs ,
                            FueledQtyKgs
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            LEFT OUTER JOIN ( SELECT DISTINCT
                                                        [Sequence] ,
                                                        [AirlineCode] ,
                                                        [FlightNumber] ,
                                                        [ItineraryKey]
                                              FROM      [Process].[NationalJetFuelCost]
                                              WHERE     PeriodCode = @PeriodCode
                                            ) B ON ( A.Sequence = B.Sequence
                                                     AND A.AirlineCode = B.AirlineCode
                                                     AND A.FlightNumber = B.FlightNumber
                                                     AND A.ItineraryKey = B.ItineraryKey
                                                   )
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND ( Status = 0
                                  OR Status IS NULL
                                ) --CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO 
                            AND ( B.Sequence IS NULL
                                  AND B.AirlineCode IS NULL
                                  AND B.FlightNumber IS NULL
                                  AND B.ItineraryKey IS NULL
                                );
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 
		  
                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 6 RATES NO ENCONTRADAS 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( [PeriodCode] ,
                      [LineNumber] ,
                      [Description] ,
                      [Sequence] ,
                      [AirlineCode] ,
                      [FlightNumber] ,
                      [ItineraryKey] ,
                      [EquipmentNumber] ,
                      [OperationTypeID] ,
                      NationalJetFuelTicketID ,
                      ServiceCode ,
                      ProviderNumberPrimary ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs ,
                      DensityFactor ,
                      NationalFuelContractConceptID ,
                      FuelConceptID ,
                      FuelConceptTypeCode ,
                      ChargeFactorTypeID ,
                      ProviderNumber ,
                      ScheduleTypeCode ,
                      Rate
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY A.[Sequence],
                                                A.[AirlineCode],
                                                A.[FlightNumber],
                                                A.[ItineraryKey] ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], A.[ItineraryKey] ) AS LineNumber ,
                            ''RATES NOT FOUND/TARIFAS NO ENCONTRADAS'' Description ,
                            A.[Sequence] ,
                            A.[AirlineCode] ,
                            A.[FlightNumber] ,
                            A.[ItineraryKey] ,
                            A.[EquipmentNumber] ,
                            A.OperationTypeID ,
                            A.NationalJetFuelTicketID ,
                            A.ServiceCode ,
                            A.ProviderNumberPrimary ,
                            A.FuelingDateStart ,
                            A.FuelingTimeStart ,
                            A.FuelingDateEnd ,
                            A.FuelingTimeEnd ,
                            A.ApronPosition ,
                            A.TicketNumber ,
                            A.FueledQtyLts ,
                            A.RemainingQtyKgs ,
                            A.RequestedQtyKgs ,
                            A.FueledQtyKgs ,
                            A.DensityFactor ,
                            A.NationalFuelContractConceptID ,
                            A.FuelConceptID ,
                            A.FuelConceptTypeCode ,
                            A.ChargeFactorTypeID ,
                            A.ProviderNumber ,
                            A.ScheduleTypeCode ,
                            A.RateValue
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            INNER JOIN ( SELECT [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey] ,
                                                COUNT(TicketsNum) Tarifas ,
                                                COUNT(RateValue) TarifasValidas
                                         FROM   [Process].[VW_NationalJetFuelProcess]
                                         WHERE  DepartureDate BETWEEN @startDate AND @endDate
                                                AND NationalJetFuelTicketID IS NOT NULL
                                                AND Status = 1
                                         GROUP BY [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey]
                                         HAVING COUNT(RateValue) < COUNT(TicketsNum)
                                       ) B ON ( A.Sequence = B.Sequence
                                                AND A.AirlineCode = B.AirlineCode
                                                AND A.FlightNumber = B.FlightNumber
                                                AND A.ItineraryKey = B.ItineraryKey
                                              )
                            LEFT OUTER JOIN ( SELECT DISTINCT
                                                        [Sequence] ,
                                                        [AirlineCode] ,
                                                        [FlightNumber] ,
                                                        [ItineraryKey]
                                              FROM      [Process].[NationalJetFuelCost]
                                              WHERE     PeriodCode = @PeriodCode
                                            ) C ON ( A.Sequence = C.Sequence
                                                     AND A.AirlineCode = C.AirlineCode
                                                     AND A.FlightNumber = C.FlightNumber
                                                     AND A.ItineraryKey = C.ItineraryKey
                                                   )
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND Status = 1
                            AND TicketsNum = 1 --RATES NOT FOUND/TARIFAS NO ENCONTRADAS 
                            AND ( C.Sequence IS NULL
                                  AND C.AirlineCode IS NULL
                                  AND C.FlightNumber IS NULL
                                  AND C.ItineraryKey IS NULL
                                );
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 
		  
                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 7 GUARDAR EN [PROCESS].[JETFUELPROVISION] 
            INSERT  INTO [Process].[NationalJetFuelCost]
                    ( [PeriodCode] ,
                      [Sequence] ,
                      [AirlineCode] ,
                      [FlightNumber] ,
                      [ItineraryKey] ,
                      [EquipmentNumber] ,
                      [OperationTypeID] ,
                      NationalJetFuelTicketID ,
                      ServiceCode ,
                      ProviderNumberPrimary ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs ,
                      DensityFactor ,
                      NationalFuelContractConceptID ,
                      FuelConceptID ,
                      FuelConceptTypeCode ,
                      ChargeFactorTypeID ,
                      ProviderNumber ,
                      ScheduleTypeCode ,
                      Rate ,
                      ConceptAmount ,
                      FederalTaxCode ,
                      FederalTaxValue ,
                      FederalTaxAmount ,
                      CCNumber ,
                      CurrencyCode ,
                      AccountingAccountNumber ,
                      LiabilityAccountNumber ,
                      PolicyID
                    )
                    SELECT  @PeriodCode ,
                            A.[Sequence] ,
                            A.[AirlineCode] ,
                            A.[FlightNumber] ,
                            A.[ItineraryKey] ,
                            A.[EquipmentNumber] ,
                            A.[OperationTypeID] ,
                            A.NationalJetFuelTicketID ,
                            A.ServiceCode ,
                            A.ProviderNumberPrimary ,
                            A.FuelingDateStart ,
                            A.FuelingTimeStart ,
                            A.FuelingDateEnd ,
                            A.FuelingTimeEnd ,
                            A.ApronPosition ,
                            A.TicketNumber ,
                            A.FueledQtyLts ,
                            A.RemainingQtyKgs ,
                            A.RequestedQtyKgs ,
                            A.FueledQtyLts ,
                            A.DensityFactor ,
                            A.NationalFuelContractConceptID ,
                            A.FuelConceptID ,
                            A.FuelConceptTypeCode ,
                            A.ChargeFactorTypeID ,
                            A.ProviderNumber ,
                            A.ScheduleTypeCode ,
                            A.RateValue ,
                            0 ,
                            A.FederalTaxCode ,
                            A.FederalTaxValue ,
                            0 ,
                            A.CCNumber ,
                            A.CurrencyCode ,
                            A.AccountingAccountNumber ,
                            A.LiabilityAccountNumber ,
                            NULL
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            INNER JOIN ( SELECT [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey] ,
                                                COUNT(TicketsNum) Tarifas ,
                                                COUNT(RateValue) TarifasValidas
                                         FROM   [Process].[VW_NationalJetFuelProcess]
                                         WHERE  DepartureDate BETWEEN @startDate AND @endDate
                                                AND NationalJetFuelTicketID IS NOT NULL
                                                AND Status = 1
                                         GROUP BY [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey]
                                         HAVING COUNT(RateValue) = COUNT(TicketsNum)
                                       ) B ON ( A.Sequence = B.Sequence
                                                AND A.AirlineCode = B.AirlineCode
                                                AND A.FlightNumber = B.FlightNumber
                                                AND A.ItineraryKey = B.ItineraryKey
                                              )
                            LEFT OUTER JOIN ( SELECT DISTINCT
                                                        [Sequence] ,
                                                        [AirlineCode] ,
                                                        [FlightNumber] ,
                                                        [ItineraryKey]
                                              FROM      [Process].[NationalJetFuelCost]
                                              WHERE     PeriodCode = @PeriodCode
                                            ) C ON ( A.Sequence = C.Sequence
                                                     AND A.AirlineCode = C.AirlineCode
                                                     AND A.FlightNumber = C.FlightNumber
                                                     AND A.ItineraryKey = C.ItineraryKey
                                                   )
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND Status = 1 --RATES FOUND/TARIFAS ENCONTRADAS 
                            AND ( C.Sequence IS NULL
                                  AND C.AirlineCode IS NULL
                                  AND C.FlightNumber IS NULL
                                  AND C.ItineraryKey IS NULL
                                );

            SELECT  @NumberRecordsProcess = @NumberFlights
                    - ( SELECT  ISNULL([RecordsProcessed], 0)
                        FROM    [Process].[NationalJetFuelProcess]
                        WHERE   [PeriodCode] = @PeriodCode
                      );		       
		   

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 
		  
                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 7.5 SINO HAY VUELOS
            IF ( @NumberFlights = 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = 0
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = 100.00
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 8 CALCULO DE COMBUSTIBLE POR LITROS 
            UPDATE  [Process].[NationalJetFuelCost]
            SET     ConceptAmount = Rate * ISNULL([FueledQtyLts], 0)
            WHERE   PeriodCode = @PeriodCode
                    AND ChargeFactorTypeID = 3; --3  PER LITER 

			----STEP 9 CALCULO DE COMBUSTIBLE POR OPERACION 
			--UPDATE [Process].[JetFuelProvision] 
			--SET    ConceptAmount = Rate * 1.00 
			--WHERE  PeriodCode = @PeriodCode 
			--AND ChargeFactorTypeID = 1 --1  PER FLIGHT 

			--STEP 10 INDICAR QUE EL PROCESO TERMINO EN STATUS DE PROCESO  --FIN CODE DE TABLA [PROCESS].[STATUSPROCESS] 
            UPDATE  [Process].[NationalJetFuelProcess]
            SET     StatusProcessCode = ''FIN'' ,
                    EndDateProcess = GETDATE()
            WHERE   PeriodCode = @PeriodCode; 

			--STEP 11 REVISAR SI EL PROCESO FUE OK O TERMINO CON REGISTROS ERRONEOS 
            DECLARE @numError INT; 

            SELECT  @numError = COUNT(LogID)
            FROM    [Process].[NationalJetFuelLogError]
            WHERE   PeriodCode = @PeriodCode; 

            IF ( @numError > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [CalculationStatusCode] = ''ERR'' --CALCULATED WITH ERRORS 
                    WHERE   PeriodCode = @PeriodCode; 
                END; 
            ELSE
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [CalculationStatusCode] = ''CAL'' --CALCULATED 
                    WHERE   PeriodCode = @PeriodCode; 
                END; 
        END TRY 

        BEGIN CATCH 
		--SELECT  
		--  ERROR_NUMBER() AS ErrorNumber 
		--  ,ERROR_SEVERITY() AS ErrorSeverity 
		--  ,ERROR_STATE() AS ErrorState 
		--  ,ERROR_PROCEDURE() AS ErrorProcedure 
		--  ,ERROR_LINE() AS ErrorLine 
		--  ,ERROR_MESSAGE() AS ErrorMessage;     
            IF @@TRANCOUNT > 0
                BEGIN 
                    ROLLBACK TRANSACTION; 
                END; 
        END CATCH; 

        IF @@TRANCOUNT > 0
            BEGIN 
                COMMIT TRANSACTION; 
            END; 

    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateNationalFuelRevert]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateNationalFuelRevert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: Antonio Acosta Murillo		
-- Create date: Mayo 2016
-- Description:	Proceso de Calculo de Combustible
-- EXEC [Process].[CalculateNationalFuelRevert] ''FUEL201601''
-- =======================================================
CREATE PROCEDURE [Process].[CalculateNationalFuelRevert]
    @PeriodCode VARCHAR(30)
AS
    BEGIN
	
	--STEP 1 ELIMINAR EN LOG
        DELETE  FROM [Process].[NationalJetFuelLogError]
        WHERE   PeriodCode = @PeriodCode;

	--STEP 2 ELIMINAR DE NATIONALJETFUELCOST
        DELETE  FROM [Process].[NationalJetFuelCost]
        WHERE   PeriodCode = @PeriodCode;

	--STEP 3 ACTUALIZAR STATUS JETFUELPROCESS A REVERT
        UPDATE  [Process].[NationalJetFuelProcess]
        SET     StatusProcessCode = ''REV'' ,
                [RecordsProcessed] = NULL ,
                [RecordsToProcess] = NULL ,
                [ProcessProgress] = NULL ,
                [StartDateProcess] = NULL ,
                [EndDateProcess] = NULL ,
                CalculationStatusCode = NULL
        WHERE   PeriodCode = @PeriodCode;

    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[CalculateNationalFuelTotal]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CalculateNationalFuelTotal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================
-- Author: Antonio Acosta Murillo
-- Create date: Mayo 2016
-- Description:	Proceso de Calculo de Combustible Total
-- EXEC [Process].[CalculateNationalFuelTotal] ''FUEL201604''
-- ==========================================================
CREATE PROCEDURE [Process].[CalculateNationalFuelTotal]
    @PeriodCode VARCHAR(30)
AS
    BEGIN
		--STEP 0 INICIALIZAR VARIABLES 
        DECLARE @startDate AS DATETIME; 
        DECLARE @endDate AS DATETIME; 
        DECLARE @NumberFlights INT; 
        DECLARE @NumberRecordsProcess INT; 
        DECLARE @POR INT;

        SELECT  @startDate = StartDatePeriod ,
                @endDate = CAST(EndDatePeriod AS DATETIME) + '' 23:59:59''
        FROM    [Process].[NationalJetFuelProcess]
        WHERE   PeriodCode = @PeriodCode; 

        BEGIN TRANSACTION; 

        BEGIN TRY 
			--STEP 1 TOTAL DE VUELOS A PROCESAR EN PERIODO INDICADO 
            SELECT  @NumberFlights = COUNT(DISTINCT CAST(A.[Sequence] AS VARCHAR)
                                           + A.[AirlineCode]
                                           + A.[FlightNumber]
                                           + A.[ItineraryKey])
            FROM    [Process].[VW_NationalJetFuelProcess] AS A
                    LEFT JOIN [Itinerary].[Itinerary] B ON ( A.Sequence = B.Sequence
                                                             AND A.AirlineCode = B.AirlineCode
                                                             AND A.FlightNumber = B.FlightNumber
                                                             AND A.ItineraryKey = B.ItineraryKey
                                                           )
            WHERE   B.DepartureStation IN ( SELECT  [StationCode]
                                            FROM    [Airport].[Airport]
                                            WHERE   CountryCode = ''MEX'' )
                    AND A.DepartureDate BETWEEN @startDate AND @endDate; 

			--STEP 2 ELIMINAR INFORMACIÓN PROCESADA PARA ESTE PERIODO    
			--REVISAR SI VALIDA DESDE LA VISTA VALIDA LO DE ABIERTO O PENDIENTE 
            EXEC [Process].[CalculateNationalFuelRevert] @PeriodCode; 

			--STEP 3 INDICAR QUE PROCESO INICA 
            UPDATE  [Process].[NationalJetFuelProcess]
            SET     StartDateProcess = GETDATE() ,
                    RecordsToProcess = @NumberFlights ,
                    StatusProcessCode = ''RUN''
            WHERE   PeriodCode = @PeriodCode; 

			--STEP 4 BUSCAR VUELOS SIN TICKETS VINCULADOS 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( [PeriodCode] ,
                      [LineNumber] ,
                      [Description] ,
                      [Sequence] ,
                      [AirlineCode] ,
                      [FlightNumber] ,
                      [ItineraryKey] ,
                      [EquipmentNumber]
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY [Sequence],
                                                [AirlineCode], [FlightNumber],
                                                [ItineraryKey] ORDER BY [Sequence], [AirlineCode], [FlightNumber], [ItineraryKey] ) AS LineNumber ,
                            ''FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO'' Description ,
                            [Sequence] ,
                            [AirlineCode] ,
                            [FlightNumber] ,
                            [ItineraryKey] ,
                            [EquipmentNumber]
                    FROM    [Process].[VW_NationalJetFuelProcess]
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NULL; 

			--FUEL TICKET NOT FOUND/TICKET DE COMBUSTIBLE NO ENCONTRADO 
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 5 BUSCAR VUELOS CON TICKET SIN CONTRATO VINCULADO 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( PeriodCode ,
                      LineNumber ,
                      Description ,
                      Sequence ,
                      AirlineCode ,
                      FlightNumber ,
                      ItineraryKey ,
                      EquipmentNumber ,
                      NationalJetFuelTicketID ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY [Sequence],
                                                [AirlineCode], [FlightNumber],
                                                [ItineraryKey] ORDER BY [Sequence], [AirlineCode], [FlightNumber], [ItineraryKey] ) AS LineNumber ,
                            ''CONTRACT NOT FOUND/CONTRATO NO ENCONTRADO'' Description ,
                            Sequence ,
                            AirlineCode ,
                            FlightNumber ,
                            ItineraryKey ,
                            EquipmentNumber ,
                            NationalJetFuelTicketID ,
                            FuelingDateStart ,
                            FuelingTimeStart ,
                            FuelingDateEnd ,
                            FuelingTimeEnd ,
                            ApronPosition ,
                            TicketNumber ,
                            FueledQtyLts ,
                            RemainingQtyKgs ,
                            RequestedQtyKgs ,
                            FueledQtyKgs
                    FROM    [Process].[VW_NationalJetFuelProcess]
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND ( Status = 0
                                  OR Status IS NULL
                                );
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 


			--STEP 6 RATES NO ENCONTRADAS 
            INSERT  INTO [Process].[NationalJetFuelLogError]
                    ( PeriodCode ,
                      LineNumber ,
                      Description ,
                      Sequence ,
                      AirlineCode ,
                      FlightNumber ,
                      ItineraryKey ,
                      EquipmentNumber ,
                      OperationTypeID ,
                      NationalJetFuelTicketID ,
                      ServiceCode ,
                      ProviderNumberPrimary ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs ,
                      DensityFactor ,
                      NationalFuelContractConceptID ,
                      FuelConceptID ,
                      FuelConceptTypeCode ,
                      ChargeFactorTypeID ,
                      ProviderNumber ,
                      ScheduleTypeCode ,
                      Rate
                    )
                    SELECT  @PeriodCode ,
                            ROW_NUMBER() OVER ( PARTITION BY A.[Sequence],
                                                A.[AirlineCode],
                                                A.[FlightNumber],
                                                A.[ItineraryKey] ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], A.[ItineraryKey] ) AS LineNumber ,
                            ''RATES NOT FOUND/TARIFAS NO ENCONTRADAS'' Description ,
                            A.Sequence ,
                            A.AirlineCode ,
                            A.FlightNumber ,
                            A.ItineraryKey ,
                            A.EquipmentNumber ,
                            A.OperationTypeID ,
                            A.NationalJetFuelTicketID ,
                            A.ServiceCode ,
                            A.ProviderNumberPrimary ,
                            A.FuelingDateStart ,
                            A.FuelingTimeStart ,
                            A.FuelingDateEnd ,
                            A.FuelingTimeEnd ,
                            A.ApronPosition ,
                            A.TicketNumber ,
                            A.FueledQtyLts ,
                            A.RemainingQtyKgs ,
                            A.RequestedQtyKgs ,
                            A.FueledQtyKgs ,
                            A.DensityFactor ,
                            A.NationalFuelContractConceptID ,
                            A.FuelConceptID ,
                            A.FuelConceptTypeCode ,
                            A.ChargeFactorTypeID ,
                            A.ProviderNumber ,
                            A.ScheduleTypeCode ,
                            A.RateValue
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            INNER JOIN ( SELECT [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey] ,
                                                COUNT(TicketsNum) Tarifas ,
                                                COUNT(RateValue) TarifasValidas
                                         FROM   [Process].[VW_NationalJetFuelProcess]
                                         WHERE  DepartureDate BETWEEN @startDate AND @endDate
                                                AND NationalJetFuelTicketID IS NOT NULL
                                                AND Status = 1
                                         GROUP BY [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey]
                                         HAVING COUNT(RateValue) < COUNT(TicketsNum)
                                       ) B ON ( A.Sequence = B.Sequence
                                                AND A.AirlineCode = B.AirlineCode
                                                AND A.FlightNumber = B.FlightNumber
                                                AND A.ItineraryKey = B.ItineraryKey
                                              )
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND Status = 1
                            AND TicketsNum = 1;
            SET @NumberRecordsProcess = @@ROWCOUNT; 

            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 7 GUARDAR EN [PROCESS].[NATIONALJETFUELCOST] 
            INSERT  INTO [Process].[NationalJetFuelCost]
                    ( PeriodCode ,
                      Sequence ,
                      AirlineCode ,
                      FlightNumber ,
                      ItineraryKey ,
                      EquipmentNumber ,
                      OperationTypeID ,
                      NationalJetFuelTicketID ,
                      ServiceCode ,
                      ProviderNumberPrimary ,
                      FuelingStartDate ,
                      FuelingStartTime ,
                      FuelingEndDate ,
                      FuelingEndTime ,
                      ApronPosition ,
                      TicketNumber ,
                      FueledQtyLts ,
                      RemainingQtyKgs ,
                      RequestedQtyKgs ,
                      FueledQtyKgs ,
                      DensityFactor ,
                      NationalFuelContractConceptID ,
                      FuelConceptID ,
                      FuelConceptTypeCode ,
                      ChargeFactorTypeID ,
                      ProviderNumber ,
                      ScheduleTypeCode ,
                      Rate ,
                      ConceptAmount ,
                      FederalTaxCode ,
                      FederalTaxValue ,
                      FederalTaxAmount ,
                      CCNumber ,
                      CurrencyCode ,
                      AccountingAccountNumber ,
                      LiabilityAccountNumber ,
                      PolicyID
                    )
                    SELECT  @PeriodCode ,
                            A.Sequence ,
                            A.AirlineCode ,
                            A.FlightNumber ,
                            A.ItineraryKey ,
                            A.EquipmentNumber ,
                            A.OperationTypeID ,
                            A.NationalJetFuelTicketID ,
                            A.ServiceCode ,
                            A.ProviderNumberPrimary ,
                            A.FuelingDateStart ,
                            A.FuelingTimeStart ,
                            A.FuelingDateEnd ,
                            A.FuelingTimeEnd ,
                            A.ApronPosition ,
                            A.TicketNumber ,
                            A.FueledQtyLts ,
                            A.RemainingQtyKgs ,
                            A.RequestedQtyKgs ,
                            A.FueledQtyLts ,
                            A.DensityFactor ,
                            A.NationalFuelContractConceptID ,
                            A.FuelConceptID ,
                            A.FuelConceptTypeCode ,
                            A.ChargeFactorTypeID ,
                            A.ProviderNumber ,
                            A.ScheduleTypeCode ,
                            A.RateValue ,
                            0 ,
                            A.FederalTaxCode ,
                            A.FederalTaxValue ,
                            0 ,
                            A.CCNumber ,
                            A.CurrencyCode ,
                            A.AccountingAccountNumber ,
                            A.LiabilityAccountNumber ,
                            NULL
                    FROM    [Process].[VW_NationalJetFuelProcess] A
                            INNER JOIN ( SELECT [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey] ,
                                                COUNT(TicketsNum) Tarifas ,
                                                COUNT(RateValue) TarifasValidas
                                         FROM   [Process].[VW_NationalJetFuelProcess]
                                         WHERE  DepartureDate BETWEEN @startDate AND @endDate
                                                AND NationalJetFuelTicketID IS NOT NULL
                                                AND Status = 1
                                         GROUP BY [Sequence] ,
                                                [AirlineCode] ,
                                                [FlightNumber] ,
                                                [ItineraryKey]
                                         HAVING COUNT(RateValue) = COUNT(TicketsNum)
                                       ) B ON ( A.Sequence = B.Sequence
                                                AND A.AirlineCode = B.AirlineCode
                                                AND A.FlightNumber = B.FlightNumber
                                                AND A.ItineraryKey = B.ItineraryKey
                                              )
                    WHERE   DepartureDate BETWEEN @startDate AND @endDate
                            AND NationalJetFuelTicketID IS NOT NULL
                            AND Status = 1;

            SELECT  @NumberRecordsProcess = @NumberFlights
                    - ( SELECT  ISNULL([RecordsProcessed], 0)
                        FROM    [Process].[NationalJetFuelProcess]
                        WHERE   [PeriodCode] = @PeriodCode
                      );		       
		   
            IF ( @NumberRecordsProcess > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                            + @NumberRecordsProcess
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                                  / [RecordsToProcess] )
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 7.5 SINO HAY VUELOS
            IF ( @NumberFlights = 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [RecordsProcessed] = 0
                    WHERE   [PeriodCode] = @PeriodCode; 

                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [ProcessProgress] = 100.00
                    WHERE   [PeriodCode] = @PeriodCode; 

                    SELECT  @POR = [ProcessProgress]
                    FROM    [Process].[NationalJetFuelProcess]
                    WHERE   [PeriodCode] = @PeriodCode;
                END; 

			--STEP 8 CALCULO DE COMBUSTIBLE POR LITROS O GALONES
            UPDATE  [Process].[NationalJetFuelCost]
            SET     ConceptAmount = Rate * ISNULL([FueledQtyLts], 0)
            WHERE   PeriodCode = @PeriodCode
                    AND ChargeFactorTypeID IN ( 2, 3 ); --3  PER LITER OR PER GALLON
    
			--STEP 9 CALCULO DE COMBUSTIBLE POR OPERACION 
            --UPDATE  [Process].[NationalJetFuelCost]
            --SET     ConceptAmount = Rate * 1.00
            --WHERE   PeriodCode = @PeriodCode
            --        AND ChargeFactorTypeID = 1; --1  PER FLIGHT 
    
			--STEP 10 INDICAR QUE EL PROCESO TERMINO EN STATUS DE PROCESO  --FIN CODE DE TABLA [PROCESS].[STATUSPROCESS] 
            UPDATE  [Process].[NationalJetFuelProcess]
            SET     StatusProcessCode = ''FIN'' ,
                    EndDateProcess = GETDATE()
            WHERE   PeriodCode = @PeriodCode; 

			--STEP 11 REVISAR SI EL PROCESO FUE OK O TERMINO CON REGISTROS ERRONEOS 
            DECLARE @numError INT; 

            SELECT  @numError = COUNT(LogID)
            FROM    [Process].[NationalJetFuelLogError]
            WHERE   PeriodCode = @PeriodCode; 

            IF ( @numError > 0 )
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [CalculationStatusCode] = ''ERR'' --CALCULATED WITH ERRORS 
                    WHERE   PeriodCode = @PeriodCode; 
                END; 
            ELSE
                BEGIN 
                    UPDATE  [Process].[NationalJetFuelProcess]
                    SET     [CalculationStatusCode] = ''CAL'' --CALCULATED 
                    WHERE   PeriodCode = @PeriodCode; 
                END; 

        END TRY 

        BEGIN CATCH 
            IF @@TRANCOUNT > 0
                BEGIN 
                    ROLLBACK TRANSACTION; 
                END; 
        END CATCH; 

        IF @@TRANCOUNT > 0
            BEGIN 
                COMMIT TRANSACTION; 
            END; 
    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[CancelJetFuelPolicy]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CancelJetFuelPolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: Antonio Acosta Murillo	
-- Create Date: 2016-04-24
-- Description:	Cambia el estatus del documento a: CANCELADO, y desmarca todos los registros de Provisión
-- EXEC Process.CancelJetFuelPolicy 10147
-- =======================================================
CREATE PROCEDURE [Process].[CancelJetFuelPolicy]
	@PolicyID BIGINT
AS

SET NOCOUNT ON  
BEGIN TRAN CancelPolicy

IF EXISTS(SELECT MENV FROM Process.JetFuelPolicy WITH(NOLOCK) WHERE PolicyID = @PolicyID AND MENV IS NOT NULL)
BEGIN
	SELECT -1
END

ELSE
BEGIN
	IF EXISTS (SELECT PolicyID FROM Process.JetFuelProvision WITH(NOLOCK) WHERE PolicyID = @PolicyID)  
	BEGIN
		UPDATE Process.JetFuelProvision
		SET PolicyID = NULL
		WHERE PolicyID = @PolicyID
		IF @@ERROR <> 0 GOTO Error  
	END

	IF EXISTS (SELECT PolicyID FROM Process.JetFuelPolicyControl WITH(NOLOCK) WHERE PolicyID = @PolicyID)  
	BEGIN
		UPDATE Process.JetFuelPolicyControl
		SET Status = ''CANCELED''
		WHERE PolicyID = @PolicyID
		IF @@ERROR <> 0 GOTO Error  
	END
END

COMMIT TRAN CancelPolicy

SET NOCOUNT OFF    
SELECT 0   
RETURN 
    
Error:
   ROLLBACK TRAN CancelPolicy	    
   SET NOCOUNT OFF
   RAISERROR(''Error al Ejecutar el Stored Procedure Process.CancelJetFuelPolicy'',18,1)     
   SELECT -1    
' 
END
GO
/****** Object:  StoredProcedure [Process].[CancelNationalJetFuelPolicy]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CancelNationalJetFuelPolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: Israel Arellano Ceniceros	
-- Create Date: 2016-06-02
-- Description:	Changes the document''s status to CANCEL, and dismarks all Cost''s records.
-- EXEC Process.CancelNationalJetFuelPolicy 3
-- =======================================================
CREATE PROCEDURE [Process].[CancelNationalJetFuelPolicy]
	@NationalPolicyID BIGINT
AS

SET NOCOUNT ON  
BEGIN TRAN CancelPolicy

IF EXISTS(SELECT MENV FROM Process.NationalJetFuelPolicy WITH(NOLOCK) WHERE NationalPolicyID = @NationalPolicyID AND MENV IS NOT NULL)
BEGIN
	SELECT -1
END

ELSE
BEGIN
	IF EXISTS (SELECT NationalPolicyID FROM Process.NationalJetFuelPolicy WITH(NOLOCK) WHERE NationalPolicyID = @NationalPolicyID)  
	BEGIN
		UPDATE Process.NationalJetFuelCost
		SET PolicyID = NULL
		WHERE PolicyID = @NationalPolicyID
		IF @@ERROR <> 0 GOTO Error  
	END

	IF EXISTS (SELECT NationalPolicyID FROM Process.NationalJetFuelPolicyControl WITH(NOLOCK) WHERE NationalPolicyID = @NationalPolicyID)  
	BEGIN
		UPDATE Process.NationalJetFuelPolicyControl
		SET Status = ''CANCELED''
		WHERE NationalPolicyID = @NationalPolicyID
		IF @@ERROR <> 0 GOTO Error  
	END
END

COMMIT TRAN CancelPolicy

SET NOCOUNT OFF    
SELECT 0    
RETURN
    
Error:
   ROLLBACK TRAN CancelPolicy	    
   SET NOCOUNT OFF
   RAISERROR(''Error al Ejecutar el Stored Procedure Process.CancelNationalJetFuelPolicy'',18,1)     
   SELECT -1    
' 
END
GO
/****** Object:  StoredProcedure [Process].[CancelPolizaProvisionesInt]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[CancelPolizaProvisionesInt]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 21/04/2016
-- Description:	Cancelar Poliza
-- ==================================================
-- [Process].[CancelPolizaProvisionesInt] 10149
CREATE PROCEDURE [Process].[CancelPolizaProvisionesInt]
	-- Add the parameters for the stored procedure here
	@PolicyID AS BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS(SELECT [MENV] FROM [Process].[JetFuelPolicy] WHERE [PolicyID] = @PolicyID AND MENV IS NOT NULL)
	BEGIN
				
		Print ''SAP''

	END
	ELSE
	BEGIN
		
		Print ''Not SAP''

		--DELETE [Process].[JetFuelPolicy]
		-- WHERE [PolicyID] = @PolicyID

		UPDATE [Process].[JetFuelProvision]
		   SET [PolicyID] = NULL
		 WHERE [PolicyID] = @PolicyID

		UPDATE [Process].[JetFuelPolicyControl]
		   SET [Status] = ''CANCEL''
		 WHERE [PolicyID] = @PolicyID

	END

	SET NOCOUNT OFF;

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[DeleteNationalInvoice]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DeleteNationalInvoice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =======================================================
-- Author: Antonio Acosta Murillo	
-- Create Date: Junio 2016
-- Description:	Elimina las remesas
-- Response Codes:
--  0 ERROR / NOT EXITS
--  1 SENT
--  2 DELETED
--  3 PENDING RECONCILED
-- EXEC [Process].[DeleteNationalInvoice] ''10001''
-- =======================================================
CREATE PROCEDURE [Process].[DeleteNationalInvoice]
	@RemittanceID VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
SET NOCOUNT ON;

BEGIN TRAN DeleteTransac;

DECLARE	@Deleted INT = 0;
  
IF EXISTS (SELECT RemittanceID FROM	Process.NationalJetFuelInvoiceControl WITH (NOLOCK) WHERE RemittanceID = @RemittanceID AND MonthYear = @MonthYear AND Period = @Period)
BEGIN
	IF EXISTS (SELECT DocumentStatusCode FROM Process.NationalJetFuelInvoiceControl WITH (NOLOCK) WHERE	RemittanceID = @RemittanceID  AND MonthYear = @MonthYear AND Period = @Period AND DocumentStatusCode = ''SENT'' )
	BEGIN
		SET @Deleted = 1;
	END;
	ELSE
	BEGIN
		IF EXISTS(SELECT RemittanceID FROM process.NationalJetFuelInvoiceControl WITH (NOLOCK) WHERE RemittanceID = @RemittanceID  AND MonthYear = @MonthYear AND Period = @Period AND (ReconciliationStatusCode = ''PROCESSED ERROR'' OR ReconciliationStatusCode = ''PROCESSED OK''))
		BEGIN
			SET @Deleted = 3
		END
		ELSE
		BEGIN
			DELETE	FROM Process.NationalJetFuelInvoiceDetail
			WHERE	RemittanceID = @RemittanceID
			  AND   MonthYear = @MonthYear
			  AND   Period = @Period;
			IF @@ERROR <> 0 GOTO ERRORS;

			DELETE	FROM Process.NationalJetFuelInvoicePolicy
			WHERE	RemittanceID = @RemittanceID
			  AND   MonthYear = @MonthYear
			  AND   Period = @Period;
			IF @@ERROR <> 0 GOTO ERRORS;

			DELETE	FROM Process.NationalJetFuelInvoiceControl
			WHERE	RemittanceID = @RemittanceID
			  AND   MonthYear = @MonthYear
			  AND   Period = @Period; 
			IF @@ERROR <> 0 GOTO ERRORS;

			SET @Deleted = 2;
		END;
	END;
END;

COMMIT TRAN DeleteTransac;

SET NOCOUNT OFF;    
SELECT	@Deleted;
RETURN; 

ERRORS:
ROLLBACK TRAN DeleteTransac;
SET NOCOUNT OFF;  
RAISERROR(''Error Executing Stored Procedure Process.DeleteNationalInvoice'', 18, 1); 
SELECT	@Deleted;

' 
END
GO
/****** Object:  StoredProcedure [Process].[DownloadCanditateInvoiceRecords]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DownloadCanditateInvoiceRecords]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ====================================================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 01 Diciembre 2016
-- Description:	Reporte Candidatos a Inconformidades
-- ====================================================================
-- [Process].[DownloadCanditateInvoiceRecords] ''16-2830'', ''0416'', ''01-06''
CREATE PROCEDURE [Process].[DownloadCanditateInvoiceRecords]
    @RemittanceID AS VARCHAR(8)
   ,@MonthYear AS VARCHAR(4)
   ,@Period AS VARCHAR(5) 
AS
    BEGIN

        SET NOCOUNT ON;		

		SELECT A.[ID]
			  ,A.[AirlineCode]
			  ,[ProviderNumber]
			  ,[ServiceCode]
			  ,[FederalTaxCode]
			  ,[StationCode]
			  ,A.[InvoiceNumber]
			  ,[CustomerNumber]
			  ,[CustomerName]
			  ,A.[InvoiceDate]
			  ,A.[ElectronicInvoiceNumber]
			  ,A.[ElectronicInvoiceDate]
			  ,[ProductNumber]
			  ,[ProductDescription]
			  ,[TicketNumber]
			  ,[OperationType]
			  ,[FlightNumber]
			  ,[EquipmentNumber]
			  ,[AirplaneModel]
			  ,[StartDateTime]
			  ,[EndDateTime]
			  ,[StartMeter]
			  ,[EndMeter]
			  ,[VolumeM3]
			  ,[RateType]
			  ,[JetFuelAmount]
			  ,[FreightAmount]
			  ,[DiscountAmount]
			  ,[FuelingAmount]
			  ,[SubtotalAmount]
			  ,[TaxAmount]
			  ,[TotalAmount]
			  ,[Status]
			  ,A.[ReconciliationStatus]
			  ,B.InvoiceCostVariance
		  FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
			   [Process].[NationalJetFuelReconciliationDetail] B ON (A.ID = B.InvoiceDetailID)
		 WHERE A.RemittanceID = @RemittanceID AND A.MonthYear = @MonthYear AND A.Period = @Period
		   AND ((A.[ReconciliationStatus] = ''DIFF'' AND B.InvoiceCostVariance > 0)
			OR (A.[ReconciliationStatus] = NULL OR A.ReconciliationStatus = ''PENDING''))

	
    END;

' 
END
GO
/****** Object:  StoredProcedure [Process].[DownloadNonReconciledCostGroup]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DownloadNonReconciledCostGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ====================================================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 03 Octubre 2016
-- Description:	Reporte Agrupado por vuelo 
---				del Proceso Calculo Jet Fuel no cociliados
-- EXEC [Process].[DownloadNonReconciledCostGroup] ''16-2832'', ''0416'', ''07-15''
-- ====================================================================
CREATE PROCEDURE [Process].[DownloadNonReconciledCostGroup]
    @RemittanceID AS VARCHAR(8)
   ,@MonthYear AS VARCHAR(4)
   ,@Period AS VARCHAR(5) 
AS
    BEGIN

        SET NOCOUNT ON;

		DECLARE @StartDate AS DATETIME
		DECLARE @EndDate AS DATETIME
			
		IF(TRY_PARSE(''20''+SUBSTRING(@MonthYear,3,2)+''/''+SUBSTRING(@MonthYear,1,2)+''/''+SUBSTRING(@Period,1,2) as datetime) IS NOT NULL 
		AND
		   TRY_PARSE(''20''+SUBSTRING(@MonthYear,3,2)+''/''+SUBSTRING(@MonthYear,1,2)+''/''+SUBSTRING(@Period,4,2) as datetime) IS NOT NULL)
		BEGIN
			SET @StartDate = TRY_PARSE(''20''+SUBSTRING(@MonthYear,3,2)+''/''+SUBSTRING(@MonthYear,1,2)+''/''+SUBSTRING(@Period,1,2) as datetime)
			--SELECT @StartDate

			SET @EndDate = TRY_PARSE(''20''+SUBSTRING(@MonthYear,3,2)+''/''+SUBSTRING(@MonthYear,1,2)+''/''+SUBSTRING(@Period,4,2) + '' 23:59:00'' as datetime)
			--SELECT @EndDate
		END
		ELSE 
		BEGIN
			--Default Mes-Año actual de GETDATE()
			SET @StartDate = CAST(YEAR(GETDATE()) AS VARCHAR)+CAST(MONTH(GETDATE()) AS VARCHAR)+''01''
			SET @StartDate = DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) 
			--SELECT @StartDate

			SET @EndDate = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0))
			--SELECT @EndDate
		END




        SELECT  '''' ID ,
		        A.[PeriodCode] ,
                A.[Sequence] ,
                A.[AirlineCode] ,
                A.[FlightNumber] ,
                A.[ItineraryKey] ,
                A.[EquipmentNumber] ,
                F.DepartureStation ,
                F.ArrivalStation ,
                [NationalJetFuelTicketID] ,
                CAST([FuelingStartDate] AS DATE) [FuelingStartDate] ,
                [FuelingStartTime] ,
                CAST([FuelingEndDate] AS DATE) [FuelingEndDate] ,
                [FuelingEndTime] ,
                [TicketNumber] ,
                [FueledQtyLts] ,
                [RemainingQtyKgs] ,
                [RequestedQtyKgs] ,
                [FueledQtyKgs] ,
                [DensityFactor] ,
                [ScheduleTypeCode] ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''PMX'' THEN ConceptAmount
                         ELSE 0
                    END) PemexSubTotal ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''SUMIN''
                         THEN ConceptAmount
                         ELSE 0
                    END) SuministroSubTotal ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''FLT'' THEN ConceptAmount
                         ELSE 0
                    END) FleteSubTotal ,
                16 Iva ,
                SUM(ConceptAmount) PrecioSubTotal ,
                SUM(ConceptAmount) * 1.16 Total
        FROM    [Process].[NationalJetFuelCost] A
                LEFT JOIN [Itinerary].[Itinerary] F ON ( A.Sequence = F.Sequence
                                                         AND A.AirlineCode = F.AirlineCode
                                                         AND A.FlightNumber = F.FlightNumber
                                                         AND A.ItineraryKey = F.ItineraryKey
                                                       )
		WHERE F.DepartureStation IN (SELECT [StationCode] 
		                               FROM [Process].[NationalJetFuelInvoiceDetail]
									  WHERE [RemittanceID] = @RemittanceID 
									    AND [MonthYear] = @MonthYear 
										AND [Period] = @Period
										AND ([ReconciliationStatus] IS NULL OR [ReconciliationStatus] = ''PENDING''))
		  AND A.[FuelingEndDate] BETWEEN @StartDate AND @EndDate
        GROUP BY [PeriodCode] ,
                A.[Sequence] ,
                A.[AirlineCode] ,
                A.[FlightNumber] ,
                A.[ItineraryKey] ,
                A.[EquipmentNumber] ,
                [NationalJetFuelTicketID] ,
                [FuelingStartDate] ,
                [FuelingStartTime] ,
                [FuelingEndDate] ,
                [FuelingEndTime] ,
                [ApronPosition] ,
                [TicketNumber] ,
                [FueledQtyLts] ,
                [RemainingQtyKgs] ,
                [RequestedQtyKgs] ,
                [FueledQtyKgs] ,
                [DensityFactor] ,
                [ScheduleTypeCode] ,
                F.DepartureStation ,
                F.ArrivalStation
	
    END;

' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelNationalProvisionReportDetail]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelNationalProvisionReportDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 2016 Mayo
-- Description:	Reporte Detallado del Proceso Calculo Jet Fuel
-- [Process].[JetFuelNationalProvisionReportDetail] ''Fuel201605'', ''Y4'','' '','' '','' ''
-- =============================================
CREATE PROCEDURE [Process].[JetFuelNationalProvisionReportDetail]
	-- Add the parameters for the stored procedure here
    @PeriodCode VARCHAR(30) ,
    @AirlineCodes VARCHAR(MAX) = '' '' ,
    @StationCodes VARCHAR(MAX) = '' '' ,
    @ServiceCodes VARCHAR(MAX) = '' '' ,
    @ProviderCodes VARCHAR(MAX) = '' ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

        SELECT  [PeriodCode] ,
                A.[Sequence] ,
                A.[AirlineCode] ,
                A.[FlightNumber] ,
                A.[ItineraryKey] ,
                A.[EquipmentNumber] ,
                F.DepartureStation ,
                F.ArrivalStation ,
                A.[OperationTypeID] ,
                B.[OperationName] ,
                [NationalJetFuelTicketID] ,
                [FuelingStartDate] ,
                [FuelingStartTime] ,
                [FuelingEndDate] ,
                [FuelingEndTime] ,
                [ApronPosition] ,
                [TicketNumber] ,
                [FueledQtyLts] ,
                [RemainingQtyKgs] ,
                [RequestedQtyKgs] ,
                [FueledQtyKgs] ,
                [DensityFactor] ,
                [ServiceCode] ,
                [ProviderNumberPrimary] ,
                [CurrencyCode] ,
                [CCNumber] ,
                [AccountingAccountNumber] ,
                [LiabilityAccountNumber] ,
                [NationalFuelContractConceptID] ,
                A.[FuelConceptID] ,
                C.FuelConceptName ,
                A.[FuelConceptTypeCode] ,
                D.FuelConceptTypeName ,
                A.[ChargeFactorTypeID] ,
                E.ChargeFactorTypeName ,
                [ProviderNumber] ,
                [Rate] ,
                [ConceptAmount] ,
				[ScheduleTypeCode],
                [PolicyID]
        FROM    [Process].[NationalJetFuelCost] A
                LEFT JOIN [Catalog].[OperationType] B ON ( A.OperationTypeID = B.OperationTypeID )
                LEFT JOIN [Airport].[FuelConcept] C ON ( A.FuelConceptID = C.FuelConceptID )
                LEFT JOIN [Airport].[FuelConceptType] D ON ( A.FuelConceptTypeCode = D.FuelConceptTypeCode )
                LEFT JOIN [Catalog].[ChargeFactorType] E ON ( A.ChargeFactorTypeID = E.ChargeFactorTypeID )
                LEFT JOIN [Itinerary].[Itinerary] F ON ( A.Sequence = F.Sequence
                                                         AND A.AirlineCode = F.AirlineCode
                                                         AND A.FlightNumber = F.FlightNumber
                                                         AND A.ItineraryKey = F.ItineraryKey
                                                       )
        WHERE   [PeriodCode] = @PeriodCode
                AND ( A.[AirlineCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@AirlineCodes, '','') )
                      OR @AirlineCodes = '' ''
                    )
                AND ( ( F.[DepartureStation] IN (
                        SELECT  splitdata
                        FROM    dbo.fnSplitString(@StationCodes, '','') )
                        OR @StationCodes = '' ''
                      )
                      OR ( F.ArrivalStation IN (
                           SELECT   splitdata
                           FROM     dbo.fnSplitString(@StationCodes, '','') )
                           OR @StationCodes = '' ''
                         )
                    )
                AND ( [ServiceCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@ServiceCodes, '','') )
                      OR @ServiceCodes = '' ''
                    )
                AND ( [ProviderNumberPrimary] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@ProviderCodes, '','') )
                      OR @ProviderCodes = '' ''
                    );



	
    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelNationalProvisionReportGroup]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelNationalProvisionReportGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 2016 Mayo
-- Description:	Reporte Agrupado por vuelo del Proceso Calculo Jet Fuel
-- EXEC [Process].[JetFuelNationalProvisionReportGroup] ''Fuel201605''
-- =============================================
CREATE PROCEDURE [Process].[JetFuelNationalProvisionReportGroup]
	-- Add the parameters for the stored procedure here
    @PeriodCode VARCHAR(30) ,
    @AirlineCodes VARCHAR(MAX) = '' '' ,
    @StationCodes VARCHAR(MAX) = '' '' ,
    @ServiceCodes VARCHAR(MAX) = '' '' ,
    @ProviderCodes VARCHAR(MAX) = '' ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

        SELECT  [PeriodCode] ,
                A.[Sequence] ,
                A.[AirlineCode] ,
                A.[FlightNumber] ,
                A.[ItineraryKey] ,
                A.[EquipmentNumber] ,
                F.DepartureStation ,
                F.ArrivalStation ,
                [NationalJetFuelTicketID] ,
                [FuelingStartDate] ,
                [FuelingStartTime] ,
                [FuelingEndDate] ,
                [FuelingEndTime] ,
                [TicketNumber] ,
                [FueledQtyLts] ,
                [RemainingQtyKgs] ,
                [RequestedQtyKgs] ,
                [FueledQtyKgs] ,
                [DensityFactor] ,
                [ScheduleTypeCode] ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''PMX'' THEN ConceptAmount
                         ELSE 0
                    END) PemexSubTotal ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''SUMIN''
                         THEN ConceptAmount
                         ELSE 0
                    END) SuministroSubTotal ,
                SUM(CASE WHEN [FuelConceptTypeCode] = ''FLT'' THEN ConceptAmount
                         ELSE 0
                    END) FleteSubTotal ,
                16 Iva ,
                SUM(ConceptAmount) PrecioSubTotal ,
                SUM(ConceptAmount) * 1.16 Total
        FROM    [Process].[NationalJetFuelCost] A
                LEFT JOIN [Itinerary].[Itinerary] F ON ( A.Sequence = F.Sequence
                                                         AND A.AirlineCode = F.AirlineCode
                                                         AND A.FlightNumber = F.FlightNumber
                                                         AND A.ItineraryKey = F.ItineraryKey
                                                       )
        WHERE   [PeriodCode] = @PeriodCode
                AND ( A.[AirlineCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@AirlineCodes, '','') )
                      OR @AirlineCodes = '' ''
                    )
                AND ( ( F.[DepartureStation] IN (
                        SELECT  splitdata
                        FROM    dbo.fnSplitString(@StationCodes, '','') )
                        OR @StationCodes = '' ''
                      )
                      OR ( F.ArrivalStation IN (
                           SELECT   splitdata
                           FROM     dbo.fnSplitString(@StationCodes, '','') )
                           OR @StationCodes = '' ''
                         )
                    )
                AND ( [ServiceCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@ServiceCodes, '','') )
                      OR @ServiceCodes = '' ''
                    )
                AND ( [ProviderNumberPrimary] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@ProviderCodes, '','') )
                      OR @ProviderCodes = '' ''
                    )
        GROUP BY [PeriodCode] ,
                A.[Sequence] ,
                A.[AirlineCode] ,
                A.[FlightNumber] ,
                A.[ItineraryKey] ,
                A.[EquipmentNumber] ,
                [NationalJetFuelTicketID] ,
                [FuelingStartDate] ,
                [FuelingStartTime] ,
                [FuelingEndDate] ,
                [FuelingEndTime] ,
                [ApronPosition] ,
                [TicketNumber] ,
                [FueledQtyLts] ,
                [RemainingQtyKgs] ,
                [RequestedQtyKgs] ,
                [FueledQtyKgs] ,
                [DensityFactor] ,
                [ScheduleTypeCode] ,
                F.DepartureStation ,
                F.ArrivalStation;


	
    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelNonconformityDocumentParameter]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelNonconformityDocumentParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 12/12/2016
-- Description: Revertir Nonconformity
-- =======================================================
-- [Process].[JetFuelNonconformityDocumentParameter] ''16-2830'', ''0416'', ''01-06'', ''20161212'', ''SEPTIEMBRE''
CREATE PROCEDURE [Process].[JetFuelNonconformityDocumentParameter]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5),
	@DocumentDate DATETIME,
	@Month VARCHAR(20)
AS
BEGIN

	DECLARE @Reference VARCHAR(15)
	DECLARE @AirlineCode VARCHAR(3)
	DECLARE @ProviderNumber VARCHAR(50)
	DECLARE @ServiceCode VARCHAR(50)
	DECLARE @Invoices VARCHAR(MAX)
	DECLARE @SubtotalAmount DECIMAL(18,5)
	DECLARE @Sequence BIGINT

	SELECT @Sequence = ISNULL(MAX(Sequence),0) FROM [Process].[Sequence]
	DELETE [Process].[Sequence]
	INSERT [Process].[Sequence] (Sequence) SELECT @Sequence+1
	
	SELECT @Reference = MIN(AirlineCode) + '' '' + RIGHT(''000000''+CAST((@Sequence+1) AS VARCHAR),6) + ''/'' + ''20'' + RIGHT(MIN(MonthYear),2),
	       @AirlineCode = MIN(AirlineCode),
		   @ProviderNumber = MIN(ProviderNumber),
		   @ServiceCode = MIN(ServiceCode)
	  FROM [Process].[NationalJetFuelInvoiceDetail]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period

	SELECT @Invoices = coalesce(@Invoices + '', '', '''') + CAST([InvoiceNumber] AS VARCHAR)
	  FROM [Process].[NationalJetFuelInvoiceDetail]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND NonconformityFlag = 1

	SELECT @SubtotalAmount = NonconformitySubtotalAmount
	  FROM [Process].[NationalJetFuelInvoiceControl]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period

	PRINT @Reference 
	PRINT @AirlineCode
	PRINT @ProviderNumber
	PRINT @ServiceCode

	--Update Reference en Control
	UPDATE [Process].[NationalJetFuelInvoiceControl]
	   SET [NonconformityReference] = @Reference
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period

	--parametros para reporte
	SELECT TOP 1 [AirlineCode]
		  ,A.[ServiceCode]
		  ,[ProviderNumber]
		  ,[DocumentTitle]
		  ,[Receiver]
		  ,[ReceiverAddress]
		  ,[Location]
		  ,[OpeningText]
		  ,[ClosingText]
		  ,[Sender]
		  ,[CcSection]
		  ,[AirlineAddress]
		  ,@DocumentDate DocumentDate
		  ,@Reference Reference
		  ,@Month [Month]
		  ,B.ServiceName [Service]
		  ,@Invoices Invoices
		  ,@SubtotalAmount [NonconformitySubtotalAmount]
	  FROM [Process].[NonconformityDocumentParameter] A LEFT JOIN
	       [Airport].[Service] B ON (A.[ServiceCode] = B.[ServiceCode])
	 WHERE [AirlineCode] = @AirlineCode
       AND A.[ServiceCode] = @ServiceCode
	   AND [ProviderNumber] = @ProviderNumber

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelNonconformityRevert]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelNonconformityRevert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 06/12/2016
-- Description: Revertir Nonconformity
-- =======================================================
-- [Process].[JetFuelNonconformityRevert] ''16-2831'', ''0416'', ''01-06''
CREATE PROCEDURE [Process].[JetFuelNonconformityRevert]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
BEGIN


	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period
				  AND NonconformityStatusCode = ''CLOSED'')
		BEGIN
			SELECT 1 [Verify] --No es vible debido a que la Remesa se encuentra cerrrada para conciliación
			--Remittance is closed
		END
		ELSE
		BEGIN
			--IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
			--			WHERE RemittanceID = @RemittanceID
			--			AND MonthYear = @MonthYear
			--			AND Period = @Period 
			--			AND [Status] = ''ERRO'')
			--BEGIN
			--	SELECT 2 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
			--	--Different errors to invalid Equipment Number
			--END
			--ELSE 
			BEGIN		
				
	
				--step 0.1 Borrar de Log de la remesa seleccionada
				DELETE FROM [Process].[NationalJetFuelNonconformityLoadLog]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
	
				--step 1 Nullear [ReconciliationStatus] en tabla [Process].[NationalJetFuelInvoiceDetail]
				UPDATE [Process].[NationalJetFuelInvoiceDetail]
				   SET [NonconformityFlag] = NULL
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
				

				--step 2 Actualizar Status [NationalJetFuelInvoiceControl] a Revert
				UPDATE [Process].[NationalJetFuelInvoiceControl]
				   SET [CountNonconformityRecords] = NULL,
				       [NonconformitySubtotalAmount] = NULL,
					   [DateNonconformity] = NULL,
					   [NonconformityStatusCode] = NULL
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period

				SELECT 0 [Verify] --En caso EXITOSO continua proceso

			END

		END	        

	

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelPolicyDetail]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelPolicyDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 17/04/2016
-- Description:	Reporte detalle policy provisiones
-- ==================================================
-- [Process].[JetFuelPolicyDetail] 62
CREATE PROCEDURE [Process].[JetFuelPolicyDetail]
	-- Add the parameters for the stored procedure here
	@PolicyID AS BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [PolicyResultID]
      ,[PolicyID]
      ,[DocumentNumber]
      ,[JetFuelTicketID]
      ,[TPREC]
	  ,CASE WHEN [JetFuelTicketID] IS NULL AND NEWBS = ''40'' THEN ''Complementary''
	        WHEN [JetFuelTicketID] IS NOT NULL AND NEWBS = ''40'' THEN ''Real'' 
	        ELSE '''' END Calculation
      ,[IDREG]
      ,[BLDAT]
      ,[BLART]
      ,[BUKRS]
      ,[BUDAT]
      ,[WAERS]
      ,[KURSF]
      ,[XBLNR]
      ,[BKTXT]
      ,[NEWBS]
      ,[NEWKO]
      ,[NEWUM]
      ,[NEWBK]
      ,[WRBTR]
      ,[DMBE2]
      ,[MWSKZ]
      ,[XMWST]
      ,[GSBER]
      ,[KOSTL]
      ,[AUFNR]
      ,[PRCTR]
      ,[FKBER]
      ,[SEGMENT]
      ,[WERKS]
      ,[FISTL]
      ,[ZFBDT]
      ,[VALUT]
      ,[ZUONR]
      ,[SGTXT]
      ,[MENGE]
      ,[MEINS]
      ,[GEBER]
      ,[NOTOTAL]
      ,[LIFNR]
      ,[KUNNR]
      ,[ANRED]
      ,[NAME1]
      ,[NAME2]
      ,[NAME3]
      ,[BANKL]
      ,[BANKN]
      ,[ZLSCH]
      ,[BKREF]
      ,[BELNR]
      ,[XBLNR2]
      ,[MENV]
      ,[MSGID]
      ,[RFCLOG]
  FROM [Process].[JetFuelPolicy]
 WHERE PolicyID = @PolicyID

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelProvisionError]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelProvisionError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 2016 Julio 12
-- Description:	Reporte de errores nacional Cost
-- [Process].[JetFuelProvisionError] ''Fuel201605'', ''Y4''
-- =============================================
CREATE PROCEDURE [Process].[JetFuelProvisionError]
    @PeriodCode VARCHAR(30) ,
    @AirlineCodes VARCHAR(MAX) = '' '' --,
    --@ServiceCodes VARCHAR(MAX) = '' ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

        SELECT [LogID]
			  ,[PeriodCode]
			  ,[LineNumber]
			  ,[Description]
			  ,A.[Sequence]
			  ,A.[AirlineCode]
			  ,A.[FlightNumber]
			  ,A.[ItineraryKey]
			  ,A.[EquipmentNumber]
			  ,B.DepartureStation
			  ,B.ArrivalStation
			  ,[OperationTypeID]
			  ,[JetFuelTicketID]
			  ,[FuelingDate]
			  ,[TicketNumber]
			  ,[FueledQtyGals]
			  ,[ServiceCode]
			  ,[ProviderNumberPrimary]
			  ,[InternationalFuelContractConceptID]
			  ,[FuelConceptID]
			  ,[FuelConceptTypeCode]
			  ,[ChargeFactorTypeID]
			  ,[ProviderNumber]
			  ,[Rate]
		  FROM [Process].[JetFuelLogError] A LEFT JOIN 
		       [Itinerary].[Itinerary] B ON ( A.Sequence = B.Sequence
                                                         AND A.AirlineCode = B.AirlineCode
                                                         AND A.FlightNumber = B.FlightNumber
                                                         AND A.ItineraryKey = B.ItineraryKey
                                                       )
        WHERE   [PeriodCode] = @PeriodCode
                AND ( A.[AirlineCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@AirlineCodes, '','') )
                      OR @AirlineCodes = '' ''
                    )                
                --AND ( [ServiceCode] IN (
                --      SELECT    splitdata
                --      FROM      dbo.fnSplitString(@ServiceCodes, '','') )
                --      OR @ServiceCodes = '' ''
                --    );
	
    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelProvisionReportDetail]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelProvisionReportDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Luis Alvarez del Castillo Bermudez Alcabelu
-- Create date: 2016 03 Marzo 22
-- Description:	Reporte Detallado del Proceso Calculo Jet Fuel
-- [Process].[JetFuelProvisionReportDetail] ''Fuel201512'', ''Y4'',''DEN,GDL'','' '','' ''
-- =============================================
CREATE PROCEDURE [Process].[JetFuelProvisionReportDetail]
	-- Add the parameters for the stored procedure here
	@PeriodCode varchar(30),
	@AirlineCodes VARCHAR(MAX) = '' '',
	@StationCodes VARCHAR(MAX) = '' '',
	@ServiceCodes VARCHAR(MAX) = '' '',
	@ProviderCodes VARCHAR(MAX) = '' ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
         [PeriodCode]
        ,A.[Sequence]
        ,A.[AirlineCode]
        ,A.[FlightNumber]
        ,A.[ItineraryKey]
        ,A.[EquipmentNumber]
		,F.DepartureStation
		,F.ArrivalStation
        ,A.[OperationTypeID]
		,B.[OperationName]
        ,[JetFuelTicketID]
        ,[FuelingDate]
        ,[FuelingTime]
        ,[ApronPosition]
        ,[TicketNumber]
        ,[FueledQtyGals]
      ,[RemainingQry]
      ,[RequestedQry]
      ,[FueledQry]
      ,[DensityFactor]
      ,[ServiceCode]
      ,[ProviderNumberPrimary]
      ,[CurrencyCode]
      ,[CCNumber]
      ,[AccountingAccountNumber]
      ,[LiabilityAccountNumber]
      ,[InternationalFuelContractConceptID]
      ,A.[FuelConceptID]
	  ,C.FuelConceptName
      ,A.[FuelConceptTypeCode]
	  ,D.FuelConceptTypeName
      ,A.[ChargeFactorTypeID]
	  ,E.ChargeFactorTypeName
      ,[ProviderNumber]
      ,[Rate]
      ,[ConceptAmount]
      ,[PolicyID]
  FROM [Process].[JetFuelProvision] A LEFT JOIN
       [Catalog].[OperationType] B ON (A.OperationTypeID = B.OperationTypeID) LEFT JOIN
	   [Airport].[FuelConcept] C ON (A.FuelConceptID = C.FuelConceptID) LEFT JOIN
	   [Airport].[FuelConceptType] D ON (A.FuelConceptTypeCode = D.FuelConceptTypeCode) LEFT JOIN
	   [Catalog].[ChargeFactorType] E ON (A.ChargeFactorTypeID = E.ChargeFactorTypeID) LEFT JOIN
	   [Itinerary].[Itinerary] F ON (A.Sequence = F.Sequence AND A.AirlineCode = F.AirlineCode AND A.FlightNumber = F.FlightNumber AND  A.ItineraryKey = F.ItineraryKey)
  WHERE [PeriodCode] = @PeriodCode
    AND (A.[AirlineCode] in (select splitdata from dbo.fnSplitString(@AirlineCodes,'','')) OR @AirlineCodes = '' '')
	AND ((F.[DepartureStation] in (select splitdata from dbo.fnSplitString(@StationCodes,'','')) OR @StationCodes = '' '') OR (F.ArrivalStation in (select splitdata from dbo.fnSplitString(@StationCodes,'','')) OR @StationCodes = '' ''))
	AND ([ServiceCode] in (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) OR @ServiceCodes = '' '')
	AND ([ProviderNumberPrimary] in (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) OR @ProviderCodes = '' '')



	
END' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelProvisionReportGroup]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelProvisionReportGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Luis Alvarez del Castillo Bermudez Alcabelu
-- Create date: 2016 03 Marzo 22
-- Description:	Reporte Agrupado por vuelo del Proceso Calculo Jet Fuel
-- EXEC [Process].[JetFuelProvisionReportGroup] Fuel201512
-- =============================================
CREATE PROCEDURE [Process].[JetFuelProvisionReportGroup]
	-- Add the parameters for the stored procedure here
	@PeriodCode varchar(30),
	@AirlineCodes VARCHAR(MAX) = '' '',
	@StationCodes VARCHAR(MAX) = '' '',
	@ServiceCodes VARCHAR(MAX) = '' '',
	@ProviderCodes VARCHAR(MAX) = '' ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here



SELECT [PeriodCode]
        ,A.[Sequence]
        ,A.[AirlineCode]
        ,A.[FlightNumber]
		,A.[ItineraryKey]
        ,A.[EquipmentNumber]
		,F.DepartureStation
		,F.ArrivalStation
        ,[JetFuelTicketID]
        ,[FuelingDate]
        ,[FuelingTime]
        ,[TicketNumber]
        ,[FueledQtyGals]
        ,[RemainingQry]
        ,[RequestedQry]
        ,[FueledQry]
        ,[DensityFactor]
		,SUM(CASE WHEN [FuelConceptTypeCode] = ''JTFL'' THEN ConceptAmount ELSE 0 END) JetFuelTotal
		,SUM(CASE WHEN [FuelConceptTypeCode] = ''INTPL'' THEN ConceptAmount ELSE 0 END) IntoPlaneTotal
		,SUM(CASE WHEN [FuelConceptTypeCode] = ''FEE'' THEN ConceptAmount ELSE 0 END) FeesTotal
		,SUM(CASE WHEN [FuelConceptTypeCode] = ''TAX'' THEN ConceptAmount ELSE 0 END) TaxesTotal
		,SUM(CASE WHEN [FuelConceptTypeCode] = ''DIFF'' THEN ConceptAmount ELSE 0 END) DifferentialTotal
		,SUM(ConceptAmount) Total
  FROM [Process].[JetFuelProvision] A LEFT JOIN
	   [Itinerary].[Itinerary] F ON (A.Sequence = F.Sequence AND A.AirlineCode = F.AirlineCode AND A.FlightNumber = F.FlightNumber AND  A.ItineraryKey = F.ItineraryKey)
  WHERE [PeriodCode] = @PeriodCode
    AND (A.[AirlineCode] in (select splitdata from dbo.fnSplitString(@AirlineCodes,'','')) OR @AirlineCodes = '' '')
	AND ((F.[DepartureStation] in (select splitdata from dbo.fnSplitString(@StationCodes,'','')) OR @StationCodes = '' '') OR (F.ArrivalStation in (select splitdata from dbo.fnSplitString(@StationCodes,'','')) OR @StationCodes = '' ''))
	AND ([ServiceCode] in (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) OR @ServiceCodes = '' '')
	AND ([ProviderNumberPrimary] in (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) OR @ProviderCodes = '' '')
  GROUP BY [PeriodCode]
        ,A.[Sequence]
        ,A.[AirlineCode]
        ,A.[FlightNumber]
		,A.[ItineraryKey]
        ,A.[EquipmentNumber]
        ,[JetFuelTicketID]
        ,[FuelingDate]
        ,[FuelingTime]
        ,[ApronPosition]
        ,[TicketNumber]
        ,[FueledQtyGals]
        ,[RemainingQry]
        ,[RequestedQry]
        ,[FueledQry]
        ,[DensityFactor]
		,F.DepartureStation
		,F.ArrivalStation


	
END' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliation]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================
-- Author: Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 20160831
-- Description:	Proceso de Conciliación
-- EXEC [Process].[JetFuelReconciliation]  ''16-2830'', ''0416'', ''01-06'', 1
-- ==========================================================
CREATE PROCEDURE [Process].[JetFuelReconciliation]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5),
    @TypeProcess INT
AS
    BEGIN

        --SET NOCOUNT ON; 


		IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period
				  AND ConfirmationStatusCode = ''CLO'')
		BEGIN
			SELECT 1 [Verify] --No es vible debido a que la Remesa se encuentra cerrrada para conciliación
			--Remittance is closed
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
						WHERE RemittanceID = @RemittanceID
						AND MonthYear = @MonthYear
						AND Period = @Period 
						AND [Status] = ''ERRO'')
			BEGIN
				SELECT 2 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
				--Different errors to invalid Equipment Number
			END
			ELSE 
			BEGIN		
				

				IF @TypeProcess = 1
				BEGIN
					EXEC [Process].[JetFuelReconciliationTotal] @RemittanceID, @MonthYear, @Period;
				END;
	
				IF @TypeProcess = 2
					BEGIN
						EXEC [Process].[JetFuelReconciliationPending] @RemittanceID, @MonthYear, @Period;
					END;

				IF @TypeProcess = 3
					BEGIN
						EXEC [Process].[JetFuelReconciliationRevert] @RemittanceID, @MonthYear, @Period;
					END;

				SELECT 0 [Verify] --En caso EXITOSO continua proceso

			END

		END	        

        --SET NOCOUNT OFF;
        --RETURN 0;

    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationManualRevert]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationManualRevert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20161006
-- Description: Revertir Conciliacion Manual
-- =======================================================
-- [Process].[JetFuelReconciliationManualRevert] ''16-2830'', ''0416'', ''01-06''
CREATE PROCEDURE [Process].[JetFuelReconciliationManualRevert]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
BEGIN

	--step 0 Registros conciliados automaticamente
	DECLARE @AutomaticIDs AS TABLE (ID BIGINT)

	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period
				  AND ConfirmationStatusCode = ''CLO'')
		BEGIN
			SELECT 1 [Verify] --No es vible debido a que la Remesa se encuentra cerrrada para conciliación
			--Remittance is closed
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
						WHERE RemittanceID = @RemittanceID
						AND MonthYear = @MonthYear
						AND Period = @Period 
						AND [Status] = ''ERRO'')
			BEGIN
				SELECT 2 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
				--Different errors to invalid Equipment Number
			END
			ELSE 
			BEGIN		
				

				INSERT INTO @AutomaticIDs (ID)
				SELECT [InvoiceDetailID]
				  FROM [Process].[NationalJetFuelReconciliationDetail]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
				   AND [ReconciliationType] = ''AUTOMATIC''
	
				--step 0.1 Borrar de Log de la remesa seleccionada
				DELETE FROM [Process].[NationalJetFuelReconciliationManualLoadLog]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
	
				--step 1 Nullear [ReconciliationStatus] en tabla [Process].[NationalJetFuelInvoiceDetail]
				UPDATE [Process].[NationalJetFuelInvoiceDetail]
				   SET [ReconciliationStatus] = NULL
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
				   AND ID NOT IN (SELECT ID FROM @AutomaticIDs)

				--step 2 Nullear [ReconciliationStatus] en tabla [Process].[NationalJetFuelInvoiceDetail]
				UPDATE [Process].[NationalJetFuelCost]
				   SET [ReconciliationStatus] = NULL,
					   [InvoiceDetailID] = NULL	      
				 WHERE [InvoiceDetailID] IN (SELECT ID 
											   FROM [Process].[NationalJetFuelInvoiceDetail]
											  WHERE RemittanceID = @RemittanceID
												AND MonthYear = @MonthYear
												AND Period = @Period
												AND ID NOT IN (SELECT ID FROM @AutomaticIDs))

				--step 3 Delete Registros en 
				DELETE FROM [Process].[NationalJetFuelReconciliationDetail]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
				   AND [InvoiceDetailID] NOT IN (SELECT ID FROM @AutomaticIDs)

				--step 4 Actualizar Status [NationalJetFuelInvoiceControl] a Revert
				UPDATE [Process].[NationalJetFuelInvoiceControl]
				   SET [CountRecords] = NULL
					  ,CountReconciledRecords = (SELECT COUNT(InvoiceSubtotalAmount) FROM [Process].[NationalJetFuelReconciliationDetail]
	                                    WHERE RemittanceID = @RemittanceID AND MonthYear = @MonthYear AND Period = @Period)
					  ,ReconciledSubtotalAmount = (SELECT SUM(InvoiceSubtotalAmount) FROM [Process].[NationalJetFuelReconciliationDetail]
	                                    WHERE RemittanceID = @RemittanceID AND MonthYear = @MonthYear AND Period = @Period)
					  ,StatusProcessCode = ''REV''
					  ,[ReconciliationStatusCode] = ''REVERTED''
					  ,[ProcessProgress] = NULL
					  ,[StartDateProcess] = NULL
					  ,[EndDateProcess] = NULL
					  ,[CalculationStatusCode] = ''PEN''
					  ,[RecordsToProcess] = NULL
					  ,[RecordsProcessed] = NULL
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period

				SELECT 0 [Verify] --En caso EXITOSO continua proceso

			END

		END	        

	

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationPending]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationPending]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 20160831
-- Description:	Procesar Pendiente (Conciliación)
-- =============================================
-- [Process].[JetFuelReconciliationPending] ''16-2830'', ''0416'', ''01-06''
CREATE PROCEDURE [Process].[JetFuelReconciliationPending]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
BEGIN
	--Step 0 Inicializar Variables
	DECLARE @NumberRecordsProcess INT; 
	DECLARE @NumberRecordsTotal INT;
    DECLARE @Percentage INT; 
	DECLARE @SubtotalAmount DECIMAL(18,2)
	DECLARE @Pending AS TABLE (ID BIGINT)


	BEGIN TRANSACTION; 
	BEGIN TRY 
	
	--Step 1 Total de Registros en Invoice Detail 
	SELECT @NumberRecordsTotal = COUNT([ID]) 
      FROM [Process].[NationalJetFuelInvoiceDetail]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

	--Step 2 Guardar info de los ID pendientes
	INSERT INTO @Pending (ID)
	SELECT ID  
	  FROM [Process].[NationalJetFuelInvoiceDetail]
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ([ReconciliationStatus] = ''PENDING'' OR [ReconciliationStatus] IS NULL)

	--Step 3 Indicar que inicia el proceso
	UPDATE [Process].[NationalJetFuelInvoiceControl]
       SET StartDateProcess = GETDATE(),
           RecordsToProcess = @NumberRecordsTotal,
		   CountRecords = @NumberRecordsTotal,
		   DateReconciled = GETDATE(),
           StatusProcessCode = ''RUN''
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

	--Step 4 Primer criterio de conciliación 
	
	--Step 4.1 Insert [NationalJetFuelReconciliationDetail]
	INSERT INTO [Process].[NationalJetFuelReconciliationDetail]
           ([InvoiceDetailID]
           ,[RemittanceID]
           ,[MonthYear]
           ,[Period]
           ,[AirlineCode]
           ,[InvoiceStationCode]
           ,[InvoiceNumber]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[InvoiceTicketNumber]
           ,[InvoiceFlightNumber]
           ,[InvoiceEquipmentNumber]
           ,[InvoiceVolumeM3]
           ,[InvoiceSubtotalAmount]
           ,[PeriodCode]
           ,[CostTicketNumber]
           ,[CostDepartureDate]
           ,[CostFlightNumber]
           ,[CostEquipmentNumber]
           ,[DepartureStation]
           ,[ArrivalStation]
           ,[CostFueledQtyLts]
           ,[CostConceptAmount]
           ,[InvoiceCostVariance]
           ,[ReconciliationType]
           ,[ReconciliationStatus])
	SELECT [ID]
		  ,[RemittanceID]
		  ,[MonthYear]
		  ,[Period]
		  ,[AirlineCode]
		  ,[StationCode]
		  ,[InvoiceNumber]
		  ,[InvoiceDate]
		  ,[ElectronicInvoiceNumber]
		  ,[ElectronicInvoiceDate]
		  ,[TicketNumber]
		  ,[FlightNumber]
		  ,[EquipmentNumber]
		  ,[VolumeM3]
		  ,[SubtotalAmount]
		  ,[PeriodCode]
		  ,[CostTicketNumber]
		  ,[DepartureDate]
		  ,[CostFlightNumber]
		  ,[CostEquipmentNumber]
		  ,[DepartureStation]
		  ,[ArrivalStation]
		  ,[FueledQtyLts]
		  ,[ConceptAmount]
		  ,[Variance]
		  ,''AUTOMATIC'' [ReconciliationType]
		  ,[Status]
	  FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ID IN (SELECT ID FROM @Pending);

	--Cuantos registros inserto y SUM de SubtotalAmount
	SET @NumberRecordsProcess = @@ROWCOUNT; 

	SET @SubtotalAmount = (SELECT SUM(SubtotalAmount) 
	                         FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	                        WHERE RemittanceID = @RemittanceID
	                          AND MonthYear = @MonthYear
						      AND Period = @Period
							  AND ID IN (SELECT ID FROM @Pending));


	--Step 4.2 Update [NationalJetFuelInvoiceDetail] MATCHED
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = B.[Status]
	  FROM [Process].[NationalJetFuelInvoiceDetail] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationFirst] B ON (A.ID = B.ID)
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending);	
	   
	--Step 4.3 Update [NationalJetFuelCost] MATCHED
	UPDATE [Process].[NationalJetFuelCost]
	   SET [ReconciliationStatus] = B.[Status],
	       [InvoiceDetailID] = B.[ID]
	  FROM [Process].[NationalJetFuelCost] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationFirst] B  ON (A.[PeriodCode] = B.[PeriodCode] AND
																   A.[AirlineCode] = B.[CostAirlineCode] AND
																   A.[FlightNumber] = B.[CostFlightNumber] AND
																   A.[TicketNumber] = B.[CostTicketNumber] AND
																   A.[EquipmentNumber] = B.[CostEquipmentNumber])
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending);			
	  

	--Step 4.4 Update Control (Porcentaje, CountReconciledRecords y ReconciledSubtotalAmount)
	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess,
				[CountReconciledRecords] = ISNULL([CountReconciledRecords], 0)
                + @NumberRecordsProcess,
				[ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
                + @SubtotalAmount
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 	  	


	--Step 5 Segundo criterio de conciliación 
	
	--Step 5.1 Insert [NationalJetFuelReconciliationDetail]
	INSERT INTO [Process].[NationalJetFuelReconciliationDetail]
           ([InvoiceDetailID]
           ,[RemittanceID]
           ,[MonthYear]
           ,[Period]
           ,[AirlineCode]
           ,[InvoiceStationCode]
           ,[InvoiceNumber]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[InvoiceTicketNumber]
           ,[InvoiceFlightNumber]
           ,[InvoiceEquipmentNumber]
           ,[InvoiceVolumeM3]
           ,[InvoiceSubtotalAmount]
           ,[PeriodCode]
           ,[CostTicketNumber]
           ,[CostDepartureDate]
           ,[CostFlightNumber]
           ,[CostEquipmentNumber]
           ,[DepartureStation]
           ,[ArrivalStation]
           ,[CostFueledQtyLts]
           ,[CostConceptAmount]
           ,[InvoiceCostVariance]
           ,[ReconciliationType]
           ,[ReconciliationStatus])
	SELECT [ID]
		  ,[RemittanceID]
		  ,[MonthYear]
		  ,[Period]
		  ,[AirlineCode]
		  ,[StationCode]
		  ,[InvoiceNumber]
		  ,[InvoiceDate]
		  ,[ElectronicInvoiceNumber]
		  ,[ElectronicInvoiceDate]
		  ,[TicketNumber]
		  ,[FlightNumber]
		  ,[EquipmentNumber]
		  ,[VolumeM3]
		  ,[SubtotalAmount]
		  ,[PeriodCode]
		  ,[CostTicketNumber]
		  ,[DepartureDate]
		  ,[CostFlightNumber]
		  ,[CostEquipmentNumber]
		  ,[DepartureStation]
		  ,[ArrivalStation]
		  ,[FueledQtyLts]
		  ,[ConceptAmount]
		  ,[Variance]
		  ,''AUTOMATIC'' [ReconciliationType]
		  ,[Status]
	  FROM [Process].[VW_NationalJetFuelReconciliationSecond]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ID IN (SELECT ID FROM @Pending)
	   AND ID NOT IN (SELECT ID 
	                    FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	                   WHERE RemittanceID = @RemittanceID
	                     AND MonthYear = @MonthYear
	                     AND Period = @Period
						 AND ID IN (SELECT ID FROM @Pending));	   

	--Cuantos registros inserto y SUM de SubtotalAmount
	SET @NumberRecordsProcess = @@ROWCOUNT; 

	SET @SubtotalAmount = (SELECT SUM(SubtotalAmount) 
	                         FROM [Process].[VW_NationalJetFuelReconciliationSecond]
	                        WHERE RemittanceID = @RemittanceID
							   AND MonthYear = @MonthYear
							   AND Period = @Period
							   AND ID IN (SELECT ID FROM @Pending)
							   AND ID NOT IN (SELECT ID 
												FROM [Process].[VW_NationalJetFuelReconciliationFirst]
											   WHERE RemittanceID = @RemittanceID
												 AND MonthYear = @MonthYear
												 AND Period = @Period
												 AND ID IN (SELECT ID FROM @Pending)));


	--Step 5.2 Update [NationalJetFuelInvoiceDetail] MATCHED
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = B.[Status]
	  FROM [Process].[NationalJetFuelInvoiceDetail] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationSecond] B ON (A.ID = B.ID)
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending)
	   AND B.ID NOT IN (SELECT ID 
						FROM [Process].[VW_NationalJetFuelReconciliationFirst]
						WHERE RemittanceID = @RemittanceID
							AND MonthYear = @MonthYear
							AND Period = @Period
							AND ID IN (SELECT ID FROM @Pending));	
	   
	--Step 5.3 Update [NationalJetFuelCost] MATCHED
	UPDATE [Process].[NationalJetFuelCost]
	   SET [ReconciliationStatus] = B.[Status],
	       [InvoiceDetailID] = B.[ID]
	  FROM [Process].[NationalJetFuelCost] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationSecond] B  ON (A.[PeriodCode] = B.[PeriodCode] AND
																   A.[AirlineCode] = B.[CostAirlineCode] AND
																   A.[FlightNumber] = B.[CostFlightNumber] AND
																   A.[TicketNumber] = B.[CostTicketNumber] AND
																   A.[EquipmentNumber] = B.[CostEquipmentNumber])
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending)
	   AND B.ID NOT IN (SELECT ID 
						FROM [Process].[VW_NationalJetFuelReconciliationFirst]
						WHERE RemittanceID = @RemittanceID
							AND MonthYear = @MonthYear
							AND Period = @Period
							AND ID IN (SELECT ID FROM @Pending));	
	  

	--Step 5.4 Update Control (Porcentaje, CountReconciledRecords y ReconciledSubtotalAmount)
	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess,
				[CountReconciledRecords] = ISNULL([CountReconciledRecords], 0)
                + @NumberRecordsProcess,
				[ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
                + @SubtotalAmount
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 
	

	--Step 7 Los que no cumplieron con los 2 criterios, se cuentan los restantes
	SELECT  @NumberRecordsProcess = @NumberRecordsTotal
                    - ( SELECT  ISNULL([RecordsProcessed], 0)
                        FROM    [Process].[NationalJetFuelInvoiceControl]
                        WHERE   RemittanceID = @RemittanceID
	                        AND MonthYear = @MonthYear
	                        AND Period = @Period
                      );	

	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 

	--Step 8 Cuando no hay registros a procesar (Idealmente en Remesas siempre hay registros)
	IF ( @NumberRecordsProcess = 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = @NumberRecordsTotal
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = 100.00
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 


	--Step 9 INDICAR QUE EL PROCESO TERMINO EN STATUS DE PROCESO  --FIN CODE DE TABLA [PROCESS].[STATUSPROCESS] 
    UPDATE [Process].[NationalJetFuelInvoiceControl]
       SET StatusProcessCode = ''FIN'',
           EndDateProcess = GETDATE(),
		   [CountReconciledRecords] = ISNULL([CountReconciledRecords], 0),
	       [ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

	--Step 10 Los registros que no conciliaron se marcan como PENDING
	--Si ya existieran pendientes despues del proceso se mantienen
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = ''PENDING''
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND [ReconciliationStatus] IS NULL;


	--STEP 11 REVISAR SI EL PROCESO FUE OK O TERMINO CON REGISTROS ERRONEOS 
    DECLARE @numError INT; 

    SELECT  @numError = COUNT(CASE WHEN [ReconciliationStatus] = ''PENDING'' THEN 1 ELSE 0 END)
    FROM    [Process].[NationalJetFuelInvoiceDetail]
    WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

    IF (@numError > 0 )
        BEGIN 
            UPDATE  [Process].[NationalJetFuelInvoiceControl]
            SET     [CalculationStatusCode] = ''ERR'', --CALCULATED WITH ERRORS 			        
			        [ReconciliationStatusCode] = ''PROCESSED ERROR''
            WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;
        END; 
    ELSE
        BEGIN 
            UPDATE  [Process].[NationalJetFuelInvoiceControl]
            SET     [CalculationStatusCode] = ''CAL'', --CALCULATED 
			        [ReconciliationStatusCode] = ''PROCESSED OK''
            WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;
        END; 

	END TRY 

	BEGIN CATCH 
		IF @@TRANCOUNT > 0
			BEGIN 
				ROLLBACK TRANSACTION; 
			END; 
	END CATCH; 

    IF @@TRANCOUNT > 0
        BEGIN 
            COMMIT TRANSACTION; 
        END; 

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationRevert]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationRevert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160826
-- Description: Revertir Conciliacion
-- =======================================================
CREATE PROCEDURE [Process].[JetFuelReconciliationRevert]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
BEGIN

	--step 0 Registros conciliados manualmente
	DECLARE @ManualIDs AS TABLE (ID BIGINT)

	INSERT INTO @ManualIDs (ID)
	SELECT [InvoiceDetailID]
	  FROM [Process].[NationalJetFuelReconciliationDetail]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND [ReconciliationType] = ''MANUAL''
	
	--step 1 Nullear [ReconciliationStatus] en tabla [Process].[NationalJetFuelInvoiceDetail]
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = NULL
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ID NOT IN (SELECT ID FROM @ManualIDs)

	--step 2 Nullear [ReconciliationStatus] en tabla [Process].[NationalJetFuelInvoiceDetail]
	UPDATE [Process].[NationalJetFuelCost]
	   SET [ReconciliationStatus] = NULL,
	       [InvoiceDetailID] = NULL	      
     WHERE [InvoiceDetailID] IN (SELECT ID 
	                               FROM [Process].[NationalJetFuelInvoiceDetail]
								  WHERE RemittanceID = @RemittanceID
	                                AND MonthYear = @MonthYear
	                                AND Period = @Period
								    AND ID NOT IN (SELECT ID FROM @ManualIDs))

	--step 3 Delete Registros en 
	DELETE FROM [Process].[NationalJetFuelReconciliationDetail]
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND [InvoiceDetailID] NOT IN (SELECT ID FROM @ManualIDs)

	--step 4 Actualizar Status [NationalJetFuelInvoiceControl] a Revert
	UPDATE [Process].[NationalJetFuelInvoiceControl]
	   SET [CountRecords] = NULL
	      ,CountReconciledRecords = (SELECT COUNT(InvoiceSubtotalAmount) FROM [Process].[NationalJetFuelReconciliationDetail]
	                                    WHERE RemittanceID = @RemittanceID AND MonthYear = @MonthYear AND Period = @Period)
		  ,ReconciledSubtotalAmount = (SELECT SUM(InvoiceSubtotalAmount) FROM [Process].[NationalJetFuelReconciliationDetail]
										WHERE RemittanceID = @RemittanceID AND MonthYear = @MonthYear AND Period = @Period)
	      ,StatusProcessCode = ''REV''
		  ,[ReconciliationStatusCode] = ''REVERTED''
		  ,[ProcessProgress] = NULL
		  ,[StartDateProcess] = NULL
		  ,[EndDateProcess] = NULL
		  ,[CalculationStatusCode] = ''PEN''
		  ,[RecordsToProcess] = NULL
	      ,[RecordsProcessed] = NULL
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationTotal]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationTotal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 20160831
-- Description:	Procesar Todo (Conciliación)
-- =============================================
-- [Process].[JetFuelReconciliationTotal] ''16-2830'', ''0416'', ''01-06''
CREATE PROCEDURE [Process].[JetFuelReconciliationTotal]
	@RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5)
AS
BEGIN
	--Step 0 Inicializar Variables
	DECLARE @NumberRecordsProcess INT; 
	DECLARE @NumberRecordsTotal INT;
    DECLARE @Percentage INT; 
	DECLARE @SubtotalAmount DECIMAL(18,2)
	DECLARE @Pending AS TABLE (ID BIGINT)


	BEGIN TRANSACTION; 
	BEGIN TRY 
	
	--Step 1 Total de Registros en Invoice Detail 
	SELECT @NumberRecordsTotal = COUNT([ID]) 
      FROM [Process].[NationalJetFuelInvoiceDetail]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;



	--Step 2 Eliminar información de Conciliaciones Anteriores para la Remesa 
	EXEC [Process].[JetFuelReconciliationRevert] @RemittanceID, @MonthYear, @Period; 

	--Step 2.5 Guardar info de los ID pendientes
	INSERT INTO @Pending (ID)
	SELECT ID  
	  FROM [Process].[NationalJetFuelInvoiceDetail]
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ([ReconciliationStatus] = ''PENDING'' OR [ReconciliationStatus] IS NULL)

	--Step 3 Indicar que inicia el proceso
	UPDATE [Process].[NationalJetFuelInvoiceControl]
       SET StartDateProcess = GETDATE(),
           RecordsToProcess = @NumberRecordsTotal,
		   CountRecords = @NumberRecordsTotal,
		   DateReconciled = GETDATE(),
           StatusProcessCode = ''RUN''
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

	--Step 4 Primer criterio de conciliación 
	
	--Step 4.1 Insert [NationalJetFuelReconciliationDetail]
	INSERT INTO [Process].[NationalJetFuelReconciliationDetail]
           ([InvoiceDetailID]
           ,[RemittanceID]
           ,[MonthYear]
           ,[Period]
           ,[AirlineCode]
           ,[InvoiceStationCode]
           ,[InvoiceNumber]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[InvoiceTicketNumber]
           ,[InvoiceFlightNumber]
           ,[InvoiceEquipmentNumber]
           ,[InvoiceVolumeM3]
           ,[InvoiceSubtotalAmount]
           ,[PeriodCode]
           ,[CostTicketNumber]
           ,[CostDepartureDate]
           ,[CostFlightNumber]
           ,[CostEquipmentNumber]
           ,[DepartureStation]
           ,[ArrivalStation]
           ,[CostFueledQtyLts]
           ,[CostConceptAmount]
           ,[InvoiceCostVariance]
           ,[ReconciliationType]
           ,[ReconciliationStatus])
	SELECT [ID]
		  ,[RemittanceID]
		  ,[MonthYear]
		  ,[Period]
		  ,[AirlineCode]
		  ,[StationCode]
		  ,[InvoiceNumber]
		  ,[InvoiceDate]
		  ,[ElectronicInvoiceNumber]
		  ,[ElectronicInvoiceDate]
		  ,[TicketNumber]
		  ,[FlightNumber]
		  ,[EquipmentNumber]
		  ,[VolumeM3]
		  ,[SubtotalAmount]
		  ,[PeriodCode]
		  ,[CostTicketNumber]
		  ,[DepartureDate]
		  ,[CostFlightNumber]
		  ,[CostEquipmentNumber]
		  ,[DepartureStation]
		  ,[ArrivalStation]
		  ,[FueledQtyLts]
		  ,[ConceptAmount]
		  ,[Variance]
		  ,''AUTOMATIC'' [ReconciliationType]
		  ,[Status]
	  FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ID IN (SELECT ID FROM @Pending);

	--Cuantos registros inserto y SUM de SubtotalAmount
	SET @NumberRecordsProcess = @@ROWCOUNT; 

	SET @SubtotalAmount = (SELECT SUM(SubtotalAmount) 
	                         FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	                        WHERE RemittanceID = @RemittanceID
	                          AND MonthYear = @MonthYear
						      AND Period = @Period
							  AND ID IN (SELECT ID FROM @Pending));


	--Step 4.2 Update [NationalJetFuelInvoiceDetail] MATCHED
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = B.[Status]
	  FROM [Process].[NationalJetFuelInvoiceDetail] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationFirst] B ON (A.ID = B.ID)
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending);	
	   
	--Step 4.3 Update [NationalJetFuelCost] MATCHED
	UPDATE [Process].[NationalJetFuelCost]
	   SET [ReconciliationStatus] = B.[Status],
	       [InvoiceDetailID] = B.[ID]
	  FROM [Process].[NationalJetFuelCost] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationFirst] B  ON (A.[PeriodCode] = B.[PeriodCode] AND
																   A.[AirlineCode] = B.[CostAirlineCode] AND
																   A.[FlightNumber] = B.[CostFlightNumber] AND
																   A.[TicketNumber] = B.[CostTicketNumber] AND
																   A.[EquipmentNumber] = B.[CostEquipmentNumber])
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending);			
	  

	--Step 4.4 Update Control (Porcentaje, CountReconciledRecords y ReconciledSubtotalAmount)
	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess,
				[CountReconciledRecords] = ISNULL([CountReconciledRecords], 0)
                + @NumberRecordsProcess,
				[ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
                + @SubtotalAmount
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 	  	


	--Step 5 Segundo criterio de conciliación 
	
	--Step 5.1 Insert [NationalJetFuelReconciliationDetail]
	INSERT INTO [Process].[NationalJetFuelReconciliationDetail]
           ([InvoiceDetailID]
           ,[RemittanceID]
           ,[MonthYear]
           ,[Period]
           ,[AirlineCode]
           ,[InvoiceStationCode]
           ,[InvoiceNumber]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[InvoiceTicketNumber]
           ,[InvoiceFlightNumber]
           ,[InvoiceEquipmentNumber]
           ,[InvoiceVolumeM3]
           ,[InvoiceSubtotalAmount]
           ,[PeriodCode]
           ,[CostTicketNumber]
           ,[CostDepartureDate]
           ,[CostFlightNumber]
           ,[CostEquipmentNumber]
           ,[DepartureStation]
           ,[ArrivalStation]
           ,[CostFueledQtyLts]
           ,[CostConceptAmount]
           ,[InvoiceCostVariance]
           ,[ReconciliationType]
           ,[ReconciliationStatus])
	SELECT [ID]
		  ,[RemittanceID]
		  ,[MonthYear]
		  ,[Period]
		  ,[AirlineCode]
		  ,[StationCode]
		  ,[InvoiceNumber]
		  ,[InvoiceDate]
		  ,[ElectronicInvoiceNumber]
		  ,[ElectronicInvoiceDate]
		  ,[TicketNumber]
		  ,[FlightNumber]
		  ,[EquipmentNumber]
		  ,[VolumeM3]
		  ,[SubtotalAmount]
		  ,[PeriodCode]
		  ,[CostTicketNumber]
		  ,[DepartureDate]
		  ,[CostFlightNumber]
		  ,[CostEquipmentNumber]
		  ,[DepartureStation]
		  ,[ArrivalStation]
		  ,[FueledQtyLts]
		  ,[ConceptAmount]
		  ,[Variance]
		  ,''AUTOMATIC'' [ReconciliationType]
		  ,[Status]
	  FROM [Process].[VW_NationalJetFuelReconciliationSecond]
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND ID IN (SELECT ID FROM @Pending)
	   AND ID NOT IN (SELECT ID 
	                    FROM [Process].[VW_NationalJetFuelReconciliationFirst]
	                   WHERE RemittanceID = @RemittanceID
	                     AND MonthYear = @MonthYear
	                     AND Period = @Period
						 AND ID IN (SELECT ID FROM @Pending));	   

	--Cuantos registros inserto y SUM de SubtotalAmount
	SET @NumberRecordsProcess = @@ROWCOUNT; 

	SET @SubtotalAmount = (SELECT SUM(SubtotalAmount) 
	                         FROM [Process].[VW_NationalJetFuelReconciliationSecond]
	                        WHERE RemittanceID = @RemittanceID
	                          AND MonthYear = @MonthYear
						      AND Period = @Period
							  AND ID IN (SELECT ID FROM @Pending)
							  AND ID NOT IN (SELECT ID 
												FROM [Process].[VW_NationalJetFuelReconciliationFirst]
											   WHERE RemittanceID = @RemittanceID
												 AND MonthYear = @MonthYear
												 AND Period = @Period
												 AND ID IN (SELECT ID FROM @Pending)));


	--Step 5.2 Update [NationalJetFuelInvoiceDetail] MATCHED
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = B.[Status]
	  FROM [Process].[NationalJetFuelInvoiceDetail] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationSecond] B ON (A.ID = B.ID)
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending)
	   AND B.ID NOT IN (SELECT ID 
						FROM [Process].[VW_NationalJetFuelReconciliationFirst]
						WHERE RemittanceID = @RemittanceID
							AND MonthYear = @MonthYear
							AND Period = @Period
							AND ID IN (SELECT ID FROM @Pending));	
	   
	--Step 5.3 Update [NationalJetFuelCost] MATCHED
	UPDATE [Process].[NationalJetFuelCost]
	   SET [ReconciliationStatus] = B.[Status],
	       [InvoiceDetailID] = B.[ID]
	  FROM [Process].[NationalJetFuelCost] A INNER JOIN
	       [Process].[VW_NationalJetFuelReconciliationSecond] B  ON (A.[PeriodCode] = B.[PeriodCode] AND
																   A.[AirlineCode] = B.[CostAirlineCode] AND
																   A.[FlightNumber] = B.[CostFlightNumber] AND
																   A.[TicketNumber] = B.[CostTicketNumber] AND
																   A.[EquipmentNumber] = B.[CostEquipmentNumber])
	 WHERE B.RemittanceID = @RemittanceID
	   AND B.MonthYear = @MonthYear
	   AND B.Period = @Period
	   AND B.ID IN (SELECT ID FROM @Pending)
	   AND B.ID NOT IN (SELECT ID 
						FROM [Process].[VW_NationalJetFuelReconciliationFirst]
						WHERE RemittanceID = @RemittanceID
							AND MonthYear = @MonthYear
							AND Period = @Period
							AND ID IN (SELECT ID FROM @Pending));			
	  

	--Step 5.4 Update Control (Porcentaje, CountReconciledRecords y ReconciledSubtotalAmount)
	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess,
				[CountReconciledRecords] = ISNULL([CountReconciledRecords], 0)
                + @NumberRecordsProcess,
				[ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
                + @SubtotalAmount
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 
	

	--Step 7 Los que no cumplieron con los 2 criterios, se cuentan los restantes
	SELECT  @NumberRecordsProcess = @NumberRecordsTotal
                    - ( SELECT  ISNULL([RecordsProcessed], 0)
                        FROM    [Process].[NationalJetFuelInvoiceControl]
                        WHERE   RemittanceID = @RemittanceID
	                        AND MonthYear = @MonthYear
	                        AND Period = @Period
                      );	

	IF ( @NumberRecordsProcess > 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
                + @NumberRecordsProcess
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
                                        / [RecordsToProcess] )
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 

	--Step 8 Cuando no hay registros a procesar (Idealmente en Remesas siempre hay registros)
	IF ( @NumberRecordsProcess = 0 )
    BEGIN 		
        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [RecordsProcessed] = @NumberRecordsTotal
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        UPDATE  [Process].[NationalJetFuelInvoiceControl]
           SET  [ProcessProgress] = 100.00
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period; 

        SELECT  @Percentage = [ProcessProgress]
          FROM  [Process].[NationalJetFuelInvoiceControl]
          WHERE RemittanceID = @RemittanceID
	        AND MonthYear = @MonthYear
	        AND Period = @Period;
    END; 


	--Step 9 INDICAR QUE EL PROCESO TERMINO EN STATUS DE PROCESO  --FIN CODE DE TABLA [PROCESS].[STATUSPROCESS] 
    UPDATE [Process].[NationalJetFuelInvoiceControl]
       SET StatusProcessCode = ''FIN'',
           EndDateProcess = GETDATE(),
		   [CountReconciledRecords] = ISNULL([CountReconciledRecords], 0),
		   [ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
     WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

	--Step 10 Los registros que no conciliaron se marcan como PENDING
	UPDATE [Process].[NationalJetFuelInvoiceDetail]
	   SET [ReconciliationStatus] = ''PENDING''
	 WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period
	   AND [ReconciliationStatus] IS NULL;


	--STEP 11 REVISAR SI EL PROCESO FUE OK O TERMINO CON REGISTROS ERRONEOS 
    DECLARE @numError INT; 

    SELECT  @numError = COUNT(CASE WHEN [ReconciliationStatus] = ''PENDING'' THEN 1 ELSE 0 END)
    FROM    [Process].[NationalJetFuelInvoiceDetail]
    WHERE RemittanceID = @RemittanceID
	   AND MonthYear = @MonthYear
	   AND Period = @Period;

    IF (@numError > 0 )
        BEGIN 
            UPDATE  [Process].[NationalJetFuelInvoiceControl]
            SET     [CalculationStatusCode] = ''ERR'', --CALCULATED WITH ERRORS 
			        [ReconciliationStatusCode] = ''PROCESSED ERROR''
            WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;
        END; 
    ELSE
        BEGIN 
            UPDATE  [Process].[NationalJetFuelInvoiceControl]
            SET     [CalculationStatusCode] = ''CAL'', --CALCULATED 
			        [ReconciliationStatusCode] = ''PROCESSED OK''
            WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;
        END; 

	END TRY 

	BEGIN CATCH 
		IF @@TRANCOUNT > 0
			BEGIN 
				ROLLBACK TRANSACTION; 
			END; 
	END CATCH; 

    IF @@TRANCOUNT > 0
        BEGIN 
            COMMIT TRANSACTION; 
        END; 

END


' 
END
GO
/****** Object:  StoredProcedure [Process].[JetFuelReportTicket]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReportTicket]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160317
-- Description:	Reporte de Captura
-- EXEC  [Process].[JetFuelReportTicket] ''Fuel201601''
-- =======================================================
CREATE PROCEDURE [Process].[JetFuelReportTicket]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30)
AS
BEGIN

-- Inicializar variables 
DECLARE @startDate AS DATETIME 
DECLARE @endDate AS DATETIME 

SELECT @startDate = StartDatePeriod, 
       @endDate = Cast(EndDatePeriod AS DATETIME) 
                  + '' 23:59:59'' 
FROM   [Process].[JetFuelProcess] 
WHERE  PeriodCode = @PeriodCode 


          
--  Reporte
SELECT ROW_NUMBER() OVER(ORDER BY A.[Sequence]) Number
      ,@PeriodCode PeriodCode
      ,A.[Sequence]
      ,A.[AirlineCode]
      ,A.[FlightNumber]
	  ,A.[EquipmentNumber]
	  ,A.[DepartureStation]
	  ,A.[DepartureDate]      
	  ,A.[ArrivalStation]
	  ,A.[ArrivalDate]
	  ,ROW_NUMBER() OVER(PARTITION BY A.[Sequence], 
	                                  A.[AirlineCode], 
									  A.[FlightNumber], 
									  A.[ItineraryKey] ORDER BY A.[Sequence], 
									                            A.[AirlineCode], 
																A.[FlightNumber], 
																A.[ItineraryKey]) AS TicketsNum
      
	  ,B.JetFuelTicketID	  
	  ,B.OperationTypeName
	  ,B.TicketNumber
	  ,B.FuelingDate
	  ,B.FuelingTime
	  ,B.FueledQtyGals
	  ,B.JetFuelProviderNumber
	  ,C.ProviderName JetFuelProviderName
	  ,B.IntoPlaneProviderNumber
	  ,D.ProviderName IntoPlaneProviderName
	  ,B.RemainingQry
	  ,B.RequestedQry
	  ,B.FueledQry
	  ,B.DensityFactor
	  ,B.AorUserID 
	  ,ISNULL(E.Name,'''')+'' ''+ISNULL(E.FirstName,'''')+ISNULL(E.LastName,'''') AorUserName
	  ,B.SupplierResponsible
	  ,B.Remarks
  FROM [Itinerary].[Itinerary] A LEFT JOIN
       [Airport].[JetFuelTicket] B ON (A.Sequence = B.Sequence 
	                                             AND A.AirlineCode = B.AirlineCode
												 AND A.FlightNumber = B.FlightNumber
												 AND A.ItineraryKey = B.ItineraryKey) LEFT JOIN
	   [Finance].[Provider] C ON (B.JetFuelProviderNumber = C.ProviderNumber) LEFT JOIN
	   [Finance].[Provider] D ON (B.IntoPlaneProviderNumber = D.ProviderNumber) LEFT JOIN
       [Security].[User] E ON (B.AorUserID = E.UserID)
 WHERE A.DepartureStation IN (SELECT [StationCode]
							  FROM [Airport].[Airport]
							 WHERE CountryCode != ''MEX'') 
   AND A.DepartureDate BETWEEN @startDate AND @endDate 

END' 
END
GO
/****** Object:  StoredProcedure [Process].[NationalJetFuelCostError]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelCostError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 2016 Julio 12
-- Description:	Reporte de errores nacional Cost
-- [Process].[NationalJetFuelCostError] ''Fuel201605'', ''Y4''
-- =============================================
CREATE PROCEDURE [Process].[NationalJetFuelCostError]
    @PeriodCode VARCHAR(30) ,
    @AirlineCodes VARCHAR(MAX) = '' '' --,
    --@ServiceCodes VARCHAR(MAX) = '' ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

        SELECT [LogID]
			  ,[PeriodCode]
			  ,[LineNumber]
			  ,[Description]
			  ,A.[Sequence]
			  ,A.[AirlineCode]
			  ,A.[FlightNumber]
			  ,A.[ItineraryKey]
			  ,A.[EquipmentNumber]
			  ,B.DepartureStation
			  ,B.ArrivalStation
			  ,[OperationTypeID]
			  ,[NationalJetFuelTicketID]
			  ,[ServiceCode]
			  ,[ProviderNumberPrimary]
			  ,[FuelingStartDate]
			  ,[FuelingStartTime]
			  ,[FuelingEndDate]
			  ,[FuelingEndTime]
			  ,[ApronPosition]
			  ,[TicketNumber]
			  ,[FueledQtyLts]
			  ,[RemainingQtyKgs]
			  ,[RequestedQtyKgs]
			  ,[FueledQtyKgs]
			  ,[DensityFactor]
			  ,[NationalFuelContractConceptID]
			  ,[FuelConceptID]
			  ,[FuelConceptTypeCode]
			  ,[ChargeFactorTypeID]
			  ,[ProviderNumber]
			  ,[ScheduleTypeCode]
			  ,[Rate]
		  FROM [Process].[NationalJetFuelLogError] A LEFT JOIN 
		       [Itinerary].[Itinerary] B ON ( A.Sequence = B.Sequence
                                                         AND A.AirlineCode = B.AirlineCode
                                                         AND A.FlightNumber = B.FlightNumber
                                                         AND A.ItineraryKey = B.ItineraryKey
                                                       )
        WHERE   [PeriodCode] = @PeriodCode
                AND ( A.[AirlineCode] IN (
                      SELECT    splitdata
                      FROM      dbo.fnSplitString(@AirlineCodes, '','') )
                      OR @AirlineCodes = '' ''
                    )                
                --AND ( [ServiceCode] IN (
                --      SELECT    splitdata
                --      FROM      dbo.fnSplitString(@ServiceCodes, '','') )
                --      OR @ServiceCodes = '' ''
                --    );
	
    END;
' 
END
GO
/****** Object:  StoredProcedure [Process].[NationalJetFuelPolicyDetail]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelPolicyDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==================================================
-- Author:		Leonardo Eduardo Ramirez Garcia Cano
-- Create date: 31/05/2016
-- Description:	Reporte detalle policy provisiones nat
-- ==================================================
-- [Process].[NationalJetFuelPolicyDetail] 2
CREATE PROCEDURE [Process].[NationalJetFuelPolicyDetail]
	-- Add the parameters for the stored procedure here
	@PolicyID AS BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [PolicyResultID]
      ,[NationalPolicyID]
      ,[DocumentNumber]
      ,[NationalJetFuelTicketID]
      ,[TPREC]
	  ,CASE WHEN [NationalJetFuelTicketID] IS NULL AND NEWBS = ''40'' THEN ''Complementary''
	        WHEN [NationalJetFuelTicketID] IS NOT NULL AND NEWBS = ''40'' THEN ''Real'' 
	        ELSE '''' END Calculation
      ,[IDREG]
      ,[BLDAT]
      ,[BLART]
      ,[BUKRS]
      ,[BUDAT]
      ,[WAERS]
      ,[KURSF]
      ,[XBLNR]
      ,[BKTXT]
      ,[NEWBS]
      ,[NEWKO]
      ,[NEWUM]
      ,[NEWBK]
      ,[WRBTR]
      ,[DMBE2]
      ,[MWSKZ]
      ,[XMWST]
      ,[GSBER]
      ,[KOSTL]
      ,[AUFNR]
      ,[PRCTR]
      ,[FKBER]
      ,[SEGMENT]
      ,[WERKS]
      ,[FISTL]
      ,[ZFBDT]
      ,[VALUT]
      ,[ZUONR]
      ,[SGTXT]
      ,[MENGE]
      ,[MEINS]
      ,[GEBER]
      ,[NOTOTAL]
      ,[LIFNR]
      ,[KUNNR]
      ,[ANRED]
      ,[NAME1]
      ,[NAME2]
      ,[NAME3]
      ,[BANKL]
      ,[BANKN]
      ,[ZLSCH]
      ,[BKREF]
      ,[BELNR]
      ,[XBLNR2]
      ,[MENV]
      ,[MSGID]
      ,[RFCLOG]
  FROM [Process].[NationalJetFuelPolicy]
 WHERE NationalPolicyID = @PolicyID

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[NationalJetFuelReportTicket]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[NationalJetFuelReportTicket]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =======================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160526
-- Description:	Reporte de Captura
-- EXEC  [Process].[NationalJetFuelReportTicket] ''Fuel201605''
-- =======================================================
CREATE PROCEDURE [Process].[NationalJetFuelReportTicket]
	-- Add the parameters for the stored procedure here
	@PeriodCode VARCHAR(30)
AS
BEGIN

-- Inicializar variables 
DECLARE @startDate AS DATETIME 
DECLARE @endDate AS DATETIME 

SELECT @startDate = StartDatePeriod, 
       @endDate = Cast(EndDatePeriod AS DATETIME) 
                  + '' 23:59:59'' 
FROM   [Process].[JetFuelProcess] 
WHERE  PeriodCode = @PeriodCode 


          
--  Reporte
SELECT ROW_NUMBER() OVER(ORDER BY A.[Sequence]) Number
      ,@PeriodCode PeriodCode
      ,A.[Sequence]
      ,A.[AirlineCode]
      ,A.[FlightNumber]
	  ,A.[EquipmentNumber]
	  ,A.[DepartureStation]
	  ,A.[DepartureDate]      
	  ,A.[ArrivalStation]
	  ,A.[ArrivalDate]
	  ,ROW_NUMBER() OVER(PARTITION BY A.[Sequence], 
	                                  A.[AirlineCode], 
									  A.[FlightNumber], 
									  A.[ItineraryKey] ORDER BY A.[Sequence], 
									                            A.[AirlineCode], 
																A.[FlightNumber], 
																A.[ItineraryKey]) AS TicketsNum
      
	  ,B.NationalJetFuelTicketID	  
	  ,B.OperationTypeName
	  ,B.TicketNumber
	  ,B.FuelingDateStart
	  ,B.FuelingTimeStart
	  ,B.FuelingDateEnd
	  ,B.FuelingTimeEnd
	  ,B.FueledQtyLts
	  ,B.JetFuelProviderNumber
	  ,C.ProviderName JetFuelProviderName
	  ,B.IntoPlaneProviderNumber
	  ,D.ProviderName IntoPlaneProviderName
	  ,B.RemainingQtyKgs
	  ,B.RequestedQtyKgs
	  ,B.FueledQtyKgs
	  ,B.DensityFactor
	  ,B.AorUserID 
	  ,ISNULL(E.Name,'''')+'' ''+ISNULL(E.FirstName,'''')+ISNULL(E.LastName,'''') AorUserName
	  ,B.SupplierResponsible
	  ,B.Remarks
  FROM [Itinerary].[Itinerary] A LEFT JOIN
       [Airport].[NationalJetFuelTicket] B ON (A.Sequence = B.Sequence 
	                                             AND A.AirlineCode = B.AirlineCode
												 AND A.FlightNumber = B.FlightNumber
												 AND A.ItineraryKey = B.ItineraryKey) LEFT JOIN
	   [Finance].[Provider] C ON (B.JetFuelProviderNumber = C.ProviderNumber) LEFT JOIN
	   [Finance].[Provider] D ON (B.IntoPlaneProviderNumber = D.ProviderNumber) LEFT JOIN
       [Security].[User] E ON (B.AorUserID = E.UserID)
 WHERE A.DepartureStation IN (SELECT [StationCode]
							  FROM [Airport].[Airport]
							 WHERE CountryCode = ''MEX'') 
   AND A.DepartureDate BETWEEN @startDate AND @endDate 

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[SaveNationalJetFuelInvoicePolicy]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[SaveNationalJetFuelInvoicePolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160701
-- Description:	Save Polizas Invoice
-- [Process].[SaveNationalJetFuelInvoicePolicy]  ''16-2830'', ''0416'', ''20160701'', ''20160701'', ''20160701'', ''01-06''
-- ===============================================================
CREATE PROCEDURE [Process].[SaveNationalJetFuelInvoicePolicy]      
     @RemittanceID AS VARCHAR(8)
	,@MonthYear AS VARCHAR(4)
	,@DateValue AS DATETIME  
	,@DatePosting AS DATETIME
	,@DateBase AS DATETIME
	,@Period AS VARCHAR(5) 
AS  
BEGIN  
SET NOCOUNT ON; 

--Declarar Variables tipo tabla y variables para el procedimiento
DECLARE @Accounting VARCHAR(17)
SET @Accounting = ''50210000''

DECLARE @DocumentNumberOrder AS TABLE ([ElectronicInvoiceNumber] VARCHAR(50), Ordered INT NULL)

BEGIN TRANSACTION; 

BEGIN TRY

	--Paso 0.- Orden para registro Document Number
	INSERT @DocumentNumberOrder (ElectronicInvoiceNumber, Ordered)
	SELECT ElectronicInvoiceNumber, ROW_NUMBER() OVER(ORDER BY [ElectronicInvoiceNumber]) Ordered
	  FROM (
	SELECT DISTINCT ElectronicInvoiceNumber
	  FROM [Process].[NationalJetFuelInvoiceDetail] 
	 WHERE [RemittanceID] = @RemittanceID
	   AND [MonthYear] = @MonthYear
	   AND [Period] = @Period
	 ) A

	--Paso 1 Actualizar registro en Invoice Control con filtros realizados
	UPDATE [Process].[NationalJetFuelInvoiceControl]
	   SET DocumentStatusCode = ''CREA''
		  ,DateBaseline = @DateBase
		  ,DateValue = @DateValue
		  ,DatePosting = @DatePosting
		  ,ProcessDate = GETDATE()
	 WHERE RemittanceID = @RemittanceID
	   AND [MonthYear] = @MonthYear
	   AND [Period] = @Period


	--Paso 2 Guaardar informacion de remesa en Invoice Policy 
	INSERT INTO [Process].[NationalJetFuelInvoicePolicy]
			   ([RemittanceID]
			   ,[MonthYear]
			   ,[Period]
			   ,[DocumentNumber]
			   ,[TPREC]
			   ,[IDREG]
			   ,[BLDAT]
			   ,[BLART]
			   ,[BUKRS]
			   ,[BUDAT]
			   ,[WAERS]
			   ,[KURSF]
			   ,[XBLNR]
			   ,[BKTXT]
			   ,[NEWBS]
			   ,[NEWKO]
			   ,[NEWUM]
			   ,[NEWBK]
			   ,[WRBTR]
			   ,[DMBE2]
			   ,[MWSKZ]
			   ,[XMWST]
			   ,[GSBER]
			   ,[KOSTL]
			   ,[AUFNR]
			   ,[PRCTR]
			   ,[FKBER]
			   ,[SEGMENT]
			   ,[WERKS]
			   ,[FISTL]
			   ,[ZFBDT]
			   ,[VALUT]
			   ,[ZUONR]
			   ,[SGTXT]
			   ,[MENGE]
			   ,[MEINS]
			   ,[GEBER]
			   ,NOTOTAL)
	SELECT [RemittanceID]
	      ,@MonthYear
	      ,@Period
		  ,[DocumentNumber]
		  ,'''' [tprec]
		  ,Cast(RIGHT(''000000'' + Isnull(Cast([DocumentNumber] AS VARCHAR), ''''), 6) AS VARCHAR(6)) 
		 + Cast(RIGHT(''000000''+ Isnull(Cast(ROW_NUMBER() OVER(PARTITION BY [DocumentNumber] ORDER BY [DocumentNumber]) AS VARCHAR), ''''), 6) AS VARCHAR(6)) IDREG	  
		  ,[bldat]
		  ,[blart]
		  ,[bukrs]
		  ,[budat]
		  ,[waers]
		  ,[kursf]
		  ,[xblnr]
		  ,[bktxt]
		  ,[newbs]
		  ,[newko]
		  ,[newum]
		  ,[newbk]
		  ,[wrbtr]
		  ,[dmbe2]
		  ,[mwskz]
		  ,[xmwst]
		  ,[gsber]
		 -- ,[xstba]
		  ,[kostl]
		  ,[aufnr]
		  ,[prctr]
		  ,[fkber]
		  ,[segment]
		  ,[werks]
		  ,[fistl]
		  ,[zfbdt]
		  ,[valut]
		  ,[zuonr]
		  ,[sgtxt]
		  ,[menge]
		  ,[meins]
		  ,[geber]
		  ,NOTOTAL
	FROM
	(
	SELECT [ElectronicInvoiceNumber]
		  ,[RemittanceID]
		  ,(ROW_NUMBER() OVER(PARTITION BY [ElectronicInvoiceNumber] ORDER BY [ElectronicInvoiceNumber])) Orden
		  ,(SELECT Ordered FROM @DocumentNumberOrder WHERE ElectronicInvoiceNumber = A.ElectronicInvoiceNumber) DocumentNumber
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), InvoiceDate, 112) AS DATETIME), 120) bldat

		  ,''KR'' blart
		  ,B.CompanyCode bukrs
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) AS DATETIME), 120) budat
		  ,''MXN'' waers
		  ,''1'' kursf
		  ,REPLACE([ElectronicInvoiceNumber], ''-'', '''') xblnr
		  ,LEFT([MonthYear] + '' COMBUS '' +
		   [Period] + ''-'' + [EquipmentNumber] + ''-'' + [StationCode]  + ''-'' + 
		   CAST(CAST(([VolumeM3] * 1000) AS DECIMAL) AS VARCHAR),25) bktxt
		  ,40 newbs	  
		  ,@Accounting newko 
		  ,'''' newum
		  ,'''' newbk
		  ,[SubtotalAmount] wrbtr 
		  ,'''' dmbe2
		  ,[FederalTaxCode] mwskz
		  ,CASE WHEN (ROW_NUMBER() OVER(PARTITION BY [ElectronicInvoiceNumber] ORDER BY [ElectronicInvoiceNumber])) = 1 THEN ''X'' ELSE '''' END xmwst   	  
		  ,B.Division gsber  
		  ,LEFT(REPLACE([EquipmentNumber], ''-'', '''') + ''0000000000'', 10) kostl
		  ,'''' aufnr
		  ,'''' prctr
		  ,[StationCode] fkber
		  ,'''' segment
		  ,'''' werks
		  ,'''' fistl
		  ,'''' zfbdt  
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateValue, 112) AS DATETIME), 120) valut  

		  ,'''' zuonr
		  ,LEFT([MonthYear] + '' COMBUS '' +
		   [Period] + ''-'' + [EquipmentNumber] + ''-'' + [StationCode]  + ''-'' + 
		   CAST(CAST(([VolumeM3] * 1000) AS DECIMAL) AS VARCHAR),50) sgtxt 
		  ,'''' AS menge
		  ,'''' AS meins
		  ,'''' AS geber 
		  ,''0'' AS NOTOTAL
	  FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
		   [Airport].[Airline] B ON (A.AirlineCode = B.AirlineCode)
	 WHERE [RemittanceID] = @RemittanceID
	   AND [MonthYear] = @MonthYear
	   AND [Period] = @Period
	UNION
	SELECT [ElectronicInvoiceNumber]	  
		  ,MIN([RemittanceID]) [RemittanceID]
		  ,999 Orden
		  ,(SELECT Ordered FROM @DocumentNumberOrder WHERE ElectronicInvoiceNumber = A.ElectronicInvoiceNumber) DocumentNumber
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), MIN(InvoiceDate), 112) AS DATETIME), 120) bldat
		  ,''KR'' blart
		  ,MIN(B.CompanyCode) bukrs
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) AS DATETIME), 120) budat
		  ,''MXN'' waers
		  ,''0'' kursf
		  ,REPLACE([ElectronicInvoiceNumber], ''-'', '''') xblnr
		  ,[ElectronicInvoiceNumber] bktxt
		  ,31 newbs	  
		  ,MIN([ProviderNumber]) newko 
		  ,'''' newum
		  ,'''' newbk
		  ,SUM([SubtotalAmount]) wrbtr 
		  ,'''' dmbe2
		  ,'''' mwskz
		  ,'''' xmwst  
		  ,'''' gsber  
		  ,'''' kostl
		  ,'''' aufnr
		  ,'''' prctr
		  ,'''' fkber
		  ,'''' segment
		  ,'''' werks
		  ,'''' fistl
		  ,Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) AS DATETIME), 120) zfbdt  

		  ,'''' valut  
		  ,'''' zuonr
		  ,[ElectronicInvoiceNumber] + ''-'' + REPLACE(MIN([RemittanceID]), ''-'',  ''/'') sgtxt 
		  ,'''' AS menge
		  ,'''' AS meins
		  ,'''' AS geber 
		  ,CAST(COUNT(*) AS VARCHAR) AS NOTOTAL
	  FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
		   [Airport].[Airline] B ON (A.AirlineCode = B.AirlineCode)
	 WHERE [RemittanceID] = @RemittanceID
	   AND [MonthYear] = @MonthYear
	   AND [Period] = @Period
	 GROUP BY [ElectronicInvoiceNumber]
	 ) A 
	 ORDER BY ElectronicInvoiceNumber, DocumentNumber, Orden
	
	SELECT @RemittanceID RemittanceID--, '''' ErrorMessage;  

END TRY

BEGIN CATCH 
  
    IF @@TRANCOUNT > 0 
      BEGIN 
          ROLLBACK TRANSACTION 
      END 

	SELECT ''-1'' RemittanceID--, ERROR_MESSAGE() ErrorMessage;

END CATCH; 

IF @@TRANCOUNT > 0 
  BEGIN 
      COMMIT TRANSACTION 
  END 

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[SaveNationalPolicyCost]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[SaveNationalPolicyCost]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160601
-- Description:	Polizas Save
-- [Process].[SaveNationalPolicyCost] ''20160501'', ''20160531'', ''20151201'', ''20151215'', ''ok'', ''okasssss'', ''20160101'', ''20160101'', ''20160101'', ''Y4'', ''4000000,0000001,4000'', ''CM'', ''MEX'', ''usuario''
-- ===============================================================
CREATE PROCEDURE [Process].[SaveNationalPolicyCost]      
     @StartDateReal AS DATETIME  
    ,@EndDateReal AS DATETIME 
	,@StartDateComp AS DATETIME  
    ,@EndDateComp AS DATETIME   
	,@HeaderText AS VARCHAR(50)
	,@ItemText   AS VARCHAR(50) 
	,@DateValue AS DATETIME  
	,@DatePosting AS DATETIME
	,@DateBase AS DATETIME
	,@AirlineCode AS VARCHAR(3) 
	,@ProviderCodes AS VARCHAR(MAX) 
	,@ServiceCodes AS VARCHAR(MAX) 
	,@StationCodes AS VARCHAR(MAX) --Opcion XML
	,@UserSend AS NVARCHAR(50) = '' ''
AS  
BEGIN  
SET NOCOUNT ON; 

--Declarar Variables tipo tabla y variables para el procedimiento
 DECLARE @Acumulado AS TABLE (
	[JetFuelTicketID] [bigint] NULL,
	[subtotalRound] [decimal](18, 2) NULL,
	[row_iden] [bigint] NULL,
	[DepartureStation] [varchar](3) NULL,
	[CurrencyCode] [varchar](3) NULL,
	[EquipmentNumber] [varchar](12) NULL,
	[FueledQtyLts] [int] NULL,
	[LiabilityAccountNumber] [varchar](8) NULL,
	[ConceptAmount] [decimal](38, 2) NULL,
	[ServiceCode] [varchar](12) NULL,
	[TotalRegTicket] [int] NULL,
	[AirlineCode] [varchar](3) NULL
)
DECLARE @TableOrder AS TABLE (UNORDERED INT, ORDERED INT NULL)
DECLARE @TableMaxReg AS TABLE (row_iden INT, reg INT)
DECLARE @NumRegMax INT
SET @NumRegMax = 998
DECLARE @PolicyID BIGINT

--Declarar Constantes para el procedimiento
DECLARE @Accounting VARCHAR(17)
SET @Accounting = ''50210000''
DECLARE @Liability VARCHAR(17)
SET @Liability = ''20410101''

BEGIN TRANSACTION; 

BEGIN TRY
	--Paso 0 Orden con base en Ticket y Moneda para Real y Complementario. Se incluye CAST(CAST(waers AS VARBINARY) AS INT)
	INSERT @TableOrder (UNORDERED, ORDERED)
	SELECT DISTINCT (Row_number() OVER(PARTITION BY waers ORDER BY A.NationalJetFuelTicketID asc) - 1 ) / @NumRegMax + 1 + CAST(CAST(waers AS VARBINARY) AS INT) AS rownumber, NULL 
			  FROM (
			       (SELECT MIN(A.CurrencyCode)																		as waers, --DUDA Que claves de moneda usaremos, es importante pues al hacer sumas debe estar unificada la moneda              [CurrencyCode]                       
						   40																						as newbs,
						   NationalJetFuelTicketID
					FROM   [Process].[NationalJetFuelCost] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) 
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))				  
					GROUP  BY NationalJetFuelTicketID) 
				   UNION ALL
				   (SELECT MIN(A.CurrencyCode)																		as waers, --DUDA Que claves de moneda usaremos, es importante pues al hacer sumas debe estar unificada la moneda              [CurrencyCode]                       
						   40																						as newbs,
						   NationalJetFuelTicketID
					FROM   [Process].[NationalJetFuelCost] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))				  
					GROUP  BY NationalJetFuelTicketID) 					
					) A	

	--Paso 1 Agregar registro en Poliza Control con filtros realizados y guardar información PolicyID
	INSERT INTO [Process].[NationalJetFuelPolicyControl] 
		  ([DocumentType]
		  ,[CreationDate]
		  ,[Status]
		  ,[AirlineCode]
		  ,[ServiceCodes]
		  ,[ProviderCodes]
		  ,[AirportCodes]
		  ,[StartDateReal]
		  ,[EndDateReal]
		  ,[StartDateComplementary]
		  ,[EndDateComplementary]
		  ,[DateBaseline]
		  ,[DateValue]
		  ,[DatePosting]
		  ,[HeaderText]
		  ,[ItemText]
		  ,[SendByUserName])
	SELECT ''PV''
	      ,GETDATE()
		  ,''CREATED''
		  ,@AirlineCode
		  ,@ServiceCodes
		  ,@ProviderCodes
		  ,@StationCodes
		  ,@StartDateReal
		  ,@EndDateReal
		  ,@StartDateComp
		  ,@EndDateComp
		  ,@DateBase
		  ,@DateValue
		  ,@DatePosting
		  ,@HeaderText
		  ,@ItemText
		  ,@UserSend

SET @PolicyID= @@IDENTITY


	--Paso 2.0 Guardar Acumulado Real y Complementario, registros NEWBS 50. Realiza Suma de galones y Tarifas 
INSERT INTO @Acumulado ([JetFuelTicketID]
		  ,[subtotalRound]
		  ,[row_iden]
		  ,[DepartureStation]
		  ,[CurrencyCode]
		  ,[EquipmentNumber]
		  ,[FueledQtyLts]
		  ,[LiabilityAccountNumber]
		  ,[ConceptAmount]
		  ,[ServiceCode]
		  ,[TotalRegTicket]
		  ,[AirlineCode])
	SELECT [NationalJetFuelTicketID]
		  ,[subtotalRound]
		  ,( (Row_number() OVER (PARTITION BY CurrencyCode ORDER BY NationalJetFuelTicketID) ) - 1 ) / @NumRegMax + 1 + CAST(CAST(CurrencyCode AS VARBINARY) AS INT)  [row_iden]
		  ,[DepartureStation]
		  ,[CurrencyCode]
		  ,[EquipmentNumber]
		  ,[FueledQtyLts]
		  ,[LiabilityAccountNumber]
		  ,[ConceptAmount]
		  ,[ServiceCode]
		  ,[TotalRegTicket]
		  ,[AirlineCode] 
	FROM
	(
	SELECT NationalJetFuelTicketID, Cast(MIN(ConceptAmount) AS DECIMAL(18, 2)) as subtotalRound     	  
		  ,MIN(B.DepartureStation) DepartureStation, MIN (A.CurrencyCode) CurrencyCode, MIN(A.EquipmentNumber) EquipmentNumber
		  ,SUM(A.FueledQtyLts) FueledQtyLts, MIN(A.LiabilityAccountNumber) LiabilityAccountNumber, Sum(Cast(ConceptAmount AS DECIMAL(18, 2))) ConceptAmount
		  , MIN(ServiceCode) ServiceCode, Count(DISTINCT NationalJetFuelTicketID) TotalRegTicket, MIN(A.[AirlineCode]) [AirlineCode]
	 FROM [Process].[NationalJetFuelCost] A LEFT JOIN
	  	  [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	WHERE (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) 
	  AND  A.[AirlineCode] = @AirlineCode
	  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
	  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
    GROUP BY [NationalJetFuelTicketID]
	UNION ALL
   SELECT NationalJetFuelTicketID, Cast(MIN(ConceptAmount) AS DECIMAL(18, 2)) as subtotalRound     	  
		  ,MIN(B.DepartureStation) DepartureStation, MIN (A.CurrencyCode) CurrencyCode, MIN(A.EquipmentNumber) EquipmentNumber
		  ,SUM(A.FueledQtyLts) FueledQtyLts, MIN(A.LiabilityAccountNumber) LiabilityAccountNumber, Sum(Cast(ConceptAmount AS DECIMAL(18, 2))) ConceptAmount
		  , MIN(ServiceCode) ServiceCode, Count(DISTINCT NationalJetFuelTicketID) TotalRegTicket, MIN(A.[AirlineCode]) [AirlineCode]
	 FROM [Process].[NationalJetFuelCost] A LEFT JOIN
	  	  [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	WHERE [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
	  AND  A.[AirlineCode] = @AirlineCode
	  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
	  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
    GROUP BY [NationalJetFuelTicketID]
	) A;
	

	--Paso 4 Guardar OrdersPROD detalle final de registros NEWBS 50
	WITH OrdersPROD ( tprec, bldat, blart, bukrs, budat, waers, kursf, xblnr, bktxt, 
		 newbs, newko, newum, newbk, wrbtr, dmbe2, mwskz, xmwst, xstba, gsber, kostl 
		 , aufnr, prctr, fkber, segment, werks, fistl, zfbdt, valut, zuonr, sgtxt, 
		 menge, meins, geber, IDREG, noTotal, row_iden ) 
		 AS (SELECT ''''																						as tprec, 
					Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)		as bldat, 
					''PV''																					as blart, 
					(SELECT MIN(CompanyCode)
								FROM   [Airport].[Airline] B 
								WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs, 
					Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) AS DATETIME), 120)	as budat, 
					MIN(CurrencyCode)																		as waers, 
					''''																						as kursf, 
					''''																						as xblnr, 
					@HeaderText + '' ''  + 
					Cast(SUM(FueledQtyLts) as VARCHAR) + '' ''												as bktxt,
					 50																						as newbs, 
					@Liability																				as newko,
					''''																						as newum, 
					''''																						as newbk, 
					Cast(Cast(SUM(ConceptAmount) AS DECIMAL(18, 2)) as DECIMAL(18, 2))						as wrbtr, 
					''''																						as dmbe2, 
					''''																						as mwskz, 
					''''																						as xmwst, 
					''''																						as xstba, 
					''''																						as gsber, 
					''''																						as kostl, 
					''''																						as aufnr, 
					''''																						as prctr, 
					''''																						as fkber, 
					''''																						as segment, 
					''''																						as werks, 
					''''																						as fistl, 
					''''																						as zfbdt, -- solo en totales    
					''''																						as valut, 
					''''																						as zuonr, 
					CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + Cast(SUM(FueledQtyLts) as VARCHAR) + '' '' 
								ELSE @ItemText END															as sgtxt, 
					''''																						as menge, 
					''''																						as meins, 
					''''																						as geber,
					Cast(RIGHT(''000000'' + Cast((SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  
												 WHERE UNORDERED = row_iden) AS VARCHAR), 6)AS VARCHAR) 
					+ Cast(RIGHT(''000000'' + Cast(COUNT([TotalRegTicket])+1 as VARCHAR), 6) AS VARCHAR)      as IDREG, 
					COUNT([TotalRegTicket])																	as noTotal, 
					(SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = row_iden) row_iden 
			 FROM   @Acumulado A
			 GROUP  BY row_iden)

       

	--Paso 5 Insertar en resultado (Real y Complementario)
	INSERT INTO [Process].[NationalJetFuelPolicy]
	      ([NationalPolicyID]
	      ,[DocumentNumber]
	      ,[NationalJetFuelTicketID]
	      ,[TPREC]
	      ,[IDREG]
	      ,[BLDAT]
	      ,[BLART]
	      ,[BUKRS]
	      ,[BUDAT]
	      ,[WAERS]
	      ,[KURSF]
	      ,[XBLNR]
	      ,[BKTXT]
	      ,[NEWBS]
	      ,[NEWKO]
	      ,[NEWUM]
	      ,[NEWBK]
	      ,[WRBTR]
	      ,[DMBE2]
	      ,[MWSKZ]
	      ,[XMWST]
	      ,[GSBER]
	      ,[KOSTL]
	      ,[AUFNR]
	      ,[PRCTR]
	      ,[FKBER]
	      ,[SEGMENT]
	      ,[WERKS]
	      ,[FISTL]
	      ,[ZFBDT]
	      ,[VALUT]
	      ,[ZUONR]
	      ,[SGTXT]
	      ,[MENGE]
	      ,[MEINS]
	      ,[GEBER]
	      ,[NOTOTAL])
	-- REGISTROS DE ESTIMADOS  
	SELECT @PolicyID PolicyID
		  ,row_iden
		  ,[JetFuelTicketID]
		  ,[TPREC]
		  ,[IDREG]
		  ,[BLDAT]
		  ,[BLART]
		  ,[BUKRS]
		  ,[BUDAT]
		  ,[WAERS]
		  ,[KURSF]
		  ,[XBLNR]
		  ,[BKTXT]
		  ,[NEWBS]
		  ,[NEWKO]
		  ,[NEWUM]
		  ,[NEWBK]
		  ,[WRBTR]
		  ,[DMBE2]
		  ,[MWSKZ]
		  ,[XMWST]
		  ,[GSBER]
		  ,[KOSTL]
		  ,[AUFNR]
		  ,[PRCTR]
		  ,[FKBER]
		  ,[SEGMENT]
		  ,[WERKS]
		  ,[FISTL]
		  ,[ZFBDT]
		  ,[VALUT]
		  ,[ZUONR]
		  ,[SGTXT]
		  ,[MENGE]
		  ,[MEINS]
		  ,[GEBER]
		  ,[NOTOTAL] 
	FROM (
	SELECT (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber)						as row_iden, 
		   Cast(RIGHT(''000000'' + Isnull(Cast((SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber) AS VARCHAR), ''''), 6) AS VARCHAR(6)) 
		   + Cast(RIGHT(''000000''+ Isnull(Cast(Row_number() over (PARTITION BY (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber) ORDER BY [JetFuelTicketID] asc ) AS VARCHAR), ''''), 6) AS VARCHAR(6)) AS IDREG, 
		   ''''                                                       tprec, 
		   bldat                                                    bldat, 
		   blart, 
		   bukrs, 
		   budat, 
		   waers, 
		   kursf, 
		   xblnr, 
		   bktxt, 
		   Cast(newbs as VARCHAR)                                   as newbs, 
		   Cast(newko as VARCHAR)                                   as newko, 
		   newum, 
		   newbk, 
		   Cast(Cast(wrbtr as MONEY) as VARCHAR)                    as wrbtr, 
		   dmbe2, 
		   mwskz, 
		   xmwst, 
		   xstba, 
		   gsber, 
		   kostl, 
		   aufnr, 
		   prctr, 
		   fkber, 
		   segment, 
		   werks, 
		   fistl, 
		   zfbdt, 
		   valut, 
		   zuonr, 
		   sgtxt, 
		   menge, 
		   meins, 
		   geber, 
		   noTotal,
		   CASE WHEN DB = ''R'' THEN [JetFuelTicketID] ELSE NULL END [JetFuelTicketID] 
	from   (SELECT (Row_number() OVER(PARTITION BY waers ORDER BY [JetFuelTicketID] asc) - 1 ) / @NumRegMax + 1 + CAST(CAST(waers AS VARBINARY) AS INT) AS rownumber, * 
			  FROM ((SELECT ''''																						as tprec, 
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)			as bldat,                             
						   ''PV''																						as blart, --PV es Provisión
						   (SELECT CompanyCode 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs,                         
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) as DATETIME), 120)		as budat,                         
						   MIN(A.CurrencyCode)																					as waers, 
						   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = MIN(A.CurrencyCode) AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 1)				as kursf, 
						   ''''																						as xblnr, 
						   @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + 
						   Cast(SUM(FueledQtyLts) as VARCHAR) + '' '' + MIN(B.DepartureStation)						as bktxt, 
						   40																						as newbs, 
						   @Accounting																				as newko, --50210000 --DUDA Cual Cuenta usaremos?                          
						   ''''																						as newum, 
						   ''''																						as newbk, 
						   Cast(SUM(ConceptAmount) as DECIMAL(18, 2))												as wrbtr, 
						   ''''																						as dmbe2, 
						   ''''																						as mwskz, 
						   ''''																						as xmwst, 
						   ''''																						as xstba, 
						   (SELECT MIN(Division) 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as gsber,                          
						   CASE WHEN Upper(Substring(MIN(A.EquipmentNumber), 1, 2)) = Upper(''XA'') 
								Then Substring(MIN(A.EquipmentNumber), 1, 2) + ''-'' + Substring(MIN(A.EquipmentNumber), 3, 10) 
								ELSE MIN(A.EquipmentNumber) END														as kostl,   
						   ''''																						as aufnr, 
						   ''''																						as prctr, 
						   MIN(B.[DepartureStation])																as fkber,                      
						   ''''																						as segment, 
						   ''''																						as werks, 
						   ''''																						as fistl, 
						   ''''																						as zfbdt,                           
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateValue, 112) as DATETIME), 120)		as valut,                                             
						   Cast(SUM(FueledQtyLts) as VARCHAR)														as zuonr,
						   CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + Cast(SUM(FueledQtyLts) as VARCHAR) + '' '' + MIN(B.DepartureStation)
								ELSE @ItemText END																	as sgtxt, 
						   ''''																						as menge, 
						   ''''																						as meins, 
						   ''''																						as geber, 
						   ''0''																						as noTotal,
						   [NationalJetFuelTicketID]																		as JetFuelTicketID,
						   ''R'' DB
					FROM   [Process].[NationalJetFuelCost] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL)
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
					 GROUP BY [NationalJetFuelTicketID]) 
				UNION ALL
			       (SELECT ''''																						as tprec, 
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)			as bldat,                             
						   ''PV''																						as blart, --PV es Provisión
						   (SELECT CompanyCode 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs,                         
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) as DATETIME), 120)		as budat,                         
						   MIN(A.CurrencyCode)																					as waers, 
						   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = MIN(A.CurrencyCode) AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 1)				as kursf, 
						   ''''																						as xblnr, 
						   @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + 
						   Cast(SUM(FueledQtyLts) as VARCHAR) + '' '' + MIN(B.DepartureStation)						as bktxt, 
						   40																						as newbs, 
						   @Accounting																				as newko, --50210000 --DUDA Cual Cuenta usaremos?                          
						   ''''																						as newum, 
						   ''''																						as newbk, 
						   Cast(SUM(ConceptAmount) as DECIMAL(18, 2))												as wrbtr, 
						   ''''																						as dmbe2, 
						   ''''																						as mwskz, 
						   ''''																						as xmwst, 
						   ''''																						as xstba, 
						   (SELECT MIN(Division) 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as gsber,                          
						  -- CASE WHEN Upper(Substring(MIN(A.EquipmentNumber), 1, 2)) = Upper(''XA'') 
								--Then Substring(MIN(A.EquipmentNumber), 1, 2) + ''-'' + Substring(MIN(A.EquipmentNumber), 3, 10) 
								--ELSE MIN(A.EquipmentNumber) END														as kostl, 
						   LEFT(REPLACE(MIN(A.[EquipmentNumber]), ''-'', '''') + ''0000000000'', 10)						as kostl,
						   ''''																						as aufnr, 
						   ''''																						as prctr, 
						   MIN(B.[DepartureStation])																as fkber,                      
						   ''''																						as segment, 
						   ''''																						as werks, 
						   ''''																						as fistl, 
						   ''''																						as zfbdt,                           
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateValue, 112) as DATETIME), 120)		as valut,                                             
						   Cast(SUM(FueledQtyLts) as VARCHAR)														as zuonr,
						   CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + Cast(SUM(FueledQtyLts) as VARCHAR) + '' '' + MIN(B.DepartureStation)
								ELSE @ItemText END																	as sgtxt, 
						   ''''																						as menge, 
						   ''''																						as meins, 
						   ''''																						as geber, 
						   ''0''																						as noTotal,
						   [NationalJetFuelTicketID]																		as JetFuelTicketID,
						   ''C'' DB
					FROM   [Process].[NationalJetFuelCost] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
					 GROUP BY [NationalJetFuelTicketID]) 	)  poliZA ) Detalle		
	UNION ALL 
	SELECT row_iden, 
		   Cast(IDREG AS VARCHAR) IDREG, 
		   ''''tprec, 
		   bldat, 
		   blart, 
		   bukrs, 
		   budat, 
		   waers, 
		   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = waers AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 0)				as kursf,  
		   xblnr, 
		   bktxt, 
		   newbs, 
		   newko, 
		   newum, 
		   newbk, 
		   wrbtr, 
		   dmbe2, 
		   mwskz, 
		   xmwst, 
		   xstba, 
		   gsber, 
		   kostl, 
		   aufnr, 
		   prctr, 
		   fkber, 
		   segment, 
		   werks, 
		   fistl, 
		   zfbdt, 
		   valut, 
		   zuonr, 
		   sgtxt, 
		   menge, 
		   meins, 
		   geber, 
		   CAST(noTotal AS VARCHAR) noTotal,
		   NULL [JetFuelTicketID]
	FROM   OrdersPROD 
	) AS Result
	ORDER  BY row_iden, IDREG, newbs asc 



	--Paso 6 Actualizar tabla de Provision PolizaID con el Identity generado
	UPDATE A
	   SET A.PolicyID = @PolicyID
	  FROM [Process].[NationalJetFuelCost] AS A LEFT JOIN
		   [Itinerary].[Itinerary] AS B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	 WHERE [DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59''
	   AND A.[AirlineCode] = @AirlineCode
	   AND A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	   AND A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
	   AND B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'','')) 
	   AND A.PolicyID IS NULL
	
	SELECT @PolicyID PolicyID--, '''' ErrorMessage;  

END TRY

BEGIN CATCH 
  
    IF @@TRANCOUNT > 0 
      BEGIN 
          ROLLBACK TRANSACTION 
      END 

	SELECT -1 PolicyID--, ERROR_MESSAGE() ErrorMessage;

END CATCH; 

IF @@TRANCOUNT > 0 
  BEGIN 
      COMMIT TRANSACTION 
  END 

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[SavePolizaProvisionesInt]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[SavePolizaProvisionesInt]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160416
-- Description:	Polizas Save
-- [Process].[SavePolizaProvisionesInt] ''20151201'', ''20151216'', ''20151201'', ''20151215'', ''ok'', ''okasssss'', ''20160101'', ''20160101'', ''20160101'', ''Y4'', ''2400003,0000001,4000'', ''COD-EXT'', ''BOS,ATL,LA,DEN,LAX'', ''usuario''
-- ===============================================================
CREATE PROCEDURE [Process].[SavePolizaProvisionesInt]      
     @StartDateReal AS DATETIME  
    ,@EndDateReal AS DATETIME 
	,@StartDateComp AS DATETIME  
    ,@EndDateComp AS DATETIME   
	,@HeaderText AS VARCHAR(50)
	,@ItemText   AS VARCHAR(50) 
	,@DateValue AS DATETIME  
	,@DatePosting AS DATETIME
	,@DateBase AS DATETIME
	,@AirlineCode AS VARCHAR(3) 
	,@ProviderCodes AS VARCHAR(MAX) 
	,@ServiceCodes AS VARCHAR(MAX) 
	,@StationCodes AS VARCHAR(MAX) --Opcion XML
	,@UserSend AS NVARCHAR(50) = '' ''
AS  
BEGIN  
SET NOCOUNT ON; 

--Declarar Variables tipo tabla y variables para el procedimiento
 DECLARE @Acumulado AS TABLE (
	[JetFuelTicketID] [bigint] NULL,
	[subtotalRound] [decimal](18, 2) NULL,
	[row_iden] [bigint] NULL,
	[DepartureStation] [varchar](3) NULL,
	[CurrencyCode] [varchar](3) NULL,
	[EquipmentNumber] [varchar](12) NULL,
	[FueledQtyGals] [int] NULL,
	[LiabilityAccountNumber] [varchar](8) NULL,
	[ConceptAmount] [decimal](38, 2) NULL,
	[ServiceCode] [varchar](12) NULL,
	[TotalRegTicket] [int] NULL,
	[AirlineCode] [varchar](3) NULL
)
DECLARE @TableOrder AS TABLE (UNORDERED INT, ORDERED INT NULL)
DECLARE @TableMaxReg AS TABLE (row_iden INT, reg INT)
DECLARE @DocumentMax INT
SET @DocumentMax = 1
DECLARE @NumRegMax INT
SET @NumRegMax = 998
DECLARE @PolicyID BIGINT

--Declarar Constantes para el procedimiento
DECLARE @Accounting VARCHAR(17)
SET @Accounting = ''50211000''
DECLARE @Liability VARCHAR(17)
SET @Liability = ''20410111''

--Reinicia proceso
--DELETE  [Process].[JetFuelPolicy]
--DELETE  [Process].[JetFuelPolicyControl] --para solo mantener un reg mientras haya pruebas
--UPDATE [Process].JetFuelProvision
--   SET PolicyID = NULL

BEGIN TRANSACTION; 

BEGIN TRY
	--Paso 0 Orden con base en Ticket y Moneda para Real y Complementario. Se incluye CAST(CAST(waers AS VARBINARY) AS INT)
	INSERT @TableOrder (UNORDERED, ORDERED)
	SELECT DISTINCT (Row_number() OVER(PARTITION BY waers ORDER BY A.JetFuelTicketID asc) - 1 ) / @NumRegMax + 1 + CAST(CAST(waers AS VARBINARY) AS INT) AS rownumber, NULL 
			  FROM (
			       (SELECT MIN(A.CurrencyCode)																		as waers, --DUDA Que claves de moneda usaremos, es importante pues al hacer sumas debe estar unificada la moneda              [CurrencyCode]                       
						   40																						as newbs,
						   JetFuelTicketID
					FROM   [Process].[JetFuelProvision] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) 
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))				  
					GROUP  BY JetFuelTicketID) 
				   UNION ALL
				   (SELECT MIN(A.CurrencyCode)																		as waers, --DUDA Que claves de moneda usaremos, es importante pues al hacer sumas debe estar unificada la moneda              [CurrencyCode]                       
						   40																						as newbs,
						   JetFuelTicketID
					FROM   [Process].[JetFuelProvision] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))				  
					GROUP  BY JetFuelTicketID) 					
					) A	

	--Paso 1 Agregar registro en Poliza Control con filtros realizados y guardar información PolicyID
	INSERT INTO [Process].[JetFuelPolicyControl] 
		  ([CreationDate]
		  ,[Status]
		  ,[AirlineCode]
		  ,[ServiceCodes]
		  ,[ProviderCodes]
		  ,[AirportCodes]
		  ,[StartDateReal]
		  ,[EndDateReal]
		  ,[StartDateComplementary]
		  ,[EndDateComplementary]
		  ,[DateBaseline]
		  ,[DateValue]
		  ,[DatePosting]
		  ,[HeaderText]
		  ,[ItemText]
		  ,[SendByUserName])
	SELECT GETDATE()
		  ,''CREATED''
		  ,@AirlineCode
		  ,@ServiceCodes
		  ,@ProviderCodes
		  ,@StationCodes
		  ,@StartDateReal
		  ,@EndDateReal
		  ,@StartDateComp
		  ,@EndDateComp
		  ,@DateBase
		  ,@DateValue
		  ,@DatePosting
		  ,@HeaderText
		  ,@ItemText
		  ,@UserSend

	SET @PolicyID= @@IDENTITY


	--Paso 2.0 Guardar Acumulado Real y Complementario, registros NEWBS 50. Realiza Suma de galones y Tarifas 
INSERT INTO @Acumulado ([JetFuelTicketID]
		  ,[subtotalRound]
		  ,[row_iden]
		  ,[DepartureStation]
		  ,[CurrencyCode]
		  ,[EquipmentNumber]
		  ,[FueledQtyGals]
		  ,[LiabilityAccountNumber]
		  ,[ConceptAmount]
		  ,[ServiceCode]
		  ,[TotalRegTicket]
		  ,[AirlineCode])
	SELECT [JetFuelTicketID]
		  ,[subtotalRound]
		  ,( (Row_number() OVER (PARTITION BY CurrencyCode ORDER BY JetFuelTicketID) ) - 1 ) / @NumRegMax + 1 + CAST(CAST(CurrencyCode AS VARBINARY) AS INT)  [row_iden]
		  ,[DepartureStation]
		  ,[CurrencyCode]
		  ,[EquipmentNumber]
		  ,[FueledQtyGals]
		  ,[LiabilityAccountNumber]
		  ,[ConceptAmount]
		  ,[ServiceCode]
		  ,[TotalRegTicket]
		  ,[AirlineCode] 
	FROM
	(
	SELECT JetFuelTicketID, Cast(MIN(ConceptAmount) AS DECIMAL(18, 2)) as subtotalRound     	  
		  ,MIN(B.DepartureStation) DepartureStation, MIN (A.CurrencyCode) CurrencyCode, MIN(A.EquipmentNumber) EquipmentNumber
		  ,SUM(A.FueledQtyGals) FueledQtyGals, MIN(A.LiabilityAccountNumber) LiabilityAccountNumber, Sum(Cast(ConceptAmount AS DECIMAL(18, 2))) ConceptAmount
		  , MIN(ServiceCode) ServiceCode, Count(DISTINCT JetFuelTicketID) TotalRegTicket, MIN(A.[AirlineCode]) [AirlineCode]
	 FROM [Process].[JetFuelProvision] A LEFT JOIN
	  	  [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	WHERE (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) 
	  AND  A.[AirlineCode] = @AirlineCode
	  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
	  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
    GROUP BY [JetFuelTicketID]
	UNION ALL
   SELECT JetFuelTicketID, Cast(MIN(ConceptAmount) AS DECIMAL(18, 2)) as subtotalRound     	  
		  ,MIN(B.DepartureStation) DepartureStation, MIN (A.CurrencyCode) CurrencyCode, MIN(A.EquipmentNumber) EquipmentNumber
		  ,SUM(A.FueledQtyGals) FueledQtyGals, MIN(A.LiabilityAccountNumber) LiabilityAccountNumber, Sum(Cast(ConceptAmount AS DECIMAL(18, 2))) ConceptAmount
		  , MIN(ServiceCode) ServiceCode, Count(DISTINCT JetFuelTicketID) TotalRegTicket, MIN(A.[AirlineCode]) [AirlineCode]
	 FROM [Process].[JetFuelProvision] A LEFT JOIN
	  	  [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	WHERE [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
	  AND  A.[AirlineCode] = @AirlineCode
	  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
	  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
    GROUP BY [JetFuelTicketID]
	) A;
	


	--Paso 3 Guardar Documento y Registro de Real para determinar posteriormente el registro consecuente por documento en Complementario
	--INSERT INTO @TableMaxReg (row_iden, reg)
	--SELECT (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber)						as row_iden, 
	--	   Row_number() over (PARTITION BY (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber) ORDER BY newbs asc) as reg       
	--from   (SELECT (Row_number() OVER(PARTITION BY waers ORDER BY newbs asc) - 1 ) / @NumRegMax + 1 + CAST(CAST(waers AS VARBINARY) AS INT) AS rownumber,*
	--		  FROM (SELECT MIN(A.CurrencyCode)			as waers,                        
	--					   40							as newbs                       
	--				FROM   [Process].[JetFuelProvision] A LEFT JOIN
	--					   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	--				WHERE  [DepartureDate] BETWEEN @StartDateReal AND @EndDateReal
	--				  AND  A.[AirlineCode] = @AirlineCode
	--				  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
	--				  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
	--				  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
	--				  AND  A.PolicyID IS NULL
	--				 GROUP BY JetFuelTicketID) NewDoc) polMax;							 				 			 	 	  

	--Paso 4 Guardar OrdersPROD detalle final de registros NEWBS 50
	WITH OrdersPROD ( tprec, bldat, blart, bukrs, budat, waers, kursf, xblnr, bktxt, 
		 newbs, newko, newum, newbk, wrbtr, dmbe2, mwskz, xmwst, xstba, gsber, kostl 
		 , aufnr, prctr, fkber, segment, werks, fistl, zfbdt, valut, zuonr, sgtxt, 
		 menge, meins, geber, IDREG, noTotal, row_iden ) 
		 AS (SELECT ''''																						as tprec, 
					Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)		as bldat, 
					''PV''																					as blart, 
					(SELECT MIN(CompanyCode)
								FROM   [Airport].[Airline] B 
								WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs, 
					Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) AS DATETIME), 120)	as budat, 
					MIN(CurrencyCode)																		as waers, 
					''''																						as kursf, 
					''''																						as xblnr, 
					@HeaderText + '' ''  + 
					Cast(SUM(FueledQtyGals) as VARCHAR) + '' ''												as bktxt,
					 50																						as newbs, 
					@Liability																				as newko,
					''''																						as newum, 
					''''																						as newbk, 
					Cast(Cast(SUM(ConceptAmount) AS DECIMAL(18, 2)) as DECIMAL(18, 2))						as wrbtr, 
					''''																						as dmbe2, 
					''''																						as mwskz, 
					''''																						as xmwst, 
					''''																						as xstba, 
					''''																						as gsber, 
					''''																						as kostl, 
					''''																						as aufnr, 
					''''																						as prctr, 
					''''																						as fkber, 
					''''																						as segment, 
					''''																						as werks, 
					''''																						as fistl, 
					''''																						as zfbdt, -- solo en totales    
					''''																						as valut, 
					''''																						as zuonr, 
					CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + Cast(SUM(FueledQtyGals) as VARCHAR) + '' '' 
								ELSE @ItemText END															as sgtxt, 
					''''																						as menge, 
					''''																						as meins, 
					''''																						as geber,
					Cast(RIGHT(''000000'' + Cast((SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  
												 WHERE UNORDERED = row_iden) AS VARCHAR), 6)AS VARCHAR) 
					+ Cast(RIGHT(''000000'' + Cast(COUNT([TotalRegTicket])+1 as VARCHAR), 6) AS VARCHAR)      as IDREG, 
					COUNT([TotalRegTicket])																	as noTotal, 
					(SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = row_iden) row_iden 
			 FROM   @Acumulado A
			 GROUP  BY row_iden)

       

	--Paso 5 Insertar en resultado (Real y Complementario)
	INSERT INTO [Process].[JetFuelPolicy]
	      ([PolicyID]
	      ,[DocumentNumber]
	      ,[JetFuelTicketID]
	      ,[TPREC]
	      ,[IDREG]
	      ,[BLDAT]
	      ,[BLART]
	      ,[BUKRS]
	      ,[BUDAT]
	      ,[WAERS]
	      ,[KURSF]
	      ,[XBLNR]
	      ,[BKTXT]
	      ,[NEWBS]
	      ,[NEWKO]
	      ,[NEWUM]
	      ,[NEWBK]
	      ,[WRBTR]
	      ,[DMBE2]
	      ,[MWSKZ]
	      ,[XMWST]
	      ,[GSBER]
	      ,[KOSTL]
	      ,[AUFNR]
	      ,[PRCTR]
	      ,[FKBER]
	      ,[SEGMENT]
	      ,[WERKS]
	      ,[FISTL]
	      ,[ZFBDT]
	      ,[VALUT]
	      ,[ZUONR]
	      ,[SGTXT]
	      ,[MENGE]
	      ,[MEINS]
	      ,[GEBER]
	      ,[NOTOTAL])
	-- REGISTROS DE ESTIMADOS  
	SELECT @PolicyID PolicyID
		  ,row_iden
		  ,[JetFuelTicketID]
		  ,[TPREC]
		  ,[IDREG]
		  ,[BLDAT]
		  ,[BLART]
		  ,[BUKRS]
		  ,[BUDAT]
		  ,[WAERS]
		  ,[KURSF]
		  ,[XBLNR]
		  ,[BKTXT]
		  ,[NEWBS]
		  ,[NEWKO]
		  ,[NEWUM]
		  ,[NEWBK]
		  ,[WRBTR]
		  ,[DMBE2]
		  ,[MWSKZ]
		  ,[XMWST]
		  ,[GSBER]
		  ,[KOSTL]
		  ,[AUFNR]
		  ,[PRCTR]
		  ,[FKBER]
		  ,[SEGMENT]
		  ,[WERKS]
		  ,[FISTL]
		  ,[ZFBDT]
		  ,[VALUT]
		  ,[ZUONR]
		  ,[SGTXT]
		  ,[MENGE]
		  ,[MEINS]
		  ,[GEBER]
		  ,[NOTOTAL] 
	FROM (
	SELECT (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber)						as row_iden, 
		   Cast(RIGHT(''000000'' + Isnull(Cast((SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber) AS VARCHAR), ''''), 6) AS VARCHAR(6)) 
		   + Cast(RIGHT(''000000''+ Isnull(Cast(Row_number() over (PARTITION BY (SELECT ORDERED FROM (SELECT UNORDERED, ROW_NUMBER() OVER(ORDER BY UNORDERED) ORDERED FROM @TableOrder) O  WHERE UNORDERED = rownumber) ORDER BY [JetFuelTicketID] asc ) AS VARCHAR), ''''), 6) AS VARCHAR(6)) AS IDREG, 
		   ''''                                                       tprec, 
		   bldat                                                    bldat, 
		   blart, 
		   bukrs, 
		   budat, 
		   waers, 
		   kursf, 
		   xblnr, 
		   bktxt, 
		   Cast(newbs as VARCHAR)                                   as newbs, 
		   Cast(newko as VARCHAR)                                   as newko, 
		   newum, 
		   newbk, 
		   Cast(Cast(wrbtr as MONEY) as VARCHAR)                    as wrbtr, 
		   dmbe2, 
		   mwskz, 
		   xmwst, 
		   xstba, 
		   gsber, 
		   kostl, 
		   aufnr, 
		   prctr, 
		   fkber, 
		   segment, 
		   werks, 
		   fistl, 
		   zfbdt, 
		   valut, 
		   zuonr, 
		   sgtxt, 
		   menge, 
		   meins, 
		   geber, 
		   noTotal,
		   CASE WHEN DB = ''R'' THEN [JetFuelTicketID] ELSE NULL END [JetFuelTicketID] 
	from   (SELECT (Row_number() OVER(PARTITION BY waers ORDER BY [JetFuelTicketID] asc) - 1 ) / @NumRegMax + 1 + CAST(CAST(waers AS VARBINARY) AS INT) AS rownumber, * 
			  FROM ((SELECT ''''																						as tprec, 
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)			as bldat,                             
						   ''PV''																						as blart, --PV es Provisión
						   (SELECT CompanyCode 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs,                         
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) as DATETIME), 120)		as budat,                         
						   MIN(A.CurrencyCode)																					as waers, 
						   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = MIN(A.CurrencyCode) AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 1)				as kursf, 
						   ''''																						as xblnr, 
						   @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + 
						   Cast(SUM(FueledQtyGals) as VARCHAR) + '' '' + MIN(B.DepartureStation)						as bktxt, 
						   40																						as newbs, 
						   @Accounting																				as newko, --50210000 --DUDA Cual Cuenta usaremos?                          
						   ''''																						as newum, 
						   ''''																						as newbk, 
						   Cast(SUM(ConceptAmount) as DECIMAL(18, 2))												as wrbtr, 
						   ''''																						as dmbe2, 
						   ''''																						as mwskz, 
						   ''''																						as xmwst, 
						   ''''																						as xstba, 
						   (SELECT MIN(Division) 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as gsber,                          
						  -- CASE WHEN Upper(Substring(MIN(A.EquipmentNumber), 1, 2)) = Upper(''XA'') 
								--Then Substring(MIN(A.EquipmentNumber), 1, 2) + ''-'' + Substring(MIN(A.EquipmentNumber), 3, 10) 
								--ELSE MIN(A.EquipmentNumber) END														as kostl,
						   
						   LEFT(REPLACE(MIN(A.[EquipmentNumber]), ''-'', '''') + ''0000000000'', 10)						as kostl,   
						   ''''																						as aufnr, 
						   ''''																						as prctr, 
						   MIN(B.[DepartureStation])																as fkber,                      
						   ''''																						as segment, 
						   ''''																						as werks, 
						   ''''																						as fistl, 
						   ''''																						as zfbdt,                           
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateValue, 112) as DATETIME), 120)		as valut,                                             
						   Cast(SUM(FueledQtyGals) as VARCHAR)														as zuonr,
						   CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + Cast(SUM(FueledQtyGals) as VARCHAR) + '' '' + MIN(B.DepartureStation)
								ELSE @ItemText END																	as sgtxt, 
						   ''''																						as menge, 
						   ''''																						as meins, 
						   ''''																						as geber, 
						   ''0''																						as noTotal,
						   [JetFuelTicketID]																		as JetFuelTicketID,
						   ''R'' DB
					FROM   [Process].[JetFuelProvision] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  (([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL)
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
					 GROUP BY JetFuelTicketID) 
				UNION ALL
			       (SELECT ''''																						as tprec, 
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateBase, 112) as DATETIME), 120)			as bldat,                             
						   ''PV''																						as blart, --PV es Provisión
						   (SELECT CompanyCode 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as bukrs,                         
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DatePosting, 112) as DATETIME), 120)		as budat,                         
						   MIN(A.CurrencyCode)																					as waers, 
						   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = MIN(A.CurrencyCode) AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 1)				as kursf, 
						   ''''																						as xblnr, 
						   @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + 
						   Cast(SUM(FueledQtyGals) as VARCHAR) + '' '' + MIN(B.DepartureStation)						as bktxt, 
						   40																						as newbs, 
						   @Accounting																				as newko, --50210000 --DUDA Cual Cuenta usaremos?                          
						   ''''																						as newum, 
						   ''''																						as newbk, 
						   Cast(SUM(ConceptAmount) as DECIMAL(18, 2))												as wrbtr, 
						   ''''																						as dmbe2, 
						   ''''																						as mwskz, 
						   ''''																						as xmwst, 
						   ''''																						as xstba, 
						   (SELECT MIN(Division) 
									  FROM   [Airport].[Airline]  
									  WHERE  [AirlineCode] = MIN(A.[AirlineCode]))									as gsber,                          
						   CASE WHEN Upper(Substring(MIN(A.EquipmentNumber), 1, 2)) = Upper(''XA'') 
								Then Substring(MIN(A.EquipmentNumber), 1, 2) + ''-'' + Substring(MIN(A.EquipmentNumber), 3, 10) 
								ELSE MIN(A.EquipmentNumber) END														as kostl,   
						   ''''																						as aufnr, 
						   ''''																						as prctr, 
						   MIN(B.[DepartureStation])																as fkber,                      
						   ''''																						as segment, 
						   ''''																						as werks, 
						   ''''																						as fistl, 
						   ''''																						as zfbdt,                           
						   Convert(VARCHAR(10), Cast(Convert(VARCHAR(10), @DateValue, 112) as DATETIME), 120)		as valut,                                             
						   Cast(SUM(FueledQtyGals) as VARCHAR)														as zuonr,
						   CASE WHEN (@ItemText = '''' OR @ItemText IS NULL) 
								THEN @HeaderText + '' '' + MIN(A.EquipmentNumber) + '' '' + Cast(SUM(FueledQtyGals) as VARCHAR) + '' '' + MIN(B.DepartureStation)
								ELSE @ItemText END																	as sgtxt, 
						   ''''																						as menge, 
						   ''''																						as meins, 
						   ''''																						as geber, 
						   ''0''																						as noTotal,
						   [JetFuelTicketID]																		as JetFuelTicketID,
						   ''C'' DB
					FROM   [Process].[JetFuelProvision] A LEFT JOIN
						   [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
					WHERE  [DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''
					  AND  A.[AirlineCode] = @AirlineCode
					  AND  A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
					  AND  A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'','')) 
					  AND  B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))
					 GROUP BY JetFuelTicketID) 	)  poliZA ) Detalle		
	UNION ALL 
	SELECT row_iden, 
		   Cast(IDREG AS VARCHAR) IDREG, 
		   ''''tprec, 
		   bldat, 
		   blart, 
		   bukrs, 
		   budat, 
		   waers, 
		   ISNULL((SELECT [Rate]  FROM [Finance].[ExchangeRates] WHERE [CurrencyCode] = waers AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1), 0)				as kursf,  
		   xblnr, 
		   bktxt, 
		   newbs, 
		   newko, 
		   newum, 
		   newbk, 
		   wrbtr, 
		   dmbe2, 
		   mwskz, 
		   xmwst, 
		   xstba, 
		   gsber, 
		   kostl, 
		   aufnr, 
		   prctr, 
		   fkber, 
		   segment, 
		   werks, 
		   fistl, 
		   zfbdt, 
		   valut, 
		   zuonr, 
		   sgtxt, 
		   menge, 
		   meins, 
		   geber, 
		   CAST(noTotal AS VARCHAR) noTotal,
		   NULL [JetFuelTicketID]
	FROM   OrdersPROD 
	) AS Result
	ORDER  BY row_iden, IDREG, newbs asc 



	--Paso 6 Actualizar tabla de Provision PolizaID con el Identity generado
	UPDATE A
	   SET A.PolicyID = @PolicyID
	  FROM [Process].[JetFuelProvision] AS A LEFT JOIN
		   [Itinerary].[Itinerary] AS B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey)
	 WHERE [DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59''
	   AND A.[AirlineCode] = @AirlineCode
	   AND A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'','')) 
	   AND A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
	   AND B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'','')) 
	   AND A.PolicyID IS NULL
	
	SELECT @PolicyID PolicyID--, '''' ErrorMessage;  

END TRY

BEGIN CATCH 
  
    IF @@TRANCOUNT > 0 
      BEGIN 
          ROLLBACK TRANSACTION 
      END 

	SELECT -1 PolicyID--, ERROR_MESSAGE() ErrorMessage;

END CATCH; 

IF @@TRANCOUNT > 0 
  BEGIN 
      COMMIT TRANSACTION 
  END 

END
' 
END
GO
/****** Object:  StoredProcedure [Process].[UploadManualReconcile]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[UploadManualReconcile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 05/10/2016
-- Description:	Conciliación Manual
-- =============================================
CREATE PROCEDURE [Process].[UploadManualReconcile] 
	@ReconcileInfo AS [Process].[NationalJetFuelManualReconcileType] READONLY
AS
BEGIN

	--Step 0 Inicializar Variables
	DECLARE @NumberRecordsProcess INT; 
	DECLARE @NumberRecordsTotal INT;
    DECLARE @Percentage INT; 
	DECLARE @SubtotalAmount DECIMAL(18,2)
	DECLARE @Pending AS TABLE (ID BIGINT)

	--Variables de remesa
	DECLARE @RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5),
	@Username NVARCHAR(50)

	--Inicializar variables de remesa
	SELECT @RemittanceID = MIN([RemittanceID]),
	       @MonthYear = MIN([MonthYear]),
		   @Period = MIN([Period]),
		   @Username = MIN([Username])
	  FROM @ReconcileInfo

BEGIN TRANSACTION 

BEGIN TRY 

	--validacion principal de mnv y closed
	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	        WHERE RemittanceID = @RemittanceID
				AND MonthYear = @MonthYear
				AND Period = @Period
				AND ConfirmationStatusCode = ''CLO'')
	BEGIN
		SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 96 Verify --No es vible debido a que la Remesa se encuentra cerrrada para conciliación
		--Remittance is closed
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
					WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period 
					AND [Status] = ''ERRO'')
		BEGIN
			SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 97 Verify --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
			--Different errors to invalid Equipment Number
		END
		ELSE 
		BEGIN		
		
			IF EXISTS (SELECT DISTINCT 
							   [RemittanceID]
							  ,[MonthYear]
							  ,[Period]
						  FROM [Process].[NationalJetFuelInvoiceDetail]
						 WHERE [ID] IN (SELECT [ID] FROM @ReconcileInfo)
						   AND ([RemittanceID]+[MonthYear]+[Period]) <> @RemittanceID+@MonthYear+@Period)
			BEGIN
				--Paso 1.- Mostrar remesas que ya existen en DB
				SELECT DISTINCT 
					   [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,1 [Verify] 
				  FROM [Process].[NationalJetFuelInvoiceDetail]
				 WHERE [ID] IN (SELECT [ID] FROM @ReconcileInfo)
	 			   AND ([RemittanceID]+[MonthYear]+[Period] <> @RemittanceID+@MonthYear+@Period)
			END
			ELSE
			BEGIN

				--Step 1 Total de Registros en Invoice Detail 
				SELECT @NumberRecordsTotal = COUNT([ID]) 
				  FROM [Process].[NationalJetFuelInvoiceDetail]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period;				

	
				--Step 2 Eliminar información de Conciliaciones Anteriores para la Remesa 
				EXEC [Process].[JetFuelReconciliationManualRevert] @RemittanceID, @MonthYear, @Period; 

				--Step 2.5 Guardar info de los ID pendientes
				INSERT INTO @Pending (ID)
				SELECT ID  
				  FROM [Process].[NationalJetFuelInvoiceDetail]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period
				   AND ([ReconciliationStatus] = ''PENDING'' OR [ReconciliationStatus] IS NULL)

				--Step 3 Indicar que inicia el proceso
				UPDATE [Process].[NationalJetFuelInvoiceControl]
				   SET StartDateProcess = GETDATE(),
					   RecordsToProcess = @NumberRecordsTotal, 
					   CountRecords = @NumberRecordsTotal,
					   DateReconciled = GETDATE(),
					   StatusProcessCode = ''RUN''
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period;

				--Step 4 Log los que no tengan ID de InvoiceDetail valido
				INSERT INTO [Process].[NationalJetFuelReconciliationManualLoadLog]
				(  [RemittanceID]
				  ,[MonthYear]
				  ,[Period]
				  ,[ID]
				  ,[PeriodCode]
				  ,[Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
				  ,[EquipmentNumber]
				  ,[DepartureStation]
				  ,[ArrivalStation]
				  ,[NationalJetFuelTicketID]
				  ,[FuelingStartDate]
				  ,[FuelingEndDate]
				  ,[TicketNumber]
				  ,[FueledQtyLts]
				  ,[RemainingQtyKgs]
				  ,[RequestedQtyKgs]
				  ,[FueledQtyKgs]
				  ,[DensityFactor]
				  ,[PemexSubTotal]
				  ,[SuministroSubTotal]
				  ,[FleteSubTotal]
				  ,[Iva]
				  ,[PrecioSubTotal]
				  ,[Total]
				  ,[ErrorDescription]  )
				SELECT [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,[ID]
					  ,[PeriodCode]
					  ,[Sequence]
					  ,[AirlineCode]
					  ,[FlightNumber]
					  ,[ItineraryKey]
					  ,[EquipmentNumber]
					  ,[DepartureStation]
					  ,[ArrivalStation]
					  ,[NationalJetFuelTicketID]
					  ,[FuelingStartDate]
					  ,[FuelingEndDate]
					  ,[TicketNumber]
					  ,[FueledQtyLts]
					  ,[RemainingQtyKgs]
					  ,[RequestedQtyKgs]
					  ,[FueledQtyKgs]
					  ,[DensityFactor]
					  ,[PemexSubTotal]
					  ,[SuministroSubTotal]
					  ,[FleteSubTotal]
					  ,[Iva]
					  ,[PrecioSubTotal]
					  ,[Total]
					  ,''ID National Jet Fuel Invoice Detail Invalid''
				  FROM @ReconcileInfo
				 WHERE [ID] NOT IN (SELECT [ID]
									  FROM [Process].[NationalJetFuelInvoiceDetail]
									 WHERE RemittanceID = @RemittanceID
									   AND MonthYear = @MonthYear
									   AND Period = @Period)

				--Step 4.5 Log los que tengan ID de InvoiceDetail valido y este ya conciliado
				INSERT INTO [Process].[NationalJetFuelReconciliationManualLoadLog]
				(  [RemittanceID]
				  ,[MonthYear]
				  ,[Period]
				  ,[ID]
				  ,[PeriodCode]
				  ,[Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
				  ,[EquipmentNumber]
				  ,[DepartureStation]
				  ,[ArrivalStation]
				  ,[NationalJetFuelTicketID]
				  ,[FuelingStartDate]
				  ,[FuelingEndDate]
				  ,[TicketNumber]
				  ,[FueledQtyLts]
				  ,[RemainingQtyKgs]
				  ,[RequestedQtyKgs]
				  ,[FueledQtyKgs]
				  ,[DensityFactor]
				  ,[PemexSubTotal]
				  ,[SuministroSubTotal]
				  ,[FleteSubTotal]
				  ,[Iva]
				  ,[PrecioSubTotal]
				  ,[Total]
				  ,[ErrorDescription]  )
				SELECT [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,[ID]
					  ,[PeriodCode]
					  ,[Sequence]
					  ,[AirlineCode]
					  ,[FlightNumber]
					  ,[ItineraryKey]
					  ,[EquipmentNumber]
					  ,[DepartureStation]
					  ,[ArrivalStation]
					  ,[NationalJetFuelTicketID]
					  ,[FuelingStartDate]
					  ,[FuelingEndDate]
					  ,[TicketNumber]
					  ,[FueledQtyLts]
					  ,[RemainingQtyKgs]
					  ,[RequestedQtyKgs]
					  ,[FueledQtyKgs]
					  ,[DensityFactor]
					  ,[PemexSubTotal]
					  ,[SuministroSubTotal]
					  ,[FleteSubTotal]
					  ,[Iva]
					  ,[PrecioSubTotal]
					  ,[Total]
					  ,''ID National Jet Fuel Invoice Detail Valid,but Reconciled ''
				  FROM @ReconcileInfo
				 WHERE [ID] IN (SELECT [InvoiceDetailID]
								  FROM [Process].[NationalJetFuelReconciliationDetail]
								 WHERE RemittanceID = @RemittanceID
								   AND MonthYear = @MonthYear
								   AND Period = @Period)

				--Step 5 Log los que no tengan un registro que se encuentre en Cost
				INSERT INTO [Process].[NationalJetFuelReconciliationManualLoadLog]
				(  [RemittanceID]
				  ,[MonthYear]
				  ,[Period]
				  ,[ID]
				  ,[PeriodCode]
				  ,[Sequence]
				  ,[AirlineCode]
				  ,[FlightNumber]
				  ,[ItineraryKey]
				  ,[EquipmentNumber]
				  ,[DepartureStation]
				  ,[ArrivalStation]
				  ,[NationalJetFuelTicketID]
				  ,[FuelingStartDate]
				  ,[FuelingEndDate]
				  ,[TicketNumber]
				  ,[FueledQtyLts]
				  ,[RemainingQtyKgs]
				  ,[RequestedQtyKgs]
				  ,[FueledQtyKgs]
				  ,[DensityFactor]
				  ,[PemexSubTotal]
				  ,[SuministroSubTotal]
				  ,[FleteSubTotal]
				  ,[Iva]
				  ,[PrecioSubTotal]
				  ,[Total]
				  ,[ErrorDescription]  )
				SELECT A.[RemittanceID]
					  ,A.[MonthYear]
					  ,A.[Period]
					  ,A.[ID]
					  ,A.[PeriodCode]
					  ,A.[Sequence]
					  ,A.[AirlineCode]
					  ,A.[FlightNumber]
					  ,A.[ItineraryKey]
					  ,A.[EquipmentNumber]
					  ,A.[DepartureStation]
					  ,A.[ArrivalStation]
					  ,A.[NationalJetFuelTicketID]
					  ,A.[FuelingStartDate]
					  ,A.[FuelingEndDate]
					  ,A.[TicketNumber]
					  ,A.[FueledQtyLts]
					  ,A.[RemainingQtyKgs]
					  ,A.[RequestedQtyKgs]
					  ,A.[FueledQtyKgs]
					  ,A.[DensityFactor]
					  ,A.[PemexSubTotal]
					  ,A.[SuministroSubTotal]
					  ,A.[FleteSubTotal]
					  ,A.[Iva]
					  ,A.[PrecioSubTotal]
					  ,A.[Total]
					  ,''National Jet Fuel Cost Invalido''
				  FROM @ReconcileInfo A LEFT JOIN
					   [Process].[NationalJetFuelCost] B ON (A.[PeriodCode] = B.[PeriodCode]
													  AND A.[Sequence] = B.[Sequence]
													  AND A.[AirlineCode] = B.[AirlineCode]
													  AND A.[FlightNumber] = B.[FlightNumber]
													  AND A.[ItineraryKey] = B.[ItineraryKey]
													  AND A.[NationalJetFuelTicketID] = B.[NationalJetFuelTicketID]
													  AND A.[TicketNumber] = B.[TicketNumber])	
				 WHERE B.[PeriodCode] IS NULL


				--Step 6 Cuando ya sean registros validos en InvoiceDatail y Cost
				INSERT INTO [Process].[NationalJetFuelReconciliationDetail]
				   ([InvoiceDetailID]
				   ,[RemittanceID]
				   ,[MonthYear]
				   ,[Period]
				   ,[AirlineCode]
				   ,[InvoiceStationCode]
				   ,[InvoiceNumber]
				   ,[InvoiceDate]
				   ,[ElectronicInvoiceNumber]
				   ,[ElectronicInvoiceDate]
				   ,[InvoiceTicketNumber]
				   ,[InvoiceFlightNumber]
				   ,[InvoiceEquipmentNumber]
				   ,[InvoiceVolumeM3]
				   ,[InvoiceSubtotalAmount]
				   ,[PeriodCode]
				   ,[CostTicketNumber]
				   ,[CostDepartureDate]
				   ,[CostFlightNumber]
				   ,[CostEquipmentNumber]
				   ,[DepartureStation]
				   ,[ArrivalStation]
				   ,[CostFueledQtyLts]
				   ,[CostConceptAmount]
				   ,[InvoiceCostVariance]
				   ,[ReconciliationType]
				   ,[ReconciliationStatus])
				SELECT DISTINCT  --para garantizar registros diferentes
					   A.[ID]
					  ,B.[RemittanceID]
					  ,B.[MonthYear]
					  ,B.[Period]
					  ,B.[AirlineCode]
					  ,B.[StationCode]		  
					  ,B.[InvoiceNumber]
					  ,B.[InvoiceDate]
					  ,B.[ElectronicInvoiceNumber]
					  ,B.[ElectronicInvoiceDate]
					  ,B.[TicketNumber]
					  ,B.[FlightNumber]
					  ,B.[EquipmentNumber]
					  ,B.[VolumeM3]
					  ,B.[SubtotalAmount]
					  ,C.[PeriodCode]    
					  ,C.[TicketNumber] CostTicketNumber
					  ,C.[DepartureDate]
					  ,C.[FlightNumber] CostFlightNumber
					  ,C.[EquipmentNumber] CostEquipmentNumber
					  ,C.[DepartureStation]
					  ,C.[ArrivalStation]	
					  ,C.[FueledQtyLts]
					  ,C.[ConceptAmount]
					  ,ABS(C.ConceptAmount - B.SubtotalAmount) [Variance]
					  ,''MANUAL'' [ReconciliationType]
					  ,CASE WHEN ABS(C.ConceptAmount - B.SubtotalAmount) <= ISNULL((SELECT TOP 1 [ToleranceValue] 
																					  FROM [Catalog].[ReconciliationTolerance]
																					 WHERE [ServiceCode] = ''CM''
																					   AND [CurrencyCode] = ''MXN''
																					   AND [ToleranceTypeCode] = ''MONEY''
																					   AND [Status] = 1), 0) 
							THEN ''OK'' 
							ELSE ''DIFF'' END [Status]
				 FROM @ReconcileInfo A LEFT JOIN
					  [Process].[NationalJetFuelInvoiceDetail] B ON (A.ID = B.ID) LEFT JOIN
					  ( SELECT A.[PeriodCode]
							  ,A.[Sequence]
							  ,A.[AirlineCode]
							  ,A.[FlightNumber]
							  ,A.[ItineraryKey]
							  ,A.[NationalJetFuelTicketID]
							  ,A.[TicketNumber]
							  ,A.[EquipmentNumber]
							  ,B.[DepartureDate]
							  ,B.[DepartureStation]
							  ,B.[ArrivalDate]
							  ,B.[ArrivalStation]
							  ,SUM([FueledQtyLts]) [FueledQtyLts]
							  ,SUM([ConceptAmount]) [ConceptAmount]
						  FROM [Process].[NationalJetFuelCost] AS A LEFT JOIN
							   [Itinerary].[Itinerary] AS B ON (A.[Sequence] = B.[Sequence]
															AND A.[AirlineCode] = B.[AirlineCode]
															AND A.[FlightNumber] = B.[FlightNumber]
															AND A.[ItineraryKey] = B.[ItineraryKey])
						 GROUP BY A.[PeriodCode]
							  ,A.[Sequence]
							  ,A.[AirlineCode]
							  ,A.[FlightNumber]
							  ,A.[ItineraryKey]
							  ,A.[NationalJetFuelTicketID]
							  ,A.[TicketNumber]
							  ,A.[EquipmentNumber]	  
							  ,B.[DepartureDate]
							  ,B.[DepartureStation]
							  ,B.[ArrivalDate]
							  ,B.[ArrivalStation] ) C ON (A.[PeriodCode] = C.[PeriodCode]
													  AND A.[Sequence] = C.[Sequence]
													  AND A.[AirlineCode] = C.[AirlineCode]
													  AND A.[FlightNumber] = C.[FlightNumber]
													  AND A.[ItineraryKey] = C.[ItineraryKey]
													  AND A.[NationalJetFuelTicketID] = C.[NationalJetFuelTicketID]
													  AND A.[TicketNumber] = C.[TicketNumber])
				WHERE A.ID NOT IN (SELECT ID 
										FROM [Process].[NationalJetFuelReconciliationManualLoadLog]
									WHERE [RemittanceID] = @RemittanceID
										AND [MonthYear] = @MonthYear
										AND [Period] = @Period)
				  AND A.ID IN (SELECT ID FROM @Pending);


			--Cuantos registros inserto y SUM de SubtotalAmount
			SET @NumberRecordsProcess = @@ROWCOUNT; 

			SET @SubtotalAmount = (SELECT SUM(InvoiceSubtotalAmount) 
									 FROM [Process].[NationalJetFuelReconciliationDetail]
									WHERE RemittanceID = @RemittanceID
									  AND MonthYear = @MonthYear
									  AND Period = @Period
									  AND [ReconciliationType] = ''MANUAL'');--no se requiere filtrar por pendientes pues los que conciliaron manual al ser insertados fueron filtrados ya

			--Step 7 Update [NationalJetFuelInvoiceDetail] MATCHED
			UPDATE [Process].[NationalJetFuelInvoiceDetail]
			   SET [ReconciliationStatus] = B.[ReconciliationStatus]
			  FROM [Process].[NationalJetFuelInvoiceDetail] A INNER JOIN
				   [Process].[NationalJetFuelReconciliationDetail] B ON (A.[ID] = B.[InvoiceDetailID])
			 WHERE B.RemittanceID = @RemittanceID
			   AND B.MonthYear = @MonthYear
			   AND B.Period = @Period
			   AND B.[ReconciliationType] = ''MANUAL'';--no se requiere filtrar por pendientes pues los que conciliaron manual al ser insertados fueron filtrados ya
	  
			--Step 8 Update [NationalJetFuelCost] MATCHED
			UPDATE [Process].[NationalJetFuelCost]
			   SET [ReconciliationStatus] = B.[ReconciliationStatus],
				   [InvoiceDetailID] = B.[InvoiceDetailID]
			  FROM [Process].[NationalJetFuelCost] A INNER JOIN
				   [Process].[NationalJetFuelReconciliationDetail] B  ON (A.[PeriodCode] = B.[PeriodCode] AND
																		  A.[AirlineCode] = B.[AirlineCode] AND
																		  A.[FlightNumber] = B.[CostFlightNumber] AND
																		  A.[TicketNumber] = B.[CostTicketNumber] AND
																		  A.[EquipmentNumber] = B.[CostEquipmentNumber])
			 WHERE B.RemittanceID = @RemittanceID
			   AND B.MonthYear = @MonthYear
			   AND B.Period = @Period
			   AND B.[ReconciliationType] = ''MANUAL'';--no se requiere filtrar por pendientes pues los que conciliaron manual al ser insertados fueron filtrados ya		  		


			--Step 9 Update Control (Porcentaje, CountReconciledRecords y ReconciledSubtotalAmount)
			IF ( @NumberRecordsProcess > 0 )
			BEGIN 		
				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
						+ @NumberRecordsProcess,
						[CountReconciledRecords] = ISNULL([CountReconciledRecords], 0)
						+ @NumberRecordsProcess,
						[ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0)
						+ @SubtotalAmount
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
												/ [RecordsToProcess] )
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				SELECT  @Percentage = [ProcessProgress]
				  FROM  [Process].[NationalJetFuelInvoiceControl]
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period;
			END; 	

			--Step 10 Los que no cumplieron con el criterio, se cuentan los restantes
			SELECT  @NumberRecordsProcess = @NumberRecordsTotal
							- ( SELECT  ISNULL([RecordsProcessed], 0)
								FROM    [Process].[NationalJetFuelInvoiceControl]
								WHERE   RemittanceID = @RemittanceID
									AND MonthYear = @MonthYear
									AND Period = @Period
							  );	

			IF ( @NumberRecordsProcess > 0 )
			BEGIN 		
				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [RecordsProcessed] = ISNULL([RecordsProcessed], 0)
						+ @NumberRecordsProcess
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [ProcessProgress] = ( [RecordsProcessed] * 100.00
												/ [RecordsToProcess] )
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				SELECT  @Percentage = [ProcessProgress]
				  FROM  [Process].[NationalJetFuelInvoiceControl]
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period;
			END; 

			--Step 11 Cuando no hay registros a procesar (Idealmente en Remesas siempre hay registros)
			IF ( @NumberRecordsProcess = 0 )
			BEGIN 		
				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [RecordsProcessed] = @NumberRecordsTotal
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [ProcessProgress] = 100.00
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 

				SELECT  @Percentage = [ProcessProgress]
				  FROM  [Process].[NationalJetFuelInvoiceControl]
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period;
			END; 


			--Step 12 INDICAR QUE EL PROCESO TERMINO EN STATUS DE PROCESO  --FIN CODE DE TABLA [PROCESS].[STATUSPROCESS] 
			UPDATE [Process].[NationalJetFuelInvoiceControl]
			   SET StatusProcessCode = ''FIN'',
				   EndDateProcess = GETDATE(),
				   [CountReconciledRecords] = ISNULL([CountReconciledRecords], 0),
				   [ReconciledSubtotalAmount] = ISNULL([ReconciledSubtotalAmount], 0),
				   [ProcessedByUserName] = @Username
			 WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;

			--Step 13 Los registros que no conciliaron se marcan como PENDING
			UPDATE [Process].[NationalJetFuelInvoiceDetail]
			   SET [ReconciliationStatus] = ''PENDING''
			 WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period
			   AND [ReconciliationStatus] IS NULL;


			--STEP 14 REVISAR SI EL PROCESO FUE OK O TERMINO CON REGISTROS ERRONEOS 
			DECLARE @numError INT; 

			SELECT  @numError = COUNT(CASE WHEN [ReconciliationStatus] = ''PENDING'' THEN 1 ELSE 0 END)
			FROM    [Process].[NationalJetFuelInvoiceDetail]
			WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period;

			IF (@numError > 0 )
				BEGIN 
					UPDATE  [Process].[NationalJetFuelInvoiceControl]
					SET     [CalculationStatusCode] = ''ERR'', --CALCULATED WITH ERRORS 
							[ReconciliationStatusCode] = ''PROCESSED ERROR''
					WHERE RemittanceID = @RemittanceID
					   AND MonthYear = @MonthYear
					   AND Period = @Period;
				END; 
			ELSE
				BEGIN 
					UPDATE  [Process].[NationalJetFuelInvoiceControl]
					SET     [CalculationStatusCode] = ''CAL'', --CALCULATED 
							[ReconciliationStatusCode] = ''PROCESSED OK''
					WHERE RemittanceID = @RemittanceID
					   AND MonthYear = @MonthYear
					   AND Period = @Period;
				END; 

			IF EXISTS (SELECT [LogID]
						 FROM [Process].[NationalJetFuelReconciliationManualLoadLog]
						WHERE RemittanceID = @RemittanceID
						  AND MonthYear = @MonthYear
						  AND Period = @Period)
			BEGIN
				SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 98 Verify
			END

			END								
		END
	END	 	    

END TRY 

BEGIN CATCH  

	SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 99 Verify
	   
    IF @@TRANCOUNT > 0 
      BEGIN 	  
          ROLLBACK TRANSACTION 
      END 

END CATCH; 

IF @@TRANCOUNT > 0 
  
  BEGIN 
      COMMIT TRANSACTION 
  END 

END




' 
END
GO
/****** Object:  StoredProcedure [Process].[UploadNonconformity]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[UploadNonconformity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 06/12/2016
-- Description:	Inconformidades
-- =============================================
CREATE PROCEDURE [Process].[UploadNonconformity] 
	@ReconcileInfo AS [Process].[NationalJetFuelNonconformityType] READONLY
AS
BEGIN

	--Step 0 Inicializar Variables
	DECLARE @NumberRecordsProcess INT; 
	DECLARE @NumberRecordsTotal INT;
    DECLARE @Percentage INT; 
	DECLARE @SubtotalAmount DECIMAL(18,2)

	--Variables de remesa
	DECLARE @RemittanceID AS VARCHAR(8),
	@MonthYear VARCHAR(4),
	@Period VARCHAR(5),
	@Username NVARCHAR(50)

	--Inicializar variables de remesa
	SELECT @RemittanceID = MIN([RemittanceID]),
	       @MonthYear = MIN([MonthYear]),
		   @Period = MIN([Period]),
		   @Username = MIN([Username])
	  FROM @ReconcileInfo

BEGIN TRANSACTION 

BEGIN TRY 

	--validacion principal de mnv y closed
	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	        WHERE RemittanceID = @RemittanceID
				AND MonthYear = @MonthYear
				AND Period = @Period
				AND NonconformityStatusCode = ''CLOSED'')
	BEGIN
		SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 96 Verify --No es vible debido a que la Remesa se encuentra cerrrada para inconformidad
		--Remittance is closed
	END
	ELSE
	BEGIN
		--IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
		--			WHERE RemittanceID = @RemittanceID
		--			AND MonthYear = @MonthYear
		--			AND Period = @Period 
		--			AND [Status] = ''ERRO'')
		--BEGIN
		--	SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 97 Verify --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
		--	--Different errors to invalid Equipment Number
		--END
		--ELSE 
		BEGIN		
		
			IF EXISTS (SELECT DISTINCT 
							   [RemittanceID]
							  ,[MonthYear]
							  ,[Period]
						  FROM [Process].[NationalJetFuelInvoiceDetail]
						 WHERE [ID] IN (SELECT [ID] FROM @ReconcileInfo)
						   AND ([RemittanceID]+[MonthYear]+[Period]) <> @RemittanceID+@MonthYear+@Period)
			BEGIN
				--Paso 1.- Mostrar remesas que no corresponden a los IDs del archivo
				SELECT DISTINCT 
					   [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,1 [Verify] 
				  FROM [Process].[NationalJetFuelInvoiceDetail]
				 WHERE [ID] IN (SELECT [ID] FROM @ReconcileInfo)
	 			   AND ([RemittanceID]+[MonthYear]+[Period] <> @RemittanceID+@MonthYear+@Period)
			END
			ELSE
			BEGIN

				--Step 1 Total de Registros en Invoice Detail 
				SELECT @NumberRecordsTotal = COUNT([ID]) 
				  FROM [Process].[NationalJetFuelInvoiceDetail]
				 WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period;				

	
				--Step 2 Eliminar información de Inconformidades Anteriores para la Remesa 
				DELETE [Process].[NationalJetFuelNonconformityLoadLog]
				WHERE RemittanceID = @RemittanceID
				   AND MonthYear = @MonthYear
				   AND Period = @Period;

				--Step 4 Log los que no tengan ID de InvoiceDetail valido
				INSERT INTO [Process].[NationalJetFuelNonconformityLoadLog]
				(  [RemittanceID]
				  ,[MonthYear]
				  ,[Period]
				  ,[ID]
				  ,[AirlineCode]
				  ,[ProviderNumber]
				  ,[ServiceCode]
				  ,[FederalTaxCode]
				  ,[StationCode]
				  ,[InvoiceNumber]
				  ,[CustomerNumber]
				  ,[CustomerName]
				  ,[InvoiceDate]
				  ,[ElectronicInvoiceNumber]
				  ,[ElectronicInvoiceDate]
				  ,[ProductNumber]
				  ,[ProductDescription]
				  ,[TicketNumber]
				  ,[OperationType]
				  ,[FlightNumber]
				  ,[EquipmentNumber]
				  ,[AirplaneModel]
				  ,[StartDateTime]
				  ,[EndDateTime]
				  ,[StartMeter]
				  ,[EndMeter]
				  ,[VolumeM3]
				  ,[RateType]
				  ,[JetFuelAmount]
				  ,[FreightAmount]
				  ,[DiscountAmount]
				  ,[FuelingAmount]
				  ,[SubtotalAmount]
				  ,[TaxAmount]
				  ,[TotalAmount]
				  ,[Status]
				  ,[ReconciliationStatus]
				  ,[InvoiceCostVariance] 
				  ,[ErrorDescription])
				SELECT [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,[ID]					  
					  ,[AirlineCode]
					  ,[ProviderNumber]
					  ,[ServiceCode]
					  ,[FederalTaxCode]
					  ,[StationCode]
					  ,[InvoiceNumber]
					  ,[CustomerNumber]
					  ,[CustomerName]
					  ,[InvoiceDate]
					  ,[ElectronicInvoiceNumber]
					  ,[ElectronicInvoiceDate]
					  ,[ProductNumber]
					  ,[ProductDescription]
					  ,[TicketNumber]
					  ,[OperationType]
					  ,[FlightNumber]
					  ,[EquipmentNumber]
					  ,[AirplaneModel]
					  ,[StartDateTime]
					  ,[EndDateTime]
					  ,[StartMeter]
					  ,[EndMeter]
					  ,[VolumeM3]
					  ,[RateType]
					  ,[JetFuelAmount]
					  ,[FreightAmount]
					  ,[DiscountAmount]
					  ,[FuelingAmount]
					  ,[SubtotalAmount]
					  ,[TaxAmount]
					  ,[TotalAmount]
					  ,[Status]
					  ,[ReconciliationStatus]
					  ,[InvoiceCostVariance] 
					  ,''ID National Jet Fuel Invoice Detail Invalid''
				  FROM @ReconcileInfo
				 WHERE [ID] NOT IN (SELECT [ID]
									  FROM [Process].[NationalJetFuelInvoiceDetail]
									 WHERE RemittanceID = @RemittanceID
									   AND MonthYear = @MonthYear
									   AND Period = @Period)

				--Step 4.5 Log los que tengan ID de InvoiceDetail valido y este ya inconformado
				INSERT INTO [Process].[NationalJetFuelNonconformityLoadLog]
				(  [RemittanceID]
				  ,[MonthYear]
				  ,[Period]
				  ,[ID]
				  ,[AirlineCode]
				  ,[ProviderNumber]
				  ,[ServiceCode]
				  ,[FederalTaxCode]
				  ,[StationCode]
				  ,[InvoiceNumber]
				  ,[CustomerNumber]
				  ,[CustomerName]
				  ,[InvoiceDate]
				  ,[ElectronicInvoiceNumber]
				  ,[ElectronicInvoiceDate]
				  ,[ProductNumber]
				  ,[ProductDescription]
				  ,[TicketNumber]
				  ,[OperationType]
				  ,[FlightNumber]
				  ,[EquipmentNumber]
				  ,[AirplaneModel]
				  ,[StartDateTime]
				  ,[EndDateTime]
				  ,[StartMeter]
				  ,[EndMeter]
				  ,[VolumeM3]
				  ,[RateType]
				  ,[JetFuelAmount]
				  ,[FreightAmount]
				  ,[DiscountAmount]
				  ,[FuelingAmount]
				  ,[SubtotalAmount]
				  ,[TaxAmount]
				  ,[TotalAmount]
				  ,[Status]
				  ,[ReconciliationStatus]
				  ,[InvoiceCostVariance] 
				  ,[ErrorDescription])
				SELECT [RemittanceID]
					  ,[MonthYear]
					  ,[Period]
					  ,[ID]					  
					  ,[AirlineCode]
					  ,[ProviderNumber]
					  ,[ServiceCode]
					  ,[FederalTaxCode]
					  ,[StationCode]
					  ,[InvoiceNumber]
					  ,[CustomerNumber]
					  ,[CustomerName]
					  ,[InvoiceDate]
					  ,[ElectronicInvoiceNumber]
					  ,[ElectronicInvoiceDate]
					  ,[ProductNumber]
					  ,[ProductDescription]
					  ,[TicketNumber]
					  ,[OperationType]
					  ,[FlightNumber]
					  ,[EquipmentNumber]
					  ,[AirplaneModel]
					  ,[StartDateTime]
					  ,[EndDateTime]
					  ,[StartMeter]
					  ,[EndMeter]
					  ,[VolumeM3]
					  ,[RateType]
					  ,[JetFuelAmount]
					  ,[FreightAmount]
					  ,[DiscountAmount]
					  ,[FuelingAmount]
					  ,[SubtotalAmount]
					  ,[TaxAmount]
					  ,[TotalAmount]
					  ,[Status]
					  ,[ReconciliationStatus]
					  ,[InvoiceCostVariance] 
					  ,''ID National Jet Fuel Invoice Detail Valid,but Disagreed (Nonconformity Process)''
				  FROM @ReconcileInfo
				 WHERE [ID] IN (SELECT [ID]
									  FROM [Process].[NationalJetFuelInvoiceDetail]
									 WHERE RemittanceID = @RemittanceID
									   AND MonthYear = @MonthYear
									   AND Period = @Period
									   AND NonconformityFlag = 1)				


			--Step 6 Cuando ya sean registros validos se inconforman (Si no existen los ignora y si existian ya los sobreescribe)
			UPDATE [Process].[NationalJetFuelInvoiceDetail]
			   SET [NonconformityFlag] = 1
			 WHERE RemittanceID = @RemittanceID
			   AND MonthYear = @MonthYear
			   AND Period = @Period	
			   AND ID IN (SELECT ID FROM @ReconcileInfo);


			--Cuantos registros inserto y SUM de SubtotalAmount
			SET @NumberRecordsProcess =(SELECT COUNT(SubtotalAmount) 
									 FROM [Process].[NationalJetFuelInvoiceDetail]
									WHERE RemittanceID = @RemittanceID
									  AND MonthYear = @MonthYear
									  AND Period = @Period
									  AND [NonconformityFlag] = 1 );

			SET @SubtotalAmount = (SELECT SUM(CASE WHEN B.InvoiceCostVariance > 0 THEN B.InvoiceCostVariance ELSE A.SubtotalAmount END) 
									 FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
									      [Process].[NationalJetFuelReconciliationDetail] B ON (A.[ID] = B.[InvoiceDetailID])
									WHERE A.RemittanceID = @RemittanceID
									  AND A.MonthYear = @MonthYear
									  AND A.Period = @Period
									  AND [NonconformityFlag] = 1);
						
			--Step 9 Update Control ([CountNonconformityRecords] y [NonconformitySubtotalAmount])
			IF ( @NumberRecordsProcess > 0 )
			BEGIN 		
				UPDATE  [Process].[NationalJetFuelInvoiceControl]
				   SET  [CountNonconformityRecords] = ISNULL(@NumberRecordsProcess, 0),
						[NonconformitySubtotalAmount] = ISNULL(@SubtotalAmount, 0),
						[DateNonconformity] = GETDATE()--,
						--[NonconformityByUserName] = @Username
				  WHERE RemittanceID = @RemittanceID
					AND MonthYear = @MonthYear
					AND Period = @Period; 
			END; 				
		

			--STEP 14 Si hay elementos en Log de errores se informa
			IF EXISTS (SELECT [LogID]
						 FROM [Process].[NationalJetFuelNonconformityLoadLog]
						WHERE RemittanceID = @RemittanceID
						  AND MonthYear = @MonthYear
						  AND Period = @Period)
			BEGIN
				SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 98 Verify
			END

			END								
		END
	END	 	    

END TRY 

BEGIN CATCH  

	SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 99 Verify
	   
    IF @@TRANCOUNT > 0 
      BEGIN 	  
          ROLLBACK TRANSACTION 
      END 

END CATCH; 

IF @@TRANCOUNT > 0 
  
  BEGIN 
      COMMIT TRANSACTION 
  END 

END




' 
END
GO
/****** Object:  StoredProcedure [Process].[ValidateAndSaveRemittances]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[ValidateAndSaveRemittances]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Leonardo Eduardo Ramirez
-- Create date: 21/06/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Process].[ValidateAndSaveRemittances] 
	@RemittanceInfo AS [Process].[NationalJetFuelInvoiceDetailType] READONLY,
	@AirlineCode AS VARCHAR(3)
AS
BEGIN

BEGIN TRANSACTION 

BEGIN TRY 
	
    IF EXISTS (SELECT A.RemittanceID, A.MonthYear, A.Period 
				 FROM [Process].[NationalJetFuelInvoiceControl] A INNER JOIN
				       (SELECT DISTINCT REPLACE([RemittanceID], ''/'',''-'') RemittanceID, MonthYear, Period FROM @RemittanceInfo) B 
						 ON (A.RemittanceID = B.RemittanceID AND A.MonthYear = B.MonthYear AND A.Period = B.Period))
	BEGIN
		--Paso 0.- Mostrar remesas que ya existen en DB
		SELECT A.RemittanceID, A.MonthYear, A.Period,  1 Verify
	      FROM [Process].[NationalJetFuelInvoiceControl] A INNER JOIN
			   (SELECT DISTINCT REPLACE([RemittanceID], ''/'',''-'') RemittanceID, MonthYear, Period FROM @RemittanceInfo) B 
						 ON (A.RemittanceID = B.RemittanceID AND A.MonthYear = B.MonthYear AND A.Period = B.Period)			
	END
	ELSE
	BEGIN		
		--Paso 1.- Inserto en tabla de control dado que todas son remesas nuevas
		INSERT INTO [Process].[NationalJetFuelInvoiceControl]
           ([RemittanceID]
		   ,[MonthYear]
		   ,[Period]
           ,[AirlineCode]
           ,[ProviderNumber]
           ,[JetFuelAmount]
           ,[FreightAmount]
           ,[DiscountAmount]
           ,[FuelingAmount]
           ,[SubtotalAmount]
           ,[TaxAmount]
           ,[TotalAmount]
		   ,[ProcessDate])
		SELECT REPLACE([RemittanceID], ''/'',''-'')
			  ,MonthYear
			  ,Period
		      ,@AirlineCode
			  ,MIN(ProviderNumber)
			  ,SUM(JetFuelAmount)
			  ,SUM(FreightAmount)
			  ,SUM(DiscountAmount)
			  ,SUM(FuelingAmount)
			  ,SUM(SubtotalAmount)
			  ,SUM(TaxAmount)
			  ,SUM(TotalAmount)
			  ,GETDATE()
	      FROM @RemittanceInfo
	     GROUP BY RemittanceID, MonthYear, Period
		
		--Paso 2.- Inserto en tabla de detalle dado que ya se inserto antes en la tabla control donde [RemittanceID] es llave
		INSERT INTO [Process].[NationalJetFuelInvoiceDetail]
           ([RemittanceID]		
		   ,[MonthYear]
		   ,[Period]   
           ,[AirlineCode]
           ,[ProviderNumber]
           ,[ServiceCode]
           ,[FederalTaxCode]
           ,[StationCode]
           ,[InvoiceNumber]
           ,[CustomerNumber]
           ,[CustomerName]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[ProductNumber]
           ,[ProductDescription]
           ,[TicketNumber]
           ,[OperationType]
           ,[FlightNumber]
           ,[EquipmentNumber]
           ,[AirplaneModel]
           ,[StartDateTime]
           ,[EndDateTime]
           ,[StartMeter]
           ,[EndMeter]
           ,[VolumeM3]
           ,[RateType]
           ,[JetFuelAmount]
           ,[FreightAmount]
           ,[DiscountAmount]
           ,[FuelingAmount]
           ,[SubtotalAmount]
           ,[TaxAmount]
           ,[TotalAmount])
		SELECT REPLACE([RemittanceID], ''/'',''-'')
		   ,[MonthYear]
		   ,[Period]
           ,@AirlineCode
           ,[ProviderNumber]
           ,[ServiceCode]
           ,[FederalTaxCode]
           ,[StationCode]
           ,[InvoiceNumber]
           ,[CustomerNumber]
           ,[CustomerName]
           ,[InvoiceDate]
           ,[ElectronicInvoiceNumber]
           ,[ElectronicInvoiceDate]
           ,[ProductNumber]
           ,[ProductDescription]
           ,[TicketNumber]
           ,[OperationType]
           ,[FlightNumber]
           ,[EquipmentNumber]
           ,[AirplaneModel]
           ,[StartDateTime]
           ,[EndDateTime]
           ,[StartMeter]
           ,[EndMeter]
           ,[VolumeM3]
           ,[RateType]
           ,[JetFuelAmount]
           ,[FreightAmount]
           ,[DiscountAmount]
           ,[FuelingAmount]
           ,[SubtotalAmount]
           ,[TaxAmount]
           ,[TotalAmount]
		FROM @RemittanceInfo

		--Paso 3.- Detectar errores por registro
		UPDATE [Process].[NationalJetFuelInvoiceDetail] 
		   SET [ErrorDescription] = 
		       CASE WHEN NOT EXISTS(SELECT [ProviderNumber] 
	                          FROM [Finance].[Provider] 
							 WHERE [ProviderNumber] = A.[ProviderNumber]
							   AND [Status] = 1) 
					THEN ''* No. Proveedor no valido: ['' + [ProviderNumber] + ''], '' 
					ELSE '''' END + 
			   CASE WHEN NOT EXISTS(SELECT [ServiceCode] 
									  FROM [Airport].[Service] 
									 WHERE [ServiceCode] = A.[ServiceCode]
									   AND [Status] = 1
									   AND A.[ServiceCode] = ''CM'') 
					THEN ''* Código de servicio no valido: ['' + [ServiceCode] + ''], '' 
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [TaxCode] 
									  FROM [Finance].[Tax] 
									 WHERE [TaxCode] = A.[FederalTaxCode]
									   AND [Status] = 1) 
					THEN ''* Código del impuesto no valido: ['' + [FederalTaxCode] + ''], '' 
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [ProviderNumberPrimary] 
									  FROM [Finance].[NationalFuelContract] 
									 WHERE [ProviderNumberPrimary] = A.[ProviderNumber]
									   AND [StationCode] = A.[StationCode]
									   AND [Status] = 1
									   AND [FederalTaxCode] = A.[FederalTaxCode]) 
					THEN ''* El Impuesto aplicado: ['' + [FederalTaxCode] + ''] no corresponde al que se tiene en SISAC en Contratos Nacionales del aeropuerto: ['' + [StationCode] + ''] y proveedor ['' + [ProviderNumber] + ''], ''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [StationCode]
									  FROM [Airport].[Airport]
									 WHERE [StationCode] = A.[StationCode]
									   AND [Status] = 1) 
					THEN ''* Aeropuerto no valido: ['' + [StationCode] + ''], ''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [Sequence]
									  FROM [Itinerary].[Itinerary]
									 WHERE [FlightNumber] = A.[FlightNumber]
									   AND [EquipmentNumber] = A.[EquipmentNumber]) 
					THEN ''* No hay vuelos que coincidan con Numero de Vuelo: ['' + [FlightNumber] +  ''] y Matricula: [''+ [EquipmentNumber] +''], ''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [EquipmentNumber]
									  FROM [Airport].[Airplane]
									 WHERE [EquipmentNumber] = A.[EquipmentNumber]
									   AND [Status] = 1) 
					THEN ''* Matricula no valido: ['' + [EquipmentNumber] + ''], ''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [EquipmentNumber]
									  FROM [Airport].[Airplane]
									 WHERE [EquipmentNumber] = A.[EquipmentNumber]
									   AND [AirplaneModel] = A.[AirplaneModel]
									   AND [Status] = 1) 
					THEN ''* Modelo de avión no valido: ['' + [AirplaneModel] + ''] con Matricula: ['' + [EquipmentNumber] + ''], ''
					ELSE '''' END +
			   CASE WHEN EXISTS(SELECT [AirplaneModel]
								  FROM [Airport].[AirplaneType]
								 WHERE [AirplaneModel] = A.[AirplaneModel]
								   AND [FuelInLiters] < (A.[VolumeM3] * 1000)
								   AND [Status] = 1) 
					THEN ''* Los litros Cargados sobre pasa el máximo en litros del tipo de equipo: ['' + CAST(([VolumeM3] * 1000) AS VARCHAR) + '' > '' + CAST((SELECT TOP 1 [FuelInLiters] FROM [Airport].[AirplaneType] WHERE [AirplaneModel] = A.[AirplaneModel] AND [Status] = 1) AS VARCHAR) + ''], '' 
					ELSE '''' END +
			   CASE WHEN [StartDateTime] > [EndDateTime]
					THEN ''* La fecha final es menor que la fecha inicial, ''
					ELSE '''' END +
			   CASE WHEN [SubtotalAmount] + [TaxAmount] <> [TotalAmount]
					THEN ''* El calculo total (TotalAmount) no conincide con el total del archivo (SubtotalAmount + TaxAmount)'' 
					ELSE '''' END,
			   [Status] =
			   CASE WHEN NOT EXISTS(SELECT [ProviderNumber] 
	                          FROM [Finance].[Provider] 
							 WHERE [ProviderNumber] = A.[ProviderNumber]
							   AND [Status] = 1) 
					THEN ''A'' 
					ELSE '''' END + 
			   CASE WHEN NOT EXISTS(SELECT [ServiceCode] 
									  FROM [Airport].[Service] 
									 WHERE [ServiceCode] = A.[ServiceCode]
									   AND [Status] = 1
									   AND A.[ServiceCode] = ''CM'') 
					THEN ''B'' 
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [TaxCode] 
									  FROM [Finance].[Tax] 
									 WHERE [TaxCode] = A.[FederalTaxCode]
									   AND [Status] = 1) 
					THEN ''C'' 
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [ProviderNumberPrimary] 
									  FROM [Finance].[NationalFuelContract] 
									 WHERE [ProviderNumberPrimary] = A.[ProviderNumber]
									   AND [StationCode] = A.[StationCode]
									   AND [Status] = 1
									   AND [FederalTaxCode] = A.[FederalTaxCode]) 
					THEN ''D''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [StationCode]
									  FROM [Airport].[Airport]
									 WHERE [StationCode] = A.[StationCode]
									   AND [Status] = 1) 
					THEN ''E''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [Sequence]
									  FROM [Itinerary].[Itinerary]
									 WHERE [FlightNumber] = A.[FlightNumber]
									   AND [EquipmentNumber] = A.[EquipmentNumber]) 
					THEN ''F''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [EquipmentNumber]
									  FROM [Airport].[Airplane]
									 WHERE [EquipmentNumber] = A.[EquipmentNumber]
									   AND [Status] = 1) 
					THEN ''MNV''
					ELSE '''' END +
			   CASE WHEN NOT EXISTS(SELECT [EquipmentNumber]
									  FROM [Airport].[Airplane]
									 WHERE [EquipmentNumber] = A.[EquipmentNumber]
									   AND [AirplaneModel] = A.[AirplaneModel]
									   AND [Status] = 1) 
					THEN ''G''
					ELSE '''' END +
			   CASE WHEN EXISTS(SELECT [AirplaneModel]
								  FROM [Airport].[AirplaneType]
								 WHERE [AirplaneModel] = A.[AirplaneModel]
								   AND [FuelInLiters] < (A.[VolumeM3] * 1000)
								   AND [Status] = 1) 
					THEN ''H'' 
					ELSE '''' END +
			   CASE WHEN [StartDateTime] > [EndDateTime]
					THEN ''I''
					ELSE '''' END +
			   CASE WHEN [SubtotalAmount] + [TaxAmount] <> [TotalAmount]
					THEN ''J'' 
					ELSE '''' END			  
		  FROM [Process].[NationalJetFuelInvoiceDetail] A
		 WHERE [RemittanceID] IN (SELECT DISTINCT REPLACE([RemittanceID], ''/'',''-'') FROM @RemittanceInfo)

		--Paso 4.- Etiquetar registro como exitoso o error
		UPDATE [Process].[NationalJetFuelInvoiceDetail] 
		   SET [Status] = CASE WHEN LEN(ISNULL([ErrorDescription],'''')) > 2 THEN ''ERRO'' ELSE ''SUCC'' END 
		 WHERE [RemittanceID] IN (SELECT DISTINCT REPLACE([RemittanceID], ''/'',''-'') FROM @RemittanceInfo)
		   AND [Status] <> ''MNV''		--Para dejar con MNV los cuando solo existio error de matricula no valida

		--Paso 5.- Etiquetar registro como exitoso o error en tabla de control
		UPDATE [Process].[NationalJetFuelInvoiceControl]
	       SET [RemittanceStatusCode] = CASE WHEN EXISTS (SELECT [RemittanceID] FROM [Process].[NationalJetFuelInvoiceDetail] WHERE [RemittanceID] = A.[RemittanceID] AND [Status] IN (''ERRO'',''MNV'')) THEN ''ERRO'' ELSE ''SUCC'' END,
		       [ReconciliationStatusCode] = ''NEW'',
			   [DocumentStatusCode] = ''PEND''
		  FROM [Process].[NationalJetFuelInvoiceControl] A
	     WHERE [RemittanceID] IN (SELECT DISTINCT REPLACE([RemittanceID], ''/'',''-'') FROM @RemittanceInfo) 		

	END

END TRY 

BEGIN CATCH  

	SELECT '''' RemittanceID,'''' MonthYear,'''' Period, 99 Verify
	   
    IF @@TRANCOUNT > 0 
      BEGIN 	  
          ROLLBACK TRANSACTION 
      END 

END CATCH; 

IF @@TRANCOUNT > 0 
  
  BEGIN 
      COMMIT TRANSACTION 
  END 

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[VerifyNationalJetFuelInvoicePolicy]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[VerifyNationalJetFuelInvoicePolicy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160701
-- Description:	Verificar que poliza no existe o es viable armarla
-- [Process].[VerifyNationalJetFuelInvoicePolicy] ''16-2830''
-- ===============================================================
CREATE PROCEDURE [Process].[VerifyNationalJetFuelInvoicePolicy]    
     @RemittanceID AS VARCHAR(8),
	 @MonthYear VARCHAR(4),
	 @Period VARCHAR(5)
AS
BEGIN
	SET NOCOUNT ON;


	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoicePolicy] WITH (NOLOCK) 
	            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period)
	BEGIN
		SELECT 1 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoicePolicy] de esta remesa
	END
	ELSE
	BEGIN

		IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
		            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period 
				  AND Status = ''ERRO'')
		BEGIN
			SELECT 2 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
		END
		ELSE 
		BEGIN		
			SELECT 0 [Verify] --En caso EXITOSO para mandar a llamar a [Process].[SaveNationalJetFuelInvoicePolicy]
		END

	END
	
END
' 
END
GO
/****** Object:  StoredProcedure [Process].[VerifyNationalJetFuelReconciliation]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[VerifyNationalJetFuelReconciliation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160826
-- Description:	Verificar que sea viable proceso de conciliación
-- [Process].[VerifyNationalJetFuelReconciliation]  ''16-2830''
-- ===============================================================
CREATE PROCEDURE [Process].[VerifyNationalJetFuelReconciliation]    
     @RemittanceID AS VARCHAR(8),
	 @MonthYear VARCHAR(4),
	 @Period VARCHAR(5)
AS
BEGIN
	SET NOCOUNT ON;


	IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceControl] WITH (NOLOCK) 
	            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period
				  AND ConfirmationStatusCode = ''CLO'')
	BEGIN
		SELECT 1 [Verify] --No es vible debido a que la Remesa se encuentra cerrrada para conciliación
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT RemittanceID FROM	[Process].[NationalJetFuelInvoiceDetail] WITH (NOLOCK) 
		            WHERE RemittanceID = @RemittanceID
				  AND MonthYear = @MonthYear
				  AND Period = @Period 
				  AND [Status] = ''ERRO'')
		BEGIN
			SELECT 2 [Verify] --No es vible debido a que ya existen registros en [Process].[NationalJetFuelInvoiceDetail] de esta remesa hay al menos un registro con error que no es de tipo MNV (Matricula no valida)
		END
		ELSE 
		BEGIN		
			SELECT 0 [Verify] --En caso EXITOSO continua proceso
		END

	END
	
END
' 
END
GO
/****** Object:  StoredProcedure [Process].[VerifyNationalPolicyCurrency]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[VerifyNationalPolicyCurrency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160530
-- Description:	Polizas Save
-- [Process].[VerifyNationalPolicyCurrency] ''20160501'', ''20160531'', ''20160401'', ''20160430'', ''ok'', ''okasssss'', ''20160101'', ''20160101'', ''20160101'', ''Y4'', ''4000000'', ''CM'', ''MEX'', ''usuario''
-- ===============================================================
CREATE PROCEDURE [Process].[VerifyNationalPolicyCurrency]      
     @StartDateReal AS DATETIME  
    ,@EndDateReal AS DATETIME 
	,@StartDateComp AS DATETIME  
    ,@EndDateComp AS DATETIME   
	,@HeaderText AS VARCHAR(50)
	,@ItemText   AS VARCHAR(50) 
	,@DateValue AS DATETIME  
	,@DatePosting AS DATETIME
	,@DateBase AS DATETIME
	,@AirlineCode AS VARCHAR(3) 
	,@ProviderCodes AS VARCHAR(MAX) 
	,@ServiceCodes AS VARCHAR(MAX) 
	,@StationCodes AS VARCHAR(MAX) --Opcion XML
	,@UserSend AS NVARCHAR(50) = '' ''
AS  
BEGIN  
SET NOCOUNT ON; 

SELECT DISTINCT A.[CurrencyCode], CASE WHEN C.[Rate] IS NOT NULL THEN 1 ELSE 0 END Verify
  FROM [Process].[NationalJetFuelCost] A LEFT JOIN
       [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey) LEFT JOIN
	   [Finance].[ExchangeRates] C  ON (C.[CurrencyCode] = A.CurrencyCode AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1)
 WHERE ((([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) OR ([DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''))
   AND A.[AirlineCode] = @AirlineCode
   AND A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
   AND A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
   AND B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))	

END

' 
END
GO
/****** Object:  StoredProcedure [Process].[VerifyPolizaProvisionesInt]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[VerifyPolizaProvisionesInt]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===============================================================
-- Author: Leonardo Eduardo Ramirez		
-- Create date: 20160420
-- Description:	Polizas Save
-- [Process].[VerifyPolizaProvisionesInt] ''20160401'', ''20160422'', ''20160414'', ''20160422'', ''ok'', ''okasssss'', ''20160101'', ''20160101'', ''20160101'', ''Y4'', ''2400003,0000001,4000'', ''COD-EXT'', ''BOS,ATL,LA,DEN,LAX'', ''usuario''
-- ===============================================================
CREATE PROCEDURE [Process].[VerifyPolizaProvisionesInt]      
     @StartDateReal AS DATETIME  
    ,@EndDateReal AS DATETIME 
	,@StartDateComp AS DATETIME  
    ,@EndDateComp AS DATETIME   
	,@HeaderText AS VARCHAR(50)
	,@ItemText   AS VARCHAR(50) 
	,@DateValue AS DATETIME  
	,@DatePosting AS DATETIME
	,@DateBase AS DATETIME
	,@AirlineCode AS VARCHAR(3) 
	,@ProviderCodes AS VARCHAR(MAX) 
	,@ServiceCodes AS VARCHAR(MAX) 
	,@StationCodes AS VARCHAR(MAX) --Opcion XML
	,@UserSend AS NVARCHAR(50) = '' ''
AS  
BEGIN  
SET NOCOUNT ON; 

SELECT DISTINCT A.[CurrencyCode], CASE WHEN C.[Rate] IS NOT NULL THEN 1 ELSE 0 END Verify
  FROM [Process].[JetFuelProvision] A LEFT JOIN
       [Itinerary].[Itinerary] B ON (A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND  A.ItineraryKey = B.ItineraryKey) LEFT JOIN
	   [Finance].[ExchangeRates] C  ON (C.[CurrencyCode] = A.CurrencyCode AND [Year] = YEAR(@EndDateReal) AND [Month] = MONTH(@EndDateReal) AND [Status] = 1)
 WHERE ((([DepartureDate] BETWEEN @StartDateReal AND @EndDateReal + '' 23:59:59'') AND  A.PolicyID IS NULL) OR ([DepartureDate] BETWEEN @StartDateComp AND @EndDateComp + '' 23:59:59''))
   AND A.[AirlineCode] = @AirlineCode
   AND A.ProviderNumberPrimary IN (select splitdata from dbo.fnSplitString(@ProviderCodes,'',''))
   AND A.ServiceCode IN (select splitdata from dbo.fnSplitString(@ServiceCodes,'',''))
   AND B.DepartureStation IN (select splitdata from dbo.fnSplitString(@StationCodes,'',''))	

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitString]    Script Date: 13/01/2017 01:39:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnSplitString] 
( 
    @string VARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(splitdata VARCHAR(100) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (splitdata)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 
    RETURN 
END' 
END

GO
