SELECT * FROM
(
SELECT DISTINCT
       [CardHolder]
      --,[LocalEventTimestamp] AS AccessDate
	  ,IIF(COUNT([Event]) > 3, 3, COUNT([Event])) AS Badges, 
	CASE
		WHEN COUNT([Event]) >= 3 THEN 'No'
		ELSE 'Yes'
	END AS Flag
	  ,d.WeekNumber  AS 'Week'
	  --,d.WeekStartDate
	  --,d.WeekEndDate
  FROM 
  [BadgeAccess] ba
  JOIN Dates d
		ON d.Date = ba.LocalEventTimestamp
  WHERE CardHolder = 'Mario Anzaldua'
GROUP BY [CardHolder], d.WeekNumber --, d.WeekStartDate, d.WeekEndDate
) src

PIVOT
(
SUM(Badges)
FOR Week IN ([30], [31], [32], [33], [34], [35], [36], [37], [38], [39])
) piv
