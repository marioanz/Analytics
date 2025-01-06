SELECT 
       [Entity]
      ,[Campus]
      ,[Bldg]
      --,[Customer]
      --,[Space]
      --,[PH]
      --,[Termination]
      --,[Currency]  
	    , YEAR([Lease_Signature]) * 100 + MONTH([Lease_Signature]) as YearMonth
        --,CAST(DATEPART(year, [Lease_Signature]) as char(4)) + '-' + RIGHT('00' + CAST(DATEPART(MONTH, [Lease_Signature]) as  varchar(2)), 2) as YearMonth
      --,[Commencement]
      --,[Maturity]
      --,[Lease_Term]
      ,SUM([Leased_kW]) [kWs_Signed_by_Month]
      --,[Start_Rate]
      --,[Min_TCV]
      --,[TCV]
      --,[FX_Rate]
      --,[Start_Rate_USD]
      --,[Avg_Rate]
      --,[GAAP_Rate_USD]
      --,[Rent_Esc]
      --,[Guar_TCV_M_USD]
      --,[TCV_$M]
  FROM [IMPORT].[dbo].[Lease Matrix]
  GROUP BY  [Entity], [Campus], [BLDG], YEAR([Lease_Signature]) * 100 + MONTH([Lease_Signature])
  --GROUP BY [Campus], [BLDG], CAST(DATEPART(year, [Lease_Signature]) as char(4)) + '-' + RIGHT('00' + CAST(DATEPART(MONTH, [Lease_Signature]) as  varchar(2)), 2)
  ORDER BY [YearMonth]