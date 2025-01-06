SELECT 
       lm.YearMonth
	  ,lm.Entity
	  ,nd.Market
      ,lm.Campus
      ,lm.Building
      ,SUM(lm.Leased_kW) as kWs_Signed_by_Month
	  ,mbs.KWs_Operational
	  ,rr.[TotalRent] as Rental_Revenue


  --INTO dbo.FinModel

  FROM dbo.LeaseMatrix lm
  JOIN dbo.MasterBuildSchedule mbs
	ON lm.Building = mbs.building and lm.Campus = mbs.campus and lm.YearMonth = mbs.YearMonth
  LEFT JOIN dbo.[Rent-Ramp] rr 
	ON lm.Building = rr.Building and lm.YearMonth = rr.YearMonth and lm.Entity = rr.Entity
  LEFT JOIN dbo.NAMDDelimited nd
	ON lm.Campus = nd.Site

	
--WHERE lm.Building = 'AZ14' 

  GROUP BY  lm.Entity, lm.Campus, lm.Building, nd.Market, mbs.KWs_Operational, 
		lm.YearMonth ,rr.TotalRent

 ORDER BY YearMonth DESC

