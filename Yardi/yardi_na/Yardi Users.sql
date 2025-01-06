Select distinct
	upper(g.uCode) + ' ' + isnull(g.sDesc, '') gCode
	,
	u.uName,
	u.sCode,
	pr.sFirstName, 
	pr.uLastName, 
	u.sEMail,
	case isnull(u.bInActiveUser, 0)
		when 0
		then 'Active'
		else 'InActive'
		end sStatus,
	(select max(l.dtIn) from AuditLogin l where l.hLoginID = U.hMy) dtLogIn,
	(select count(l.hMy) from AuditLogin l where l.hLoginID = U.hMy and l.dtIn > dateadd(yy, -1, getdate())) iLogIns1Year,
	(select p.sCode from Property p where p.hMy = U.hPropList) sProp,
	u.iPast,
	u.iFuture,
	u.dtPass,
	case u.bBat when -1 then 'Yes' else 'No' end sBat,
	case u.bRepBat when -1 then 'Yes' else 'No' end bRepBat,
	case u.bCtrlAcct when -1 then 'Yes' else 'No' end bCtrlAcct,
	case u.bWord when -1 then 'Yes' else 'No' end bWord,
	case u.bExcel when -1 then 'Yes' else 'No' end bExcel,
	case u.bMessages when 0 then 'Yes' else 'No' end bMessages,
	case u.bReadOnly when -1 then 'Yes' else 'No' end bReadOnly,
	case u.bXbf when -1 then 'No' else 'Yes' end bBudget,
	e.sCode eCode
From
	pmGroup g,
	pmUser u
	left outer join prEmployee e on
		u.hMy = e.hUser
	left outer join Person pr on
		e.hMyPerson = pr.hMy
Where
	g.hMy = u.hGroup and
	isnull(u.bInActiveUser, 0) = case '#sStatus#' when 'Active Only' then 0 else case '#sStatus#' when 'InActive Only' then -1 else isnull(u.bInActiveUser, 0) end end
Order By
	1, 2
;
