Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource PaymentSystem, 
	b.sAcctNum PaymentAccount, 
	ltrim(rtrim(t2.uRef)) PaymentNumber, 
	t2.sDateOccurred PaymentDate, 
	'Yardi ' + @sSource InvoiceSystem, 
	substring(t3.uRef, 1, 55) InvoiceNumber, 
	t3.sDateOccurred InvoiceDate, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	'P-' + convert(varchar, t3.hMy - 300000000) InvoiceID, 
	case when t2.VoidER = -1 then 'Void' when t2.bACH = -1 then 'EFT' else 'Check' end PaymentType, 
	case 
		when t2.VoidER = -1 
		then 'Voider'
		when t2.VoidED = -1 
		then 'Voided'
		when t2.bOpen = 0
		then 'Reconciled'
		when t2.BankRec = -1
		then 'Cleared'	
		else 'Outstanding'
		end PaymentStatus, 
	sum(d.sAmount) PaymentAmount, 
	upper(bc.sCode) PaymentCurrency, 
	sum(d.sAmount) InvoiceAppliedAmount, 
	upper(bc.sCode) InvoiceAppliedCurrency, 
	substring(pr.uLastName, 1, 55) PayeeName, 
	ltrim(replace(replace(replace(t2v.sNotes, t2.sNotes, ''), char(10), ' '), char(13), ' ')) VoidReasonCode, 
	t2v.sDateOccurred VoidDate, 
	b.sCode BankCode, 
	substring(uc.uName, 1, 25) CreationUserID, 
	substring(um.uName, 1, 25) ModifyUserID 
From
	Trans t2
	inner join Bank b on
		t2.hPerson = b.hMy
	inner join Detail d on
		t2.hMy = d.hChkOrChg
	inner join Trans t3 on
		d.hInvOrRec = t3.hMy	
	inner join Person pr on
		t3.hPerson = pr.hMy
	left outer join intCurrency_Info bc on
		t3.hBaseCurrency = bc.hMy
	left outer join pmUser uc on
		t2.hUserCreatedBy = uc.hMy
	left outer join pmUser um on
		t2.hUserModifiedBy = um.hMy
	left outer join Trans t2v on
		t2.VoidED = -1 and
		t2.hParent1 = t2v.hMy	
Where
	t2.iType = 2

Group By
	t2.hMy, 
	b.sAcctNum, 
	t2.uRef, 
	t2.sDateOccurred, 
	t3.uRef, 
	t3.sDateOccurred, 
	pr.uCode, 
	t3.hMy, 
	t2.VoidER, 
	t2.bACH, 
	t2.VoidEd, 
	t2.bOpen, 
	t2.BankRec, 
	t2v.sNotes, 
	t2.sNotes, 
	t2v.sDateOccurred, 
	bc.sCode, 
	pr.uLastName, 
	b.sCode, 
	uc.uName, 
	um.uName
Order By
	t2.hMy desc, 
	t3.hMy