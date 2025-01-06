WITH HASTIMEOFF AS
(
SELECT DISTINCT
       ac.Worker 
	   ,c.WeekofYear AS 'Week'
	   , 'X' AS 'Has Time Off'
	   ,ac.time_off_start_date
	   ,ac.Time_Off_End_Date
  FROM [EmployeeDetails] ed
 LEFT JOIN [AbsenceCalendar] ac
		ON ac.worker = ed.worker
  JOIN Calendar c
		ON c.Date BETWEEN  ac.time_off_start_date AND  ac.Time_Off_End_Date
--WHERE  c.WeekOfYear BETWEEN 20 AND 39  AND ed.Employee_ID = 'BWN002523'
--ORDER BY WeekNumber desc
)