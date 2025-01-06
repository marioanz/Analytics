SELECT 'Yardi' as [DATABASE_NAME], SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA]
, COUNT([Tables].name) AS [TABLE_COUNT], 'All Tables' AS [ROWCOUNT]
--, SUM([Partitions].[rows]) AS [TotalRowCount]
FROM sys.tables AS [Tables]
JOIN sys.partitions AS [Partitions]
ON [Tables].[object_id] = [Partitions].[object_id]
AND [Partitions].index_id IN ( 0, 1 )
-- WHERE [Tables].name = N'VDC_BI_GLDetail'
GROUP BY SCHEMA_NAME(schema_id) 
UNION
		SELECT 'Yardi' as [DATABASE_NAME], 'dbo' [TABLE_SCHEMA], COUNT(rows) [ROWS > 0], 'Rows > 0' AS [ROWCOUNT]
		FROM (
			SELECT [Tables].name, SUM([Partitions].[rows]) Rows
			FROM sys.tables AS [Tables]
				JOIN sys.partitions AS [Partitions]
				ON [Tables].[object_id] = [Partitions].[object_id]
					AND [Partitions].index_id IN ( 0, 1 )
			GROUP BY [Tables].name
			HAVING SUM([Partitions].[rows]) > 0
					)
				AS ROWS 

--ORDER BY [TotalRowCount] DESC

--UNION ALL

--SELECT SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA],
--[Tables].name AS [TABLE_NAME]
--FROM sys.views AS [Tables]
--WHERE [Tables].name LIKE N'VDC%'
--GROUP BY SCHEMA_NAME(schema_id), [Tables].name

--UNION ALL

--SELECT SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA], [Tables].name AS [TABLE_NAME]
--FROM sys.tables AS [Tables]
--JOIN sys.partitions AS [Partitions]
--ON [Tables].[object_id] = [Partitions].[object_id]
--AND [Partitions].index_id IN (0, 1)
--GROUP BY SCHEMA_NAME(schema_id), [Tables].name
--HAVING SUM([Partitions].[rows]) > 0
