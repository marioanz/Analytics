Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	po.dTotal POAmount, 
	upper(bc.sCode) POCurrency, 
	case po.bClosed when -1 then 'Closed' else 'Open' end POStatus, 
	substring(po.sExpType, 1, 25) POType, 
	case wf.iStatus when 3 then 'Cancel' else '' end CancelFlag, 
	datediff(dd, po.dtOrderedDate, po.dtReqDate) TermsCode, 
	ct.sCode ContractID, 
	'' BuyerUserID, 
	substring(po.sRequestedBy, 1, 25) RequisitionerUserID, 
	substring(ua.uName, 1, 25) POApproverUserID, 
	substring(po.sRequestedBy, 1, 25) CreationUserID, 
	substring(um.uName, 1, 25) ModifyUserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	left outer join intCurrency_Info bc on
		po.hTranCurrency = bc.hMy
	left outer join pmUser um on
		po.hUserModifiedBy = um.hMy
	left outer join WF_Tran_Header wf on
		wf.hMy = (select max(wf2.hMy) from WF_Tran_Header wf2 where
			wf2.iType = 26 and
			PO.hMy = wf2.hRecord)
	left outer join pmUser ua on
		wf.hUserComplete = ua.hMy
	left outer join Contract ct on
		po.hVDCContract = ct.hMy
Where
	1=1

Order By
	po.hMy desc