USE [SISAC_DEV]
GO
/****** Object:  View [Airport].[VW_JetFuelTicket]    Script Date: 13/01/2017 01:36:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Airport].[VW_JetFuelTicket]'))
EXEC dbo.sp_executesql @statement = N'/*WHERE [JetFuelTicketID] = 5*/
CREATE VIEW [Airport].[VW_JetFuelTicket]
AS
SELECT        A.JetFuelTicketID, A.Sequence, A.AirlineCode, A.FlightNumber, A.ItineraryKey, B.DepartureDate, CONVERT(TIME, B.DepartureDate) AS DepartureTime, 
                         B.DepartureStation, B.ArrivalStation, C.AirplaneModel, B.EquipmentNumber, A.OperationTypeName, A.ServiceCode + ''   '' + D.ServiceName AS Service, A.FuelingDate,
                          E.ProviderName AS JetFuelProvider, F.ProviderName AS IntoPlaneProvider, A.TicketNumber, A.FueledQtyGals, A.RemainingQry, A.RequestedQry, A.FueledQry, 
                         A.DensityFactor, A.AorUserID, G.Name + '' '' + G.FirstName + '' '' + ISNULL(G.LastName, '''') AS AOR_Name, A.SupplierResponsible, A.Remarks
FROM            Airport.JetFuelTicket AS A LEFT OUTER JOIN
                         Itinerary.Itinerary AS B ON A.Sequence = B.Sequence AND A.AirlineCode = B.AirlineCode AND A.FlightNumber = B.FlightNumber AND 
                         A.ItineraryKey = B.ItineraryKey LEFT OUTER JOIN
                         Airport.Airplane AS C ON B.EquipmentNumber = C.EquipmentNumber LEFT OUTER JOIN
                         Airport.Service AS D ON A.ServiceCode = D.ServiceCode LEFT OUTER JOIN
                         Finance.Provider AS E ON A.JetFuelProviderNumber = E.ProviderNumber LEFT OUTER JOIN
                         Finance.Provider AS F ON A.IntoPlaneProviderNumber = F.ProviderNumber LEFT OUTER JOIN
                         Security.[User] AS G ON A.AorUserID = G.UserID
' 
GO
/****** Object:  View [Airport].[VW_NationalJetFuelTicket]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Airport].[VW_NationalJetFuelTicket]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [Airport].[VW_NationalJetFuelTicket]
AS
    SELECT  A.NationalJetFuelTicketID ,
            A.Sequence ,
            A.AirlineCode ,
            A.FlightNumber ,
            A.ItineraryKey ,
            B.DepartureDate ,
            CONVERT(TIME, B.DepartureDate) AS DepartureTime ,
            B.DepartureStation ,
            B.ArrivalStation ,
            C.AirplaneModel ,
            B.EquipmentNumber ,
            A.OperationTypeName ,
            A.ServiceCode + ''   '' + D.ServiceName AS Service ,
            A.FuelingDateStart ,
            E.ProviderName AS JetFuelProvider ,
            F.ProviderName AS IntoPlaneProvider ,
            A.TicketNumber ,
            A.FueledQtyLts ,
            A.RemainingQtyKgs ,
            A.RequestedQtyKgs ,
            A.FueledQtyKgs ,
            A.DensityFactor ,
            A.AorUserID ,
            G.Name + '' '' + G.FirstName + '' '' + ISNULL(G.LastName, '''') AS AOR_Name ,
            A.SupplierResponsible ,
            A.Remarks ,
            A.ApronPosition
    FROM    Airport.NationalJetFuelTicket AS A
            LEFT OUTER JOIN Itinerary.Itinerary AS B ON A.Sequence = B.Sequence
                                                        AND A.AirlineCode = B.AirlineCode
                                                        AND A.FlightNumber = B.FlightNumber
                                                        AND A.ItineraryKey = B.ItineraryKey
            LEFT OUTER JOIN Airport.Airplane AS C ON B.EquipmentNumber = C.EquipmentNumber
            LEFT OUTER JOIN Airport.Service AS D ON A.ServiceCode = D.ServiceCode
            LEFT OUTER JOIN Finance.Provider AS E ON A.JetFuelProviderNumber = E.ProviderNumber
            LEFT OUTER JOIN Finance.Provider AS F ON A.IntoPlaneProviderNumber = F.ProviderNumber
            LEFT OUTER JOIN Security.[User] AS G ON A.AorUserID = G.UserID;
						 
' 
GO
/****** Object:  View [Itinerary].[VW_ItineraryOrder]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Itinerary].[VW_ItineraryOrder]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [Itinerary].[VW_ItineraryOrder]
AS
SELECT [Sequence],
          [AirlineCode],
          [FlightNumber],
          [ItineraryKey],
          [EquipmentNumber],
          [DepartureDate],
          [DepartureStation],
          [ArrivalDate],
          [ArrivalStation],
          ROW_NUMBER() OVER (PARTITION BY [AirlineCode], [EquipmentNumber]
                             ORDER BY [AirlineCode], [EquipmentNumber], [DepartureDate]) NUM
   FROM [Itinerary].[Itinerary]' 
GO
/****** Object:  View [Itinerary].[VW_TimelineOrder]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Itinerary].[VW_TimelineOrder]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [Itinerary].[VW_TimelineOrder]
AS
SELECT        ROW_NUMBER() OVER (PARTITION BY Itinerary.[AirlineCode], Itinerary.[EquipmentNumber] ORDER BY Itinerary.[AirlineCode], Itinerary.[EquipmentNumber], Itinerary.[DepartureDate]) AS Row,
 Itinerary.Itinerary.Sequence, Itinerary.Itinerary.AirlineCode, Itinerary.Itinerary.FlightNumber, Itinerary.Itinerary.ItineraryKey, Itinerary.Itinerary.EquipmentNumber, 
                         Itinerary.Itinerary.DepartureDate, Itinerary.Itinerary.DepartureStation, Itinerary.Itinerary.ArrivalDate, Itinerary.Itinerary.ArrivalStation, Itinerary.Timeline.PreviousSequence, Itinerary.Timeline.PreviousAirlineCode, 
                         Itinerary.Timeline.PreviousFlightNumber, Itinerary.Timeline.PreviousItineraryKey, Itinerary.Timeline.NextSequence, Itinerary.Timeline.NextAirlineCode, Itinerary.Timeline.NextFlightNumber, 
                         Itinerary.Timeline.NextItineraryKey, Itinerary.Timeline.SpecialCase
FROM            Itinerary.Timeline INNER JOIN
                         Itinerary.Itinerary ON Itinerary.Timeline.Sequence = Itinerary.Itinerary.Sequence AND Itinerary.Timeline.AirlineCode = Itinerary.Itinerary.AirlineCode AND 
                         Itinerary.Timeline.FlightNumber = Itinerary.Itinerary.FlightNumber AND Itinerary.Timeline.ItineraryKey = Itinerary.Itinerary.ItineraryKey
' 
GO
/****** Object:  View [Process].[VW_JetFuelProcess]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Process].[VW_JetFuelProcess]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [Process].[VW_JetFuelProcess] AS
SELECT A.[Sequence]
      ,A.[AirlineCode]
      ,A.[FlightNumber]
      ,A.[ItineraryKey]
	  ,ROW_NUMBER() OVER(PARTITION BY A.[Sequence], 
	                                  A.[AirlineCode], 
									  A.[FlightNumber], 
									  A.[ItineraryKey] ORDER BY A.[Sequence], 
									                            A.[AirlineCode], 
																A.[FlightNumber], 
																A.[ItineraryKey]) AS TicketsNum
      ,A.[EquipmentNumber]	,[DepartureDate]      --,[DepartureStation]      --,[ArrivalDate]      --,[ArrivalStation]
	  ,B.OperationTypeName
	  ,B.JetFuelTicketID
	  ,B.FuelingDate
	  ,B.FuelingTime
	  ,''APRON'' Apron
	  ,B.TicketNumber
	  ,B.FueledQtyGals
	  ,B.RemainingQry
	  ,B.RequestedQry
	  ,B.FueledQry
	  ,B.DensityFactor
	  ,C.ServiceCode
	  ,C.ProviderNumberPrimary
	  ,C.OperationTypeID
	  ,C.CurrencyCode
	  ,ISNULL(C.CCNumber, A.EquipmentNumber) CCNumber
	  ,C.AccountingAccountNumber
	  ,C.LiabilityAccountNumber
	  ,C.Status
	  ,ROW_NUMBER() OVER(PARTITION BY B.JetFuelTicketID,
									  C.EffectiveDate,
									  C.AirlineCode,
									  C.StationCode,
									  C.ServiceCode,
									  C.ProviderNumberPrimary ORDER BY B.JetFuelTicketID,
									                                   C.EffectiveDate,
																	   C.AirlineCode,
																	   C.StationCode,
																	   C.ServiceCode,
																	   C.ProviderNumberPrimary) AS ConceptsNum
	  ,D.InternationalFuelContractConceptID
	  ,D.FuelConceptID
	  ,D.FuelConceptTypeCode
	  ,D.ChargeFactorTypeID
	  ,D.ProviderNumber
	  ,E.InternationalFuelRateID
	  ,E.Rate
  FROM [Itinerary].[Itinerary] A LEFT JOIN
       [Airport].[JetFuelTicket] B ON (A.Sequence = B.Sequence 
	                                             AND A.AirlineCode = B.AirlineCode
												 AND A.FlightNumber = B.FlightNumber
												 AND A.ItineraryKey = B.ItineraryKey) LEFT JOIN
       [Finance].[InternationalFuelContract] C ON (A.AirlineCode = C.AirlineCode
		                                                     AND A.DepartureStation = C.StationCode
													         AND C.ServiceCode = ''COD-EXT''
													         AND B.JetFuelProviderNumber = C.ProviderNumberPrimary
															 AND C.EffectiveDate = ((SELECT MAX(EffectiveDate) FROM [Finance].[InternationalFuelContract] 
																					  WHERE EffectiveDate <= A.DepartureDate
																					    AND AirlineCode = A.AirlineCode
																					    AND StationCode = A.DepartureStation
																					    AND ServiceCode = ''COD-EXT''
																					    AND ProviderNumberPrimary = B.JetFuelProviderNumber))) LEFT JOIN
	   [Finance].[InternationalFuelContractConcept] D ON (C.EffectiveDate = D.EffectiveDate
																	 AND C.AirlineCode = D.AirlineCode
																	 AND C.StationCode = D.StationCode
																	 AND C.ServiceCode = D.ServiceCode
																	 AND C.ProviderNumberPrimary = D.ProviderNumberPrimary
																	 AND ((B.JetFuelProviderNumber = D.ProviderNumber AND D.FuelConceptTypeCode = ''JTFL'')
																	   OR (B.IntoPlaneProviderNumber = D.ProviderNumber AND D.FuelConceptTypeCode = ''INTPL'')
																	   OR (D.FuelConceptTypeCode != ''JTFL'' AND D.FuelConceptTypeCode != ''INTPL''))
																	   ) LEFT JOIN
	   [Finance].[InternationalFuelRate] E ON (D.InternationalFuelContractConceptID = E.InternationalFuelContractConceptID
	                                                     AND A.DepartureDate BETWEEN E.RateStartDate AND E.RateEndDate + '' 23:59:59'')
 WHERE A.DepartureStation IN (SELECT [StationCode]
							  FROM [Airport].[Airport]
							 WHERE CountryCode != ''MEX'')
' 
GO
/****** Object:  View [Process].[VW_NationalJetFuelProcess]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Process].[VW_NationalJetFuelProcess]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [Process].[VW_NationalJetFuelProcess]
AS
    SELECT  A.[Sequence] ,
            A.[AirlineCode] ,
            A.[FlightNumber] ,
            A.[ItineraryKey] ,
            ROW_NUMBER() OVER ( PARTITION BY A.[Sequence], A.[AirlineCode],
                                A.[FlightNumber], A.[ItineraryKey] ORDER BY A.[Sequence], A.[AirlineCode], A.[FlightNumber], A.[ItineraryKey] ) AS TicketsNum ,
            A.[EquipmentNumber] ,
            A.[DepartureDate] ,
            B.OperationTypeName ,
            B.NationalJetFuelTicketID ,
            B.FuelingDateStart ,
            B.FuelingTimeStart ,
            B.FuelingDateEnd ,
            B.FuelingTimeEnd ,
            B.ApronPosition ,
            B.TicketNumber ,
            B.FueledQtyLts ,
            B.RemainingQtyKgs ,
            B.RequestedQtyKgs ,
            B.FueledQtyKgs ,
            B.DensityFactor ,
            C.ServiceCode ,
            C.ProviderNumberPrimary ,
            C.OperationTypeID ,
            C.CurrencyCode ,
            ISNULL(C.CCNumber, A.EquipmentNumber) CCNumber ,
            C.AccountingAccountNumber ,
            C.LiabilityAccountNumber ,
            C.Status ,
            ROW_NUMBER() OVER ( PARTITION BY B.NationalJetFuelTicketID,
                                C.EffectiveDate, C.AirlineCode, C.StationCode,
                                C.ServiceCode, C.ProviderNumberPrimary ORDER BY B.NationalJetFuelTicketID, C.EffectiveDate, C.AirlineCode, C.StationCode, C.ServiceCode, C.ProviderNumberPrimary ) AS ConceptsNum ,
            C.FederalTaxCode ,
            C.FederalTaxValue ,
            D.NationalFuelContractConceptID ,
            D.FuelConceptID ,
            D.FuelConceptTypeCode ,
            D.ChargeFactorTypeID ,
            D.ProviderNumber ,
            E.NationalRateID ,
            E.ScheduleTypeCode ,
            E.RateValue
    FROM    [Itinerary].[Itinerary] A
            LEFT JOIN [Airport].[NationalJetFuelTicket] B ON ( A.Sequence = B.Sequence
                                                              AND A.AirlineCode = B.AirlineCode
                                                              AND A.FlightNumber = B.FlightNumber
                                                              AND A.ItineraryKey = B.ItineraryKey
                                                             )
            LEFT JOIN [Finance].[NationalFuelContract] C ON ( A.AirlineCode = C.AirlineCode
                                                              AND A.DepartureStation = C.StationCode
                                                              AND C.ServiceCode = ''CM''
                                                              AND B.JetFuelProviderNumber = C.ProviderNumberPrimary
                                                              AND C.EffectiveDate = ( (SELECT
                                                              MAX(EffectiveDate)
                                                              FROM
                                                              [Finance].[NationalFuelContract]
                                                              WHERE
                                                              EffectiveDate <= A.DepartureDate
                                                              AND AirlineCode = A.AirlineCode
                                                              AND StationCode = A.DepartureStation
                                                              AND ServiceCode = ''CM''
                                                              AND ProviderNumberPrimary = B.JetFuelProviderNumber)
                                                              )
                                                            )
            LEFT JOIN [Finance].[NationalFuelContractConcept] D ON ( C.EffectiveDate = D.EffectiveDate
                                                              AND C.AirlineCode = D.AirlineCode
                                                              AND C.StationCode = D.StationCode
                                                              AND C.ServiceCode = D.ServiceCode
                                                              AND C.ProviderNumberPrimary = D.ProviderNumberPrimary
                                                              AND ( ( B.JetFuelProviderNumber = D.ProviderNumber
                                                              AND D.FuelConceptTypeCode = ''PMX''
                                                              )
                                                              OR ( B.IntoPlaneProviderNumber = D.ProviderNumber
                                                              AND D.FuelConceptTypeCode = ''SUMIN''
                                                              )
                                                              OR ( D.FuelConceptTypeCode != ''PMX''
                                                              AND D.FuelConceptTypeCode != ''SUMIN''
                                                              )
                                                              )
                                                              )
            LEFT JOIN [Finance].[NationalFuelRate] E ON ( A.DepartureStation = E.StationCode
                                                          AND C.ServiceCode = E.ServiceCode
                                                          AND C.ProviderNumberPrimary = E.ProviderNumber
                                                          AND D.FuelConceptTypeCode = E.FuelConceptTypeCode
                                                          AND E.ScheduleTypeCode = ( SELECT TOP 1
                                                              [ScheduleTypeCode]
                                                              FROM
                                                              [Airport].[AirportSchedule]
                                                              WHERE
                                                              StationCode = A.DepartureStation
                                                              AND B.[FuelingTimeStart] BETWEEN StartTimeSchedule
                                                              AND
                                                              EndTimeSchedule
                                                              )
                                                          AND CAST(B.[FuelingDateStart] AS DATE) BETWEEN E.EffectiveStartDate
                                                              AND
                                                              E.EffectiveEndDate
                                                        )
    WHERE   A.DepartureStation IN ( SELECT  [StationCode]
                                    FROM    [Airport].[Airport]
                                    WHERE   CountryCode = ''MEX'' ); 

' 
GO
/****** Object:  View [Process].[VW_NationalJetFuelReconciliationFirst]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Process].[VW_NationalJetFuelReconciliationFirst]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [Process].[VW_NationalJetFuelReconciliationFirst] AS
SELECT A.[ID]
      ,A.[RemittanceID]
      ,A.[MonthYear]
      ,A.[Period]
      ,A.[AirlineCode]
      ,A.[StationCode]
	  ,A.[EndDateTime]
      ,A.[InvoiceNumber]
      ,A.[InvoiceDate]
      ,A.[ElectronicInvoiceNumber]
      ,A.[ElectronicInvoiceDate]
      ,A.[TicketNumber]
      ,A.[FlightNumber]
      ,A.[EquipmentNumber]
      ,A.[VolumeM3]
      ,A.[SubtotalAmount]
	  ,B.[PeriodCode]
      ,B.[AirlineCode] CostAirlineCode
      ,B.[FlightNumber] CostFlightNumber
      ,B.[TicketNumber] CostTicketNumber
      ,B.[EquipmentNumber] CostEquipmentNumber
	  ,B.[DepartureDate]
	  ,B.[DepartureStation]
	  ,B.[ArrivalDate]
	  ,B.[ArrivalStation]
      ,B.[FueledQtyLts]
      ,B.[ConceptAmount]
	  ,ABS(B.ConceptAmount - A.SubtotalAmount) [Variance]
	  ,CASE WHEN ABS(B.ConceptAmount - A.SubtotalAmount) <= ISNULL((SELECT TOP 1 [ToleranceValue] 
																	  FROM [Catalog].[ReconciliationTolerance]
																	 WHERE [ServiceCode] = ''CM''
																	   AND [CurrencyCode] = ''MXN''
																	   AND [ToleranceTypeCode] = ''MONEY''
																	   AND [Status] = 1), 0) 
	        THEN ''OK'' 
			ELSE ''DIFF'' END [Status]
  FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
(
SELECT A.[PeriodCode]
      ,A.[AirlineCode]
      ,A.[FlightNumber]
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
      ,A.[AirlineCode]
      ,A.[FlightNumber]
      ,A.[TicketNumber]
      ,A.[EquipmentNumber]	  
	  ,B.[DepartureDate]
	  ,B.[DepartureStation]
	  ,B.[ArrivalDate]
	  ,B.[ArrivalStation]
	  ) B ON (A.[AirlineCode] = B.[AirlineCode]
	      AND A.TicketNumber = B.TicketNumber
	      AND A.StationCode = B.DepartureStation
		  AND CONVERT(VARCHAR, A.[EndDateTime], 112) = CONVERT(VARCHAR, B.[DepartureDate], 112)
		 )
WHERE ConceptAmount IS NOT NULL







' 
GO
/****** Object:  View [Process].[VW_NationalJetFuelReconciliationSecond]    Script Date: 13/01/2017 01:36:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Process].[VW_NationalJetFuelReconciliationSecond]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [Process].[VW_NationalJetFuelReconciliationSecond] AS
SELECT A.[ID]
      ,A.[RemittanceID]
      ,A.[MonthYear]
      ,A.[Period]
      ,A.[AirlineCode]
      ,A.[StationCode]
	  ,A.[EndDateTime]
      ,A.[InvoiceNumber]
      ,A.[InvoiceDate]
      ,A.[ElectronicInvoiceNumber]
      ,A.[ElectronicInvoiceDate]
      ,A.[TicketNumber]
      ,A.[FlightNumber]
      ,A.[EquipmentNumber]
      ,A.[VolumeM3]
      ,A.[SubtotalAmount]
	  ,B.[PeriodCode]
      ,B.[AirlineCode] CostAirlineCode
      ,B.[FlightNumber] CostFlightNumber
      ,B.[TicketNumber] CostTicketNumber
      ,B.[EquipmentNumber] CostEquipmentNumber
	  ,B.[DepartureDate]
	  ,B.[DepartureStation]
	  ,B.[ArrivalDate]
	  ,B.[ArrivalStation]
      ,B.[FueledQtyLts]
      ,B.[ConceptAmount]
	  ,ABS(B.ConceptAmount - A.SubtotalAmount) [Variance]
	  ,CASE WHEN ABS(B.ConceptAmount - A.SubtotalAmount) <= ISNULL((SELECT TOP 1 [ToleranceValue] 
																	  FROM [Catalog].[ReconciliationTolerance]
																	 WHERE [ServiceCode] = ''CM''
																	   AND [CurrencyCode] = ''MXN''
																	   AND [ToleranceTypeCode] = ''MONEY''
																	   AND [Status] = 1), 0) 
	        THEN ''OK'' 
			ELSE ''DIFF'' END [Status]
  FROM [Process].[NationalJetFuelInvoiceDetail] A LEFT JOIN
(
SELECT A.[PeriodCode]
      ,A.[AirlineCode]
      ,A.[FlightNumber]
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
      ,A.[AirlineCode]
      ,A.[FlightNumber]
      ,A.[TicketNumber]
      ,A.[EquipmentNumber]
	  ,B.[DepartureDate]
	  ,B.[DepartureStation]
	  ,B.[ArrivalDate]
	  ,B.[ArrivalStation]
	  ) B ON (A.[AirlineCode] = B.[AirlineCode] AND
			  A.FlightNumber = B.FlightNumber AND
		      A.EquipmentNumber = B.EquipmentNumber AND
	          A.StationCode = B.DepartureStation
		  AND CONVERT(VARCHAR, A.[EndDateTime], 112) = CONVERT(VARCHAR, B.[DepartureDate], 112)
		  )
WHERE ConceptAmount IS NOT NULL








' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'Airport', N'VIEW',N'VW_JetFuelTicket', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 514
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 516
               Left = 38
               Bottom = 645
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 648
               Left = 38
               Bottom = 777
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 780
               Left = 38
               Bottom = 909
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
  ' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'VIEW',@level1name=N'VW_JetFuelTicket'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'Airport', N'VIEW',N'VW_JetFuelTicket', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
   End
   Begin SQLPane = s
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'VIEW',@level1name=N'VW_JetFuelTicket'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'Airport', N'VIEW',N'VW_JetFuelTicket', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Airport', @level1type=N'VIEW',@level1name=N'VW_JetFuelTicket'
GO
