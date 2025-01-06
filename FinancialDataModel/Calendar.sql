/*
if object_id('IMPORT.dbo.calendarTbl') is not null drop table IMPORT.dbo.calendarTbl
;
create table IMPORT.dbo.calendarTbl (
    Date date primary key,
	YearMonth int
)
;
*/
declare @startDate date;
declare @endDate date;

set @startDate = '2016-01-01';
set @endDate = dateadd(yy, 25, datefromparts(year(getdate()),12,31));



while @startDate <= @endDate
    begin
        insert into IMPORT.dbo.calendarTbl
	    select 
	        @startDate
			,concat(YEAR(@startDate), right('0' + cast(MONTH(@startDate) as varchar(2)), 2))
	    set @startDate = dateadd(mm, 1, @startDate)
    end
;

select top 100 * from IMPORT.dbo.calendarTbl