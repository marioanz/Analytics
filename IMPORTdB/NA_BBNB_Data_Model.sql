IF OBJECT_ID('tempdb..#BBNBData') IS NOT NULL
	DROP TABLE #BBNBData
;
IF OBJECT_ID('tempdb..#LeaseMatrix') IS NOT NULL
	DROP TABLE #LeaseMatrix
GO

WITH BBNB
  AS
	 (
		SELECT 
	     [Building]
        ,[Contracted]
        ,[kW_Ramped]
        ,[kW_Leased]
        ,[Revenue]
        ,[Opex_kW_Mth]
        ,[Opex]
        ,[NOI]
        ,[NOI_Margin]
        ,[EBITDA]

		FROM [IMPORT].[dbo].[DevCoBBNB]

		UNION

		SELECT
         [Building]
        ,[Contracted]
        ,[kW_Ramped]
        ,[kW_Leased]
        ,[Revenue]
        ,[Opex_kW_Mth]
        ,[Opex]
        ,[NOI]
        ,[NOI_Margin]
        ,[EBITDA]
		FROM [IMPORT].[dbo].[YieldCoBBNB]
	  )
  
  SELECT
       rr.[YearMonth]
	  ,rr.[LeaseName]
      ,rr.[TotalRent]
      ,rr.[Building]
      ,rr.[DataModule]
      ,rr.[KWRamped]
	  ,bb.[Opex_kW_Mth]
      ,rr.[TotalRent] - ([KWRamped] * [Opex_kW_Mth]) AS NOI
	  ,rr.[LeaseStartDate]
	  ,rr.[B_Bit]
	  ,(rr.[TotalRent]) * (-rr.B_bit) AS BBNB_Revenue
	  ,(rr.[TotalRent] - ([KWRamped] * [Opex_kW_Mth])) * (-rr.B_bit) AS BBNB_NOI
	
	INTO #BBNBData
	
	FROM [dbo].[Rent-Ramp] rr
  LEFT JOIN BBNB bb
	ON bb.Building = rr.Building
  WHERE 
		rr.Building = 'VA22' AND YearMonth = 202412 AND DataModule = 'DM1/DM2/DM3'
	OR  rr.Building = 'VA14' AND YearMonth = 202409 AND DataModule = 'DM11/12/21/22/31/32'
	OR  rr.Building = 'WA13' AND YearMonth = 202408 AND DataModule = 'DM11/DM15/DM21/DM25'
	OR  rr.Building = 'AZ13' AND YearMonth = 202407 AND DataModule = 'DH15'
	OR  rr.Building = 'CA23' AND YearMonth = 202404 AND DataModule = 'DH21/32'
	OR  rr.Building = 'WA12' AND YearMonth = 202403 AND DataModule = 'DH3-DH4'
	OR  rr.Building = 'CA12' AND YearMonth = 202402 AND DataModule = 'DM1A.1/2'
    OR  rr.Building = 'CA12' AND YearMonth = 202401 AND DataModule = 'DM1B'

	ORDER BY YearMonth

	GO

	SELECT 
       lm.YearMonth
	  ,lm.Entity
	  ,nd.Market
	  ,nd.Country
      ,lm.Campus
      ,lm.Building
      ,SUM(lm.Leased_kW) as kWs_Signed_by_Month
	  ,mbs.KW
	  ,rr.[TotalRent] as Rental_Revenue


  INTO #LeaseMatrix

  FROM dbo.LeaseMatrix lm
  LEFT JOIN dbo.MasterBuildSchedule mbs
	ON lm.Building = mbs.building and lm.Campus = mbs.campus and lm.YearMonth = mbs.YearMonth
  LEFT JOIN dbo.[Rent-Ramp] rr 
	ON lm.Building = rr.Building and lm.YearMonth = rr.YearMonth and lm.Entity = rr.Entity
  LEFT JOIN dbo.NAMDDelimited nd
	ON lm.Campus = nd.Site

	
--WHERE lm.Building = 'AZ14' 

  GROUP BY  lm.Entity, lm.Campus, lm.Building, nd.Market, nd.Country, mbs.KW, 
		lm.YearMonth ,rr.TotalRent
 ORDER BY YearMonth DESC

 GO

 SELECT bd.*, lm.Market, lm.Country, lm.kWs_Signed_by_Month, KW, Rental_Revenue
 FROM #BBNBData bd
 LEFT JOIN #LeaseMatrix lm
	on bd.YearMonth = lm.YearMonth and bd.Building = lm.Building
 ORDER BY YearMonth

--select * from #BBNBData

--SELECT * FROM #LeaseMatrix ORDER BY YearMonth DESC