SELECT TOP (1000) [Campus]
      ,[Building]
      ,[YearMonth]
      ,[KWs_Operational]
  FROM [dbo].[MasterBuildSchedule]
  WHERE Building = 'AZ14'
  ORDER BY YearMonth