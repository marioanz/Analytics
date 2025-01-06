DECLARE @nanoi int, @natotalrev int

	SELECT @nanoi = SUM(yfd.Actual) 
	FROM [dbo].[NA-Yardi_Financial_Data] yfd
	JOIN [dbo].[NA-DIM_Property] dp
	on dp.[Property Id] = yfd.[Property Id]
	WHERE yfd.[Account Tree Node Description] = 'NOI (Cash)'
;


	SELECT @natotalrev = SUM(yfd.Actual)
	FROM [dbo].[NA-Yardi_Financial_Data] yfd
	JOIN [dbo].[NA-DIM_Property] dp
	on dp.[Property Id] = yfd.[Property Id]
	WHERE yfd.[Account Tree Node Description] = 'TOTAL REVENUES'
;

SELECT CAST(@nanoi AS float) / CAST(@natotalrev AS float) AS 'NA-NOI %'
;