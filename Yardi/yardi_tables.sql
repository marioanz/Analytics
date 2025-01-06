SELECT SCHEMA_NAME(schema_id) AS [TABLE_SCHEMA], [Tables].name AS [TABLE_NAME]
FROM sys.tables AS [Tables]
JOIN sys.partitions AS [Partitions]
ON [Tables].[object_id] = [Partitions].[object_id]
AND [Partitions].index_id IN (0, 1)
--WHERE name IN ('JOBTYPE', 'JOBPROPS', 'JOBTYPE', 'LISTJOB', 'MEMO', 'PROPERTY')
GROUP BY SCHEMA_NAME(schema_id), [Tables].name
HAVING SUM([Partitions].[rows]) > 0