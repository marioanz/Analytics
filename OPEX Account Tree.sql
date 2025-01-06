SELECT coa.[GL_Account_Code_Formatted] ACCT
      ,coa.GL_Account_Description AccountDescription
	  --,at.[Account_Tree_Node_Type]
	  ,coa.[Report_Type] AS ReportType
      --,at.[Account_Tree_Node_Description]

  FROM
	(SELECT DISTINCT
       atx.[GL_Account_Id]

  FROM [DataFreedom_Client].[dbo].[df_Financial_Account_Tree] act
  JOIN [DataFreedom_Client].[dbo].[df_Financial_Account_Tree_Xref] atx
			ON atx.[Account_Tree_Node_Id] = act.[Account_Tree_Node_Id]
    WHERE act.[Account_Tree_Code] = 'z-detailcashpl4') xref

	JOIN [DataFreedom_Client].[dbo].[df_Financial_Chart_Of_Accounts] coa
		ON coa.GL_Account_Id = xref.GL_Account_Id
  ORDER BY AccountDescription



	--JOIN [DataFreedom_Client].[dbo].[df_Financial_Account_Tree_Xref] xr
	--	ON xr.[Account_Tree_Node_Id] = xref.[Account_Tree_Node_Id]
	--	AND xr.[Account_Tree_Code] = 'z-detailcashpl4'


		--JOIN [DataFreedom_Client].[dbo].[df_Financial_Account_Tree] at
		--ON at.[Account_Tree_Node_Id] = xref.[Account_Tree_Node_Id]
		--AND at.[Account_Tree_Code] = 'z-detailcashpl4'