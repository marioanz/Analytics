WITH EmployeeWeek AS
(
	SELECT ed.Worker, ed.Locations, c.WeekOfYear, c.Month, c.Year
	FROM EmployeeDetails ed
	CROSS JOIN 
		(SELECT DISTINCT WeekOfYear, Month, Year FROM Calendar) c --WHERE ed.Worker = 'Madison Galati'
),

HASTIMEOFF AS
(
SELECT DISTINCT
        ac.Worker 
	   ,c.WeekofYear AS 'Week'
	   , 'X' AS 'Has Time Off'
	   ,ac.time_off_start_date
	   ,ac.Time_Off_End_Date
  FROM [AbsenceCalendar] ac
  JOIN Calendar c
		ON c.Date BETWEEN  ac.time_off_start_date AND  ac.Time_Off_End_Date
WHERE  c.WeekOfYear BETWEEN 30 AND DATEPART(WEEK, GETDATE())  --AND ac.Worker = 'Madison Galati'
--ORDER BY WeekNumber desc
)
--SELECT * FROM EmployeeWeek
	
	SELECT DISTINCT
       ew.Worker
	,ew.WeekOfYear
	,ew.Month
	,ew.Year
  --,[LocalEventTimestamp] AS AccessDate
	,IIF(COUNT([Event]) > 3, 3, COUNT([Event])) AS Badges 
	,ISNULL(hto.[Has Time Off], 'O') AS 'Has Time Off'
	,IIF(COUNT([Event]) >= 3 OR hto.[Has Time Off] = 'X', 'No', 'Yes') AS Flag


  --INTO dbo.BadgeTracking

  FROM 
  EmployeeWeek ew
  LEFT JOIN BadgeAccessRaw ba
	ON ba.CardHolder = ew.Worker AND DATEPART(WEEK, ba.LocalEventTimestamp) = ew.WeekOfYear
  LEFT JOIN Calendar c
		ON c.Date = ba.LocalEventTimestamp
  LEFT JOIN HASTIMEOFF hto
		ON hto.worker = ew.Worker AND hto.Week = ew.WeekOfYear
  WHERE ew.WeekOfYear BETWEEN 30 AND DATEPART(WEEK, GETDATE()) --AND ew.Worker = 'Madison Galati'--AND hto.[Has Time Off] = 'X' 
  GROUP BY ew.Worker, ew.WeekOfYear, hto.[Has Time Off], ew.Month, ew.Year
  --HAVING COUNT([Event]) = 3
  ORDER BY weekofyear

