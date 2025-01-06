IF OBJECT_ID('tempdb..#yardiFinDat') IS NOT NULL
	DROP TABLE #yardiFinDat
;
GO

WITH 
[NA-Yardi_Financial_Data]
AS
(
	SELECT 
		   [Account Tree Id] Account_Tree_Id
		  ,[Account Tree Code] Account_Tree_Code
		  ,[Account Tree Description] Account_Tree_Description
		  ,[Account Tree Node Id] Account_Tree_Node_Id
		  ,[Account Tree Node Type] Account_Tree_Node_Type
		  ,[Account Tree Node Sign] Account_Tree_Node_Sign
		  ,[Account Tree Node Code] Account_Tree_Node_Code
		  ,[Account Tree Node Code Formatted] Account_Tree_Node_Code_Formatted
		  ,[Account Tree Node Description] Account_Tree_Node_Description
		  ,[Account Tree Node Description Indented] Account_Tree_Node_Description_Indented
		  ,[Account Tree Node Code and Description] Account_Tree_Node_Code_and_Description
		  ,[Is Hidden] Is_Hidden
		  ,[Property Id] Property_Id
		  ,[Property Code] Property_Code
		  ,[Property Name] Property_Name
		  ,[Book Name] Book_Name
		  ,CAST([Post Month] AS date) AS Post_Month
		  ,[Actual Beginning Balance] Actual_Beginning_Balance
		  ,[Actual]
		  ,[Budget Beginning Balance] Budget_Beginning_Balance
		  ,[Budget]
		  ,[Currency]
		  ,[Database Id] Database_Id
		  ,[Source Data Through] Source_Data_Through
		  ,[GL Account Id] GL_Account_Id
		  ,[GL Account Code] GL_Account_Code
		  ,[GL Account Description] GL_Account_Description
		  ,[Normal Balance] Normal_Balance
	FROM DataFreedom.DataFreedom.df_Financial_Entire dfe

	WHERE dfe.[Account Tree Code] = N'z-detailcashpl4'
	AND dfe.[Currency] = 'usd'
	AND dfe.[Post Month] >= CONVERT(DATE, '2023-01-01', 102)
	AND dfe.[Book Name] IN ('ADJ_USD', 'USD_Accrual')
)

SELECT * INTO #yardiFinDat FROM [NA-Yardi_Financial_Data]
CREATE NONCLUSTERED INDEX idx ON #yardiFinDat ([Property_Id], [Post_Month])
GO

WITH
[NA-DIM_Property_Id]
AS
(
	SELECT DISTINCT       
			[Property Id] AS District_Property_List, CAST([Post Month] AS date) as Post_Month, [Account Tree Code] AS Account_Tree_Code
	FROM    DataFreedom.DataFreedom.df_Financial_Entire
	WHERE   ([Account Tree Code] = N'z-detailcashpl4') AND [Post Month] >= CONVERT(DATE, '2023-01-01', 102) 
)
,

[NA-df_Global_Property]
AS
(
	SELECT DISTINCT     
		   [Property Id] Property_Id
		  ,[Type]
		  ,[Code]
		  ,[Name]
		  ,[Address 1] Address_1
		  ,[Address 2] Address_2
		  ,[City]
		  ,[State]
		  ,[Postal Code] Postal_Code
		  ,[Country]
		  ,[Latitude]
		  ,[Longitude]
		  ,[Notes]
		  ,[Legal Entity Id] Legal_Entity_Id
		  ,[Legal Entity Code] Legal_Entity_Code
		  ,[Legal Entity Name] Legal_Entity_Name
		  ,[Tax Authority] Tax_Authority
		  ,[Base Currency] Base_Currency
		  ,[Is Commercial] Is_Commercial
		  ,[Is Residential] Is_Residential
		  ,[Area - Default] Area_Default
		  ,[Area - Rentable] Area_Rentable
		  ,[Area - MegaWatts] Area_MegaWatts
		  ,[Area - Quantity] Area_Quantity
		  ,[Area - KW] Area_KW
		  ,[Area - Default (Sum of Units)] Area_Default_Sum_of_Units
		  ,[Is Active] Is_Active
		  ,[Inactive Date] Inactive_Date
		  ,[Attribute - SUBGROUP1] Attribute_SUBGROUP1
		  ,[Attribute - SUBGROUP2] Attribute_SUBGROUP2
		  ,[Attribute - SUBGROUP3] Attribute_SUBGROUP3
		  ,[Attribute - SUBGROUP4] Attribute_SUBGROUP4
		  ,[Attribute - SUBGROUP5] Attribute_SUBGROUP5
		  ,[Attribute - SUBGROUP6] Attribute_SUBGROUP6
		  ,[Voyager URL] Voyager_URL
		  ,[Database Id] Database_Id
		  ,[Source Data Through] Source_Data_Through
		  ,ndpi.District_Property_List
		  ,UPPER(LEFT(TRIM(dgp.Code), 3)) AS First_Characters

	FROM  DataFreedom.DataFreedom.df_Global_Property dgp 
	LEFT OUTER JOIN [NA-DIM_Property_Id] ndpi ON dgp.[Property Id] = ndpi.District_Property_List
	WHERE (NOT (ndpi.District_Property_List IS NULL))
)
,

[NA-DIM_Property]
AS
(
	SELECT  DISTINCT
		dgplx.[Property Id] Property_Id,  dgplx.[Property Code] Property_Code, 
		CASE
			WHEN dgplx.[Property List Code] = '.devca22' THEN 'DevCo'
			WHEN dgplx.[Property List Code] = '.devus' THEN 'DevCo'
			WHEN dgplx.[Property List Code] = '.yieldus' THEN 'SDC'
			WHEN dgplx.[Property List Code] = '.yldca22' THEN 'SDC'
		ELSE 'Other'
		END AS 'Entity',
		UPPER(LEFT(TRIM(dgplx.[Property Code]), 4)) AS Actual_Building,
		UPPER(ndgp.country) AS Country, ndgp.city AS Market, ndgp.state AS State, 'NA' AS Region

	FROM        DataFreedom.DataFreedom.df_Global_Property_List_Xref dgplx
	LEFT OUTER JOIN [NA-DIM_Property_Id] ndpi ON dgplx.[Property Id] = ndpi.District_Property_List
	LEFT OUTER JOIN [NA-df_Global_Property] ndgp ON ndgp.District_Property_List = dgplx.[Property Id]
	WHERE dgplx.[Property List Code] IN ('.devca22', '.devus', '.yieldus', '.yldca22')
)

SELECT dp.Country, dp.Entity, dp.Market, dp.Region, dp.State, dp.Actual_Building, dpi.Post_Month, SUM(yfd.[Actual]) as [NA-NOI]
FROM #yardiFinDat yfd
JOIN [NA-DIM_Property_Id] dpi
	ON yfd.Property_Id = dpi.District_Property_List
	AND yfd.Post_Month = dpi.Post_Month
JOIN [NA-DIM_Property] dp
	ON dp.Property_Id = dpi.District_Property_List
WHERE yfd.Account_Tree_Node_Description = 'NOI (Cash)'
GROUP BY dpi.Post_Month, dp.Actual_Building, dp.Country, dp.Entity, dp.Market, dp.Region, dp.State
ORDER BY Actual_Building, Post_Month

GO
