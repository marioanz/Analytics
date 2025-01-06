Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	t3.sDateOccurred InvoiceEntryDate, 
	t3.sDateCreated InvoiceGLDate, 
	t3.sTotalAmount InvoiceAmount, 
	0 FreightAmount, 
	sum(d.cVatAmount + d.cVATAmount2) TaxAmount, 
	0 DiscountAmount, 
	upper(bc.sCode) InvoiceCurrency, 
	case
		when t3.iType = 15
		then 'UnPosted'
		when t3.sTotalAmount = t3.sAmountPaid
		then 'Fully Paid'
		when t3.VoidED = -1
		then 'Reversed'
		when t3.VoidER = -1
		then 'Reversal'
		else 'Posted'
		end InvoiceStatus, 
	case when t3.VoidER = -1 then null else datediff(dd, t3.sDateOccurred, t3.sOtherDate1) end TermsCode, 
	'' TermsDesc, 
	tb.hMy - 1100000000 BatchID, 
	'' BusinessUnitNumber, 
	'' BusinessUnitName, 
	'' DivisionNumber, 
	'' DivisionName, 
	'' DepartmentNumber, 
	'' DepartmentName, 
	substring(isnull(isnull(ua.uName, ua2.uName), ua3.uName), 1, 25) InvoiceApproverUserID, 
	isnull(isnull(wf.dtComplete, tb.uPostDate), t3.sDateCreated) ApprovalDate, 
	substring(uc.uName, 1, 25) CreationUserID, 
	substring(um.uName, 1, 25) ModifyUserID 
From
	Trans t3
	inner join Person pr on
		t3.hPerson = pr.hMy
	left outer join Trans tb on
		t3.hParent2 = tb.hMy	
	left outer join pmUser uc on
		t3.hUserCreatedBy = uc.hMy
	left outer join pmUser um on
		t3.hUserModifiedBy = um.hMy
	inner join Detail d on
		t3.hMy = d.hInvOrRec
	left outer join intCurrency_Info bc on
		t3.hBaseCurrency = bc.hMy
	left outer join GLInvRegTrans ir on
		t3.hMy = ir.hPayable 
	left outer join WF_Tran_Header wf on
		wf.hMy = (select max(wf2.hMy) from WF_Tran_Header wf2 where
			wf2.iType = 20003 and
			IR.hMy = wf2.hRecord)
	left outer join pmUser ua on
		wf.hUserComplete = ua.hMy
	left outer join pmUser ua2 on
		wf.hMy is null and
		t3.iType = 3 and
		tb.hUserModifiedBy = ua2.hMy
	left outer join pmUser ua3 on
		ua2.hMy is null and
		t3.hUserCreatedBy = ua3.hMy
Where
	t3.iType in (3, 15) and
	substring(convert(varchar, t3.hMy), 1, 1) = '3'

Group By
	t3.uRef, 
	t3.sDateOccurred, 
	pr.uCode, 
	t3.hMy, 
	t3.sDateOccurred, 
	t3.sDateCreated, 
	t3.sTotalAmount, 
	bc.sCode, 
	t3.iType, 
	t3.sAmountPaid, 
	t3.VoidED,
	t3.VoidER, 
	t3.sOtherDate1, 
	tb.hMy, 
	ua.uName, 
	ua2.uName, 
	ua3.uName, 
	wf.dtComplete, 
	tb.uPostDate, 
	t3.sDateCreated, 
	uc.uName, 
	um.uName
Order By
	t3.hMy desc