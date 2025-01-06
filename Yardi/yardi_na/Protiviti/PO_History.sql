Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	po.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	po.hMy ActivityID, 
	po.dtDateIn ActivityDateTime, 
	'PO Created' ActivityName, 
	po.dTotal UnitPrice, 
	1 Quantity, 
	substring(po.sRequestedBy, 1, 25) UserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
Where
	1=1

UNION ALL

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	po.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	po.hMy ActivityID, 
	po.dtDateModified ActivityDateTime, 
	'PO Last Modified' ActivityName, 
	po.dTotal UnitPrice, 
	1 Quantity, 
	substring(um.uName, 1, 25) UserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	left outer join pmUser um on
		po.hUserModifiedBy = um.hMy
Where
	po.dtDateModified is not null

UNION ALL

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	po.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	wfs.hMy ActivityID, 
	wfs.dtStart ActivityDateTime, 
	substring(wfs.sName + ' WorkFlow Step Start', 1, 55) ActivityName, 
	po.dTotal UnitPrice, 
	1 Quantity, 
	substring(us.uName, 1, 25) UserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	inner join WF_Tran_Step wfs on
		wfs.iType = 26 and
		po.hMy = wfs.hRecord
	left outer join pmUser us on
		wfs.hUserStart = us.hMy
Where
	1=1

UNION ALL

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	po.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	wfs.hMy ActivityID, 
	wfs.dtComplete ActivityDateTime, 
	substring(wfs.sName + ' WorkFlow Step Complete', 1, 55) ActivityName, 
	po.dTotal UnitPrice, 
	1 Quantity, 
	substring(uc.uName, 1, 25) UserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	inner join WF_Tran_Step wfs on
		wfs.iType = 26 and
		po.hMy = wfs.hRecord and
		wfs.dtComplete is not null
	left outer join pmUser uc on
		wfs.hUserComplete = uc.hMy
Where
	1=1

UNION ALL

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	po.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	po.hMy ActivityID, 
	wf.dtComplete ActivityDateTime, 
	'PO Workflow Completed' ActivityName, 
	po.dTotal UnitPrice, 
	1 Quantity, 
	substring(uc.uName, 1, 25) UserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	inner join WF_Tran_Header wf on
		wf.hMy = (select max(wf2.hMy) from WF_Tran_Header wf2 where
			wf2.iType = 26 and
			PO.hMy = wf2.hRecord) and
		wf.dtComplete is not null
	left outer join pmUser uc on
		wf.hUserComplete = uc.hMy
Where
	1=1

Order By
	2 desc, 8, 9