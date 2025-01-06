Declare @sSource varchar(64)

Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')

Select
	'Yardi ' + @sSource POSystem, 
	po.sCode PONumber, 
	po.dtOrderedDate PODate, 
	pod.hMy POLineNumber, 
	'Yardi ' + @sSource VendorSystem, 
	pr.uCode VendorID, 
	pod.iQtyOrdered LineItemQty, 
	pod.dTotalCost LineItemUnitCost, 
	upper(bc.sCode) LineItemCurrency, 
	substring(s.sQuantityUnits, 1, 25) UnitOfMeasure, 
	substring(s.sModel, 1, 55) ProductNumber, 
	null ManufacturerNumber, 
	substring(s.sDesc, 1, 255) ProductDesc, 
	null PromisedDate, 
	pod.dtReceivedDate ExpectedDate, 
	substring(pod.sDesc, 1, 55) LineItemDesc
From
	mm2PO po 
	left outer join Person pr on
		po.hVendor = pr.hMy
	left outer join intCurrency_Info bc on
		po.hTranCurrency = bc.hMy
	inner join mm2podet pod on
		po.hMy = pod.hPO
	left outer join mm2Stock s on
		pod.hStock = s.hMy
Where
	1=1

Order By
	po.hMy desc, 
	pod.hMy