USE [SISAC]
GO
/****** Object:  StoredProcedure [Process].[UploadManualReconcile]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[UploadManualReconcile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[UploadManualReconcile]
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationTotal]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationTotal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[JetFuelReconciliationTotal]
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationRevert]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationRevert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[JetFuelReconciliationRevert]
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationPending]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationPending]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[JetFuelReconciliationPending]
GO
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationManualRevert]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[JetFuelReconciliationManualRevert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[JetFuelReconciliationManualRevert]
GO
/****** Object:  StoredProcedure [Process].[DownloadNonReconciledCostGroup]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DownloadNonReconciledCostGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[DownloadNonReconciledCostGroup]
GO
/****** Object:  StoredProcedure [Process].[DeleteNationalInvoice]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Process].[DeleteNationalInvoice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Process].[DeleteNationalInvoice]
GO
/****** Object:  UserDefinedTableType [Process].[NationalJetFuelManualReconcileType]    Script Date: 14/10/2016 12:22:17 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NationalJetFuelManualReconcileType' AND ss.name = N'Process')
DROP TYPE [Process].[NationalJetFuelManualReconcileType]
GO
/****** Object:  UserDefinedTableType [Process].[NationalJetFuelManualReconcileType]    Script Date: 14/10/2016 12:22:17 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[DeleteNationalInvoice]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[DownloadNonReconciledCostGroup]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationManualRevert]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationPending]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationRevert]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[JetFuelReconciliationTotal]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
/****** Object:  StoredProcedure [Process].[UploadManualReconcile]    Script Date: 14/10/2016 12:22:21 p.m. ******/
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
