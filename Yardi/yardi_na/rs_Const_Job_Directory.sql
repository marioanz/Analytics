SELECT                            /* Job without charge orders*/
  j.scode jscode,   
  j.sbriefdesc sbriefdesc,
  j.ssiteaddr ssiteaddr,
  p.scode pscode,
  p.saddr1 saddr1, 
  case j.istatus when 0 then 'Scheduled' when 1 then 'Inprogress' when 2 then 'Completed' when 3 then 'Cancelled' when 4 then 'Closed' when 5 then 'Pending' when 6 then 'Approved' when 7 then 'Rejected' end status,
  j.sreqdate sreqdate,
  j.sscheddate sscheddate,
  j.dcommpercent dcommpercent,
  m.stext stext,
   j.sCode Code,
  'A' sortorder, 
  jt.sCode Jobtype
  FROM memo m, job j
  left outer join property p on (p.hmy = j.hproperty)
  left outer join JobType jt on (jt.hmy=j.iJobType)
  where
  j.hmy = m.hfilercd
  and j.itype = 65
  and m.ifiletype in (65,66)
  and   m.ifield = 1 

/* No records--
 union all
  SELECT                            /* Job with charge orders*/
  '  ' + co.scode,   
  co.sbriefdesc,
  co.ssiteaddr ,
  p.scode,
  p.saddr1, 
  case co.istatus when 0 then 'Scheduled' when 1 then 'Inprogress' when 2 then 'Completed' when 3 then 'Cancelled' when 4 then 'Closed' when 5 then 'Pending' when 6 then 'Approved' when 7 then 'Rejected' end status,
  co.sreqdate,
  co.sscheddate,
  co.dcommpercent,
  m.stext,
   j.sCode Code,
  'B' sortorder,  
  jt.sCode Jobtype
  FROM memo m,caparam cap, job j
  left outer join property p on (p.hmy = j.hproperty), job co
  left outer join JobType jt on (jt.hmy=co.iJobType)
  where
  j.hmy = co.hjob
  and j.hmy = m.hfilercd
  and j.itype = 65
  and m.ifiletype in (65,66)
  and   m.ifield = 1  
  and 1= case '#inc#' when 'Yes' then 1 else 2 end /* show c/o's only when checked in filter */

ORDER BY 11,12
*/