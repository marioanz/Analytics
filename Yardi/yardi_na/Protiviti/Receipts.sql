Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource ReceiptSystem, 
	pod.hMy ReceiptNumber, 
	pod.dtReceivedDate ReceiptDate, 
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	pod.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	pod.iQtyReceived ReceiptQuantity, 
	substring(po.sRequestedBy, 1, 25) CreationUserID, 
	substring(ur.uName, 1, 25) ModifyUserID 
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	inner join mm2podet pod on
		po.hMy = pod.hPO and 
		pod.dtReceivedDate is not null
	left outer join pmUser ur on
		pod.hUserReceivedBy = ur.hMy
Where
	1=1

Order By
	pod.dtReceivedDate desc, 
	pod.hMy