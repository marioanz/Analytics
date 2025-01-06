select distinct j.scode scode,
j.sbriefdesc bdesc,
'' saddress,
'' pscode,
'' paddress,
'' status,
convert(datetime,'01/01/1900',101) sreqdate,
convert(datetime,'01/01/1900',101) sscheddate,
0 dcommpercent,
'' stext,
j.hmy sorter,
'A' listcode
FROM memo m, job j
left outer join property p on p.hmy = j.hproperty
where
 j.hmy = m.hfilercd
and j.itype = 76
and m.ifiletype in (65,66)
and   m.ifield = 1

union all

select co.scode,   
  co.sbriefdesc bdesc,
  co.ssiteaddr saddress,
  p.scode pscode,
  p.saddr1 paddress, 
  case co.istatus when 0 then 'Scheduled' when 1 then 'Inprogress' when 2 then 'Completed' when 3 then 'Cancelled' when 4 then 'Closed' when 5 then 'Pending' when 6 then 'Approved' when 7 then 'Rejected' end status,
  co.sreqdate,
  co.sscheddate,
  co.dcommpercent,
  m.stext,
  l.hjoblist sorter,
	'B' listcode
  FROM memo m,job j, listjob l, job co
  left outer join property p on p.hmy = co.hproperty
  where
  j.hmy = l.hjoblist
  and j.itype = 76
  and l.hjob = co.hmy
  and  co.hmy = m.hfilercd
  and co.itype in  (65,76)
  and m.ifiletype in (65,66)
  and   m.ifield = 1  
ORDER BY 11, 12