Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource VendorSystem
	,pr.uCode VendorID, 
	pr.hMy VendorSequence, 
	substring(ltrim(pr.sFirstName + ' ' + pr.uLastName), 1, 55) VendorName, 
	substring(case 
		when v.bIsEmployee = 1 
		then 'Employee' 
		when pr.iPersonType = 1
		then 'Lease'
		when pr.iPersonType = 2
		then 'Legal Entity'
		when pr.iPersonType = 79
		then 'Employee' 
		when pr.iPersonType = 478
		then 'Customer' 
		else v.sExpenseType 
		end, 1, 25) VendorType, 
	Case v.iStatus
		When 0
		Then 'Pending'
		When 1 
		Then 'Approved'
		When 2
		Then 'Rejected' 
		When 3
		Then 'InActive' 
		Else convert(varchar, v.iStatus, 0)
		End VendorStatus, 
	substring(pr.sAddr1, 1, 55) VendorAddress1, 
	substring(pr.sAddr2, 1, 55) VendorAddress2, 
	substring(pr.sCity, 1, 55) VendorCity, 
	substring(pr.sState, 1, 55) VendorState, 
	substring(pr.sZipCode, 1, 25) VendorZip, 
	upper(c.sCode) VendorCountry, 
	substring(pr.sPhoneNum0, 1, 55) VendorPhone, 
	substring(pr.sFedID, 1, 25) FederalID, 
	case when isnull(pr.bACH, 0) = 0 then 'Check' else 'EFT' end DefaultPaymentType, 
	upper(cu.sCode) DefaultCurrency, 
	v.iPaymentTerms DefaultTermsCode, 
	case v.bDueDateEndOfNextMonth when -1 then 'Due End of Next Month' else convert(varchar, v.iPaymentTerms) + ' Payment Terms' end DefaultTermsDesc, 	
	pr.dtCreated CreationDate, 
	v.dtInActive InactiveDate, 
	case v.bInActive when 1 then -1 else 0 end ExcludedVendor, 
	substring(uc.uName, 1, 25) CreationUserID, 
	substring(um.uName, 1, 25) ModifyUserID 
From
	Person pr
	left outer join Country_Info c on
		pr.hCountry = c.hMy
	left outer join Vendor v on
		pr.hMy = v.hMyPerson
	left outer join intCurrency_Info cu on
		v.hCurrency = cu.hMy
	left outer join pmUser uc on
		pr.hUserCreatedBy = uc.hMy
	left outer join pmUser um on
		pr.hUserModifiedBy = um.hMy
Where
	pr.hMy in (select V.hMyPerson
		union all
		select t3.hPerson from Trans t3 where
			t3.iType = 3 and
			PR.iPersonType <> 5 and
			PR.hMy = t3.hPerson)
Order By
	2