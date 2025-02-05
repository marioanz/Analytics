SELECT TOP (1000) [LeaseName]
      ,[LeaseID]
      ,[Currency]
      ,[Customer]
      ,[Entity]
      ,[LeaseStartDate]
      ,[Building]
      ,[DataModule]
      ,[YearMonth]
      ,[TotalRent]
      ,[KWRamped]
      ,[CurrentRate]
      ,[CurrentAddRent]
      ,[B_Bit]
  FROM [dbo].[Rent-Ramp]
  WHERE [Building] = 'AZ14'
  ORDER BY YearMonth