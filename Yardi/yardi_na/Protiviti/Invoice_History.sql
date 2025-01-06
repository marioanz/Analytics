Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	t3.hMy ActivityNumber, 
	t3.sDateCreated ActivityDateTime, 
	'Payable Invoice Created' ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	t3.hMy ActivityNumber, 
	t3.sDateModified ActivityDateTime, 
	'Payable Invoice Last Modified' ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3' and
	t3.sDateModified is not null

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	tb.hMy ActivityNumber, 
	tb.uPostDate ActivityDateTime, 
	'Payable Invoice Batch Posted' ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join Trans tb on
		t3.hParent2 = tb.hMy and
		tb.uPostDate is not null
Where
	t3.iType = 3

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	ir.hMy ActivityNumber, 
	ir.sDateCreated ActivityDateTime, 
	'Invoice Register Created' ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join GLInvRegTrans ir on
		t3.hMy = ir.hPayable 
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	wfs.hMy ActivityNumber, 
	wfs.dtStart ActivityDateTime, 
	substring('IR ' + wfs.sName + ' WorkFlow Step Start', 1, 55) ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join GLInvRegTrans ir on
		t3.hMy = ir.hPayable 
	inner join WF_Tran_Step wfs on
		wfs.iType = 20003 and
		ir.hMy = wfs.hRecord
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	wfs.hMy ActivityNumber, 
	wfs.dtComplete ActivityDateTime, 
	substring('IR ' + wfs.sName + ' WorkFlow Step Complete', 1, 55) ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join GLInvRegTrans ir on
		t3.hMy = ir.hPayable 
	inner join WF_Tran_Step wfs on
		wfs.iType = 20003 and
		ir.hMy = wfs.hRecord and
		wfs.dtComplete is not null
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

UNION ALL

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	wf.hMy ActivityNumber, 
	wf.dtComplete ActivityDateTime, 
	'Invoice Register Approved' ActivityName, 
	t3.sTotalAmount InvoiceAmount
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join GLInvRegTrans ir on
		t3.hMy = ir.hPayable 
	inner join WF_Tran_Header wf on
		wf.hMy = (select max(wf2.hMy) from WF_Tran_Header wf2 where
			wf2.iType = 20003 and
			IR.hMy = wf2.hRecord) and
		wf.dtComplete is not null	
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

Order By
	6 desc, 8, 7