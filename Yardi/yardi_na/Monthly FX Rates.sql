SELECT
TOP (1000) 
[Exchange Date]
      ,[From Currency Code]
      ,[From Currency Name]
      ,[From Currency Symbol]
      ,[To Currency Code]
      ,[To Currency Name]
      ,[To Currency Symbol]
      ,[Rate]
      ,[Rate Provider Code]
      ,[Rate Provider Name]
      ,[Rate Type Code]
      ,[Rate Type Name]
  FROM [DataFreedom].[DataFreedom].[df_Financial_Fx_Rate]
  WHERE [From Currency Code] = 'CAD'
		AND [To Currency Code] = 'USD'
		AND [Rate Type Name] = 'Monthly Average Rate'
  ORDER BY [Exchange Date] DESC
