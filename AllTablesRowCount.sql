SELECT SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA],
[Tables].name AS [TABLE_NAME]
,SUM([Partitions].[rows]) AS [TotalRowCount]
FROM sys.tables AS [Tables]
JOIN sys.partitions AS [Partitions]
ON [Tables].[object_id] = [Partitions].[object_id]
AND [Partitions].index_id IN ( 0, 1 )
-- WHERE [Tables].name = N'VDC_BI_GLDetail'
GROUP BY SCHEMA_NAME(schema_id), [Tables].name
HAVING SUM([Partitions].[rows]) > 00000


UNION ALL

SELECT SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA],
[Tables].name AS [TABLE_NAME], 1 AS [TotalRowCount]
FROM sys.views AS [Tables]
WHERE [Tables].name LIKE N'VDC%'
GROUP BY SCHEMA_NAME(schema_id), [Tables].name
ORDER BY [TotalRowCount] DESC