Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	d.hMy InvoiceLineNumber, 
	d.sAmount LineItemAmount, 
	upper(bc.sCode) LineItemCurrency, 
	null LineItemQuantity, 
	a.sCode GLAccountString, 
	a.sCode GLAccountCode, 
	substring(a.sDesc, 1, 255) GLDescription, 
	case when po.hMy is null then '' else 'Yardi ' + @sSource end POSystem, 
	po.sCode PONumber, 
	po.dtDateIn PODate, 
	pod.hMy POLineNumber, 
	p.sCode CostCenterCd, 
	substring(p.sAddr1, 1, 55) CostCenterDesc, 
	c.sCode ActivityID, 
	substring(c.sDesc, 1, 55) ActivityDesc, 
	j.sCode ProjectID, 
	substring(j.sBriefDesc, 1, 55) ProjectDesc, 
	substring(d.sNotes, 1, 255) LineItemDesc
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	inner join Detail d on
		t3.hMy = d.hInvOrRec
	inner join Property p on
		d.hProp = p.hMy
	inner join Acct a on
		d.hAcct = a.hMy
	left outer join intCurrency_Info bc on
		t3.hBaseCurrency = bc.hMy
	left outer join mm2PODet pod on
		d.hPODet = pod.hMy
	left outer join mm2PO po on
		pod.hPO = po.hMy
	left outer join Job j on
		d.hJob = j.hMy
	left outer join Category c on
		d.hCateg = c.hMy
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

Order By
	t3.hMy desc, 
	d.hMy