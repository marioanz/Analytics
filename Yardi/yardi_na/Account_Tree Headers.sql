SELECT 
       [Account Tree Node Id]
      ,[Account Tree Node Type]
      ,[Account Tree Node Code]
      ,[Account Tree Node Description]
      ,[Account Tree Node Description Indented]
      --,[Account Tree Node Code and Description]
      ,[Account Tree Node Total Into Id]
      ,[Is Hidden]
      ,[Parent Header Node Id]
      ,[Account Tree Node Nest Level]
      ,[Breadcrumb - Codes]
      ,[Breadcrumb - Descriptions]
      ,[Breadcrumb - Code and Descriptions]
  FROM [DataFreedom].[DataFreedom].[df_Financial_Account_Tree]
  WHERE [Account Tree Code] = 'z-detailcashpl4'
  AND [Is Hidden] = 1 and [Account Tree Node Type] = 'H'
  ORDER BY [Account Tree Node Id]