WITH EmployeeWeek AS
(
	SELECT ed.Worker, ed.Locations, c.WeekOfYear
	FROM EmployeeDetails ed
	CROSS JOIN 
		(SELECT DISTINCT WeekOfYear FROM Calendar)c --WHERE ed.Worker = 'Madison Galati'
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
  WHERE c.WeekOfYear BETWEEN 30 AND DATEPART(WEEK, GETDATE()) --AND ac.Worker = 'Madison Galati'
),

BadgeAccess AS
(
	SELECT 
			CardHolder, 
			LocalEventTimestamp,
			DATEPART(WEEK, LocalEventTimestamp) AS WeekOfYear,
			COUNT(Event) AS badge_count
		FROM BadgeAccessRaw
	 	--WHERE [CardHolder] = 'Madison Galati'
		GROUP BY CardHolder, LocalEventTimestamp, DATEPART(WEEK, LocalEventTimestamp)
)

	  
	  SELECT DISTINCT
     ew.Worker, ew.WeekOfYear,
    CASE
        WHEN ba.badge_count > 3 THEN 3
        ELSE COALESCE(ba.badge_count, 0)
    END AS Badges 
    ,COALESCE(hto.[Has Time Off], 'O') AS 'Has Time Off',
    CASE 
        WHEN ba.badge_count >= 3 OR hto.[Has Time Off] = 'X' THEN 'No'
        ELSE 'Yes'
    END AS Flag

FROM 
  EmployeeWeek ew
  LEFT JOIN BadgeAccess ba
        ON ba.CardHolder = ew.Worker AND ba.WeekOfYear = ew.WeekOfYear
  LEFT JOIN Calendar c
		ON c.Date = ba.LocalEventTimestamp
  LEFT JOIN HASTIMEOFF hto
		ON hto.worker = ew.Worker AND hto.Week = ew.WeekOfYear
  WHERE ew.WeekOfYear BETWEEN 30 AND DATEPART(WEEK, GETDATE())
  GROUP BY ew.Worker, ew.WeekOfYear, hto.[Has Time Off], ba.badge_count
  ORDER BY weekofyear, Badges DESC

