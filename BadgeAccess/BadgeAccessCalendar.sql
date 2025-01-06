CREATE TABLE Calendar (
	Date DATE,
    WeekStartDate DATE,
    WeekEndDate DATE,
	WeekOfYear INT,
	Month INT,
	Year INT
)
;

DECLARE @StartDate DATE = '2024-01-01', @EndDate DATE = '2024-12-31'
;
WHILE @StartDate <= @EndDate
BEGIN
	DECLARE @WeekStartDate DATE = DATEADD(DAY, 1-DATEPART(WEEKDAY, @StartDate), @StartDate);
	DECLARE @WeekEndDate DATE = DATEADD(DAY, 7-DATEPART(WEEKDAY, @StartDate), @StartDate);
	DECLARE @WeekOfYear INT = DATEPART(WEEK, @StartDate)
;

	INSERT INTO Calendar(Date, WeekStartDate, WeekEndDate, WeekofYear, Month, Year)
	VALUES(@StartDate, @WeekStartDate, @WeekEndDate, @WeekOfYear, DATEPART(MONTH, @StartDate), DATEPART(YEAR, @StartDate))
	SET @StartDate = DATEADD(DAY, 1, @StartDate)
END
;
