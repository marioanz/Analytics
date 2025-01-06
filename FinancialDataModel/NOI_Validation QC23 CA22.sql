SELECT  
	   --[Account Tree Id]
    --  ,[Account Tree Code]
    --  ,[Account Tree Description]
    --  ,[Account Tree Node Id]
    --  ,[Account Tree Node Type]
    --  ,[Account Tree Node Sign]
    --  ,[Account Tree Node Code]
    --  ,[Account Tree Node Code Formatted]
      [Account Tree Node Description]
    --  ,[Account Tree Node Description Indented]
    --  ,[Account Tree Node Code and Description]
    --  ,[Is Hidden]
    --  ,[Property Id]
      --,[Property Code]
      ,[Property Name]
    --  ,[Book Name]
    --  ,[Post Month]
    --  ,[Actual Beginning Balance]
	    --,[Actual]
      ,SUM([Actual]) AS Amount
    --  ,[Budget Beginning Balance]
    --  ,[Budget]
      --,[Currency]
    --  ,[Database Id]
    --  ,[Source Data Through]
    --  ,[GL Account Id]
    --  ,[GL Account Code]
    --  ,[GL Account Description]
    --  ,[Normal Balance]
  FROM [DataFreedom].[DataFreedom].[df_Financial_Entire]
  WHERE [Property Id] IN (347, 378)
  AND Actual <> 0 AND Actual IS NOT NULL
  AND [Currency] = 'usd'
  AND [Book Name] IN ('ADJ_USD', 'USD_Accrual')
  AND [Account Tree Code] = 'z-detailcashpl4'
  AND [Post Month] BETWEEN '2024-01-01' AND '2024-03-01'
  AND [Account Tree Node Description] = 'TOTAL REVENUES'
GROUP BY [Account Tree Node Description], [Property Name]