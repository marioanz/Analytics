DECLARE @naebitda int, @natotalebitda int

	SELECT @naebitda = SUM(yfd.Actual) 
	FROM [dbo].[NA-Yardi_Financial_Data] yfd
	JOIN [dbo].[NA-DIM_Property] dp
	on dp.[Property Id] = yfd.[Property Id]
	WHERE yfd.[Account Tree Node Description] = 'EBITDA'
;

	SELECT @natotalebitda = SUM(yfd.Actual)
	FROM [dbo].[NA-Yardi_Financial_Data] yfd
	JOIN [dbo].[NA-DIM_Property] dp
	on dp.[Property Id] = yfd.[Property Id]
	WHERE yfd.[Account Tree Node Description] = 'TOTAL REVENUES'
;

SELECT CAST(@naebitda AS float) / CAST(@natotalebitda AS float) AS 'NA-EBITDA %'
;