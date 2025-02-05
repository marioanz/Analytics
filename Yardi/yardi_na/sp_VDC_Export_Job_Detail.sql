USE [yardi_na]
GO

/****** Object:  StoredProcedure [dbo].[sp_VDC_Export_Job_Detail]    Script Date: 2/26/2024 3:32:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 Create Procedure [dbo].[sp_VDC_Export_Job_Detail] (@sPropList varchar(8)) As
 /*
 	sp_VDC_Export_Job_Detail
 	
 	2021-03-09 Shannon Watts of The Watts Company creates for Vantage Data Centers Management Company, LLC
 	This Stored Procedure will render a dataset per the rs_VDC_Job_Cost_Detail.txt dated 2021-03-09, 
 		for Anaplan (with a header row, so all columns are formatted to text)
 		for a Task Step to be scheduled via Task Runner
 		without any filtration
 		with an iCtrl value per row and an hPODet PO Detail # 
 	2021-03-30 SSW revises for sPropList Variable for the Stored Procedure
 	2021-05-04 SSW removes commas from sPName, sJName, sJAddr, sPrName, sCDesc and sNotes 
 	2021-05-04 SSW revises for null JobDetl values
 	2021-06-08 JK closes.
 	2021-06-22 SSW revises to convert all amounts on non-USD Properties to USD via current oanda spot Rate
 	2021-11-30 JK closes.
 	2021-11-30 SSW revises
 		remove conversion to USD
 		add sCurrency
 		add Account sACode
 		add Cash Books Amount dCash
 		add sPODesc
 		add sVDCSource
 		revise to look to CaParam.hRetentionAcct for any DB instead of being hard coded for VDC_NA DB
 	2021-12-16 SSW revises
 		trim all larger string fields down to 200 characters (sPName, sJName, sJAddr, sContract, sPrName, sCDesc, sNotes and sPODesc)
 		revise for issue with Check K- Ctrl Cash Payments
 	2022-01-25 JK and AA close.
 	2022-01-26 SSW adds dForecast from Forecast Monthly Job Budgets (cmMonthBud) per highest numbered Approved Forecast Forecast#
 	2022-01-27 SSW adds sForecastNum
 	2022-02-09 JK closes.
 	2022-02-15 SSW revises dCash to include JCA Job Cost Adjustments.
 	2022-02-15 JK closes.
 	2022-02-23 SSW adds dtExported, look to 'VDC_Export' LookUp for Source instead of the abandoned Param.sVDCSource
 	2022-03-01 AA closes.
 	2022-03-04 SSW revises for issue with Check Payment hPerson join via Trans.hAccrualAcct
 	2022-03-04 JK closes.
 	2022-03-14 SSW revises dCash for sign swap on Receipts.
 	2022-03-23 JK closes.
 	2022-03-29 SSW revises sACode to have a dash in it.
 	2022-03-29 JK closes.
 	2022-09-21 SSW revises to include Jobs that do not have Properties
 	2022-09-21 JK closes.
 Exec sp_VDC_Export_Job_Detail '.Yield'
 */
 Begin 
 Declare @sSource varchar(64)
 Set @sSource = isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')
 SELECT
 	isnull(rtrim(x.sPCode), '') sPCode, 
 	substring(replace(isnull(x.sPName, ''), rtrim(', '), ''), 1, 200) sPName, 
 	isnull(x.sPState, '') sPState, 
 	isnull(rtrim(x.sPCountry), '') sPCountry, 
 	isnull(rtrim(x.sJCode), '') sJCode, 
 	substring(replace(isnull(x.sJName, ''), rtrim(', '), ''), 1, 200) sJName, 
 	substring(replace(isnull(x.sJAddr, ''), rtrim(', '), ''), 1, 200) sJAddr, 
 	isnull(x.sJStatus, '') sJStatus, 
 	isnull(rtrim(x.sJType), '') sJType, 
 	x.dtJStart, 
 	x.dtJEnd, 
 	isnull(x.dJMegaWatts, 0) dJMegaWatts, 
 	isnull(rtrim(x.sProjectManager), '') sProjectManager, 
 	substring(isnull(rtrim(x.sContract), ''), 1, 200) sContract, 
 	isnull(rtrim(x.sPrCode), '') sPrCode, 
 	substring(replace(isnull(x.sPrName, ''), rtrim(', '), ''), 1, 200) sPrName, 
 	isnull(rtrim(x.sCCode), '') sCCode, 
 	substring(replace(isnull(x.sCDesc, ''), rtrim(', '), ''), 1, 200) sCDesc, 
 	isnull(rtrim(x.sPO), '') sPO, 
 	isnull(x.hPODet, 0) hPODet, 
 	isnull(x.sCtrl, '') sCtrl, 
 	x.dtDate, 
 	x.dtMonth, 
 	isnull(x.dBud, 0) dBud, 
 	isnull(x.dRev, 0) dRev, 
 	isnull(x.dRevBud, 0) dRevBud, 
 	isnull(x.dBid, 0) dBid, 
 	isnull(x.dPO, 0) dPO, 
 	isnull(x.dAct, 0) dAct, 
 	isnull(x.dRetention, 0) dRetention, 
 	isnull(x.dNet, 0) dNet, 
 	substring(isnull(
 		replace(replace(replace(replace(replace(
 		x.sNotes
 		, rtrim(', '), '')
 		, ' ' + ' ', '')
 		, '"', '')
 		, char(10), ' ')
 		, char(13), ' ')
 		, ''), 1, 200) sNotes, 
 	x.hProp, 
 	@sSource sVDCSource, 
 	fc.sCode sCurrency, 
 	isnull(rtrim(substring(x.sACode, 1, 5) + '-' + substring(x.sACode, 6, 3)), '') sACode, 
 	isnull(x.dCash, 0) dCash, 
 	substring(isnull(
 		replace(replace(replace(replace(replace(
 		x.sPODesc
 		, rtrim(', '), '')
 		, ' ' + ' ', '')
 		, '"', '')
 		, char(10), ' ')
 		, char(13), ' ')
 		, ''), 1, 200) sPODesc, 
 	x.sForecastNum, 
 	isnull(x.dForecast, 0) dForecast	
 INTO
 	#X
 FROM
 (Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	ct.sCode sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	'' sPO, 
 	0 hPODet, 
 	'' sCtrl, 
 	null dtDate, 
 	null dtMonth, 
 	sum(isnull(jd.sBudget, 0)) dBud, 
 	sum(isnull(jd.sRevision, 0)) dRev, 
 	sum(isnull(jd.sBudget, 0) + isnull(jd.sRevision, 0)) dRevBud, 
 	sum(isnull(jd.sBid, 0)) dBid, 
 	0 dPO, 
 	0 dAct, 
 	0 dRetention, 
 	0 dNet, 
 	jd.sDesc sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	0 dCash, 
 	'' sPODesc, 
 	'' sForecastNum, 
 	0 dForecast
 From
 	Job j
 	left outer join Property p on
 		j.hProperty = p.hMy
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	inner join JobDetl jd on
 		j.hMy = jd.hJob
 	left outer join Contract ct on
 		jd.hContract = ct.hMy
 	left outer join Person pr on
 		ct.hVendor = pr.hMy
 	inner join Category c on
 		jd.hCateg = c.hMy
 	left outer join Acct a on
 		a.hMy = case
 			when isnull(j.hGLAcct, 0) <> 0
 			then j.hGLAcct
 			when isnull(c.hPayAcct, 0) <> 0
 			then c.hPayAcct
 			else 0
 			end	 
 Where
 	isnull(j.hProperty, 0) in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = ''
 		union all 
 		select 0)
 Group By
 	p.sCode, 
 	p.sAddr1, 
 	p.sState, 
 	ci.sCode, 
 	j.sCode, 
 	j.sBriefDesc, 
 	j.sSiteAddr, 
 	s.sStatus, 
 	jt.sCode, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate), 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate), 
 	j.dCommPercent, 
 	pm.sCode, 
 	ct.sCode, 
 	pr.uCode, 
 	pr.uLastName, 
 	c.sCode, 
 	c.sDesc, 
 	jd.sDesc, 
 	p.hMy, 
 	a.sCode
 Having
 	sum(isnull(jd.sBudget, 0)) <> 0 OR
 	sum(isnull(jd.sRevision, 0)) <> 0 OR
 	sum(isnull(jd.sBid, 0)) <> 0
 UNION ALL
 Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	ct.sCode sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	'' sPO, 
 	0 hPODet, 
 	'' sCtrl, 
 	mb.dtMMYY dtDate, 
 	mb.dtMMYY dtMonth, 
 	0 dBud, 
 	0 dRev, 
 	0 dRevBud, 
 	0 dBid, 
 	0 dPO, 
 	0 dAct, 
 	0 dRetention, 
 	0 dNet, 
 	'' sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	0 dCash, 
 	'' sPODesc, 
 	convert(varchar, f.dForecastNum) sForecastNum, 
 	isnull(mb.cBudget, 0) + isnull(mb.cRevision, 0) dForecast
 From
 	Job j
 	left outer join Property p on
 		j.hProperty = p.hMy
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	inner join cmForecast f on
 		j.hMy = f.hJob and
 		f.iStatus = -1 /*Approved*/ and
 		f.dForecastNum = (select max(f2.dForecastNum) from cmForecast f2 where
 			J.hMy = f2.hJob and
 			f2.iStatus = -1)
 	inner join cmMonthBud mb on
 		j.hMy = mb.hJob and
 		f.hMy = mb.hForecast and
 		isnull(mb.cBudget, 0) + isnull(mb.cRevision, 0) <> 0		
 	left outer join Contract ct on
 		mb.hContract = ct.hMy
 	left outer join Person pr on
 		ct.hVendor = pr.hMy
 	inner join Category c on
 		mb.hCateg = c.hMy
 	left outer join Acct a on
 		a.hMy = case
 			when isnull(j.hGLAcct, 0) <> 0
 			then j.hGLAcct
 			when isnull(c.hPayAcct, 0) <> 0
 			then c.hPayAcct
 			else 0
 			end	 
 Where
 	isnull(j.hProperty, 0) in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = ''
 		union all 
 		select 0)
 UNION ALL
 Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	ct.sCode sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	po.sCode sPO, 
 	pod.hMy hPODet, 
 	'' sCtrl, 
 	po.dtOrderedDate dtDate, 
 	po.dtOrderedDate dtMonth, 
 	0 dBud, 
 	0 dRev, 
 	0 dRevBud, 
 	0 dBid, 
 	pod.dTotalCost dPO, 
 	0 dAct, 
 	0 dRetention, 
 	0 dNet, 
 	pod.sDesc sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	0 dCash, 
 	po.sDesc sPODesc, 
 	'' sForecastNum, 
 	0 dForecast
 From
 	mm2PODet pod
 	inner join mm2PO po on
 		pod.hPO = po.hMy
 	inner join Job j on
 		pod.hJob = j.hMy
 	inner join Property p on
 		pod.hProp= p.hMy
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	left outer join Category c on
 		pod.hJobCategory = c.hMy 
 	left outer join Contract ct on
 		pod.hContract = ct.hMy
 	left outer join Person pr on
 		po.hVendor = pr.hMy
 	left outer join Acct a on
 		pod.hPayAcct = a.hMy	
 Where
 	p.hMy in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = '')
 UNION ALL
 Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	ct.sCode sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	po.sCode sPO, 
 	isnull(pod.hMy, 0) hPODet, 
 	case tr.iType
 		when 3
 		then 'P-' + convert(varchar, tr.hMy - 300000000)
 		when 6
 		then 'R-' + convert(varchar, tr.hMy - 600000000)
 		when 10
 		then 'J-' + convert(varchar, tr.hMy - 1000000000)
 		when 17
 		then 'JCA-' + convert(varchar, tr.hMy - 1700000000)
 		else convert(varchar, tr.hMy)
 		end sCtrl, 
 	case when tr.iType in (10, 17) then tr.sOtherDate1 else tr.sDateOccurred end dtDate, 
 	tr.uPostDate dtMonth, 
 	0 dBud, 
 	0 dRev, 
 	0 dRevBud, 
 	0 dBid, 
 	0 dPO, 
 	sum(case
 		when tr.iType in (3, 17) and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000) and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%' and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		else 0
 		end) dAct, 
 	sum(case
 		when tr.iType in (3, 17) and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000) and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%' and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		else 0
 		end) dRetention, 
 	sum(case
 		when tr.iType in (3, 17)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%'
 		then d.sAmount
 		else 0
 		end) dNet, 
 	d.sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	sum(case
 		when tr.iType = 6
 		then -d.sAmount
 		when tr.iType = 17
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (0, 1000)
 		then d.sAmount
 		else 0 
 		end) dCash, 
 	po.sDesc sPODesc, 
 	'' sForecastNum, 
 	0 dForecast
 From
 	Trans tr
 	inner join Detail d on
 		tr.hMy = d.hInvOrRec
 	inner join Job j on
 		d.hJob = j.hMy
 	left outer join mm2PODet pod on
 		d.hPODet = pod.hMy
 	left outer join mm2PO po on
 		pod.hPO = po.hMy
 	left outer join Property p on
 		 p.hMy = case isnull(d.hProp, 0) when 0 then j.hProperty else d.hProp end
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	left outer join Category c on
 		d.hCateg = c.hMy 
 	left outer join Contract ct on
 		d.hContract = ct.hMy
 	left outer join Person pr on
 		tr.hPerson = pr.hMy 
 	left outer join Acct a on
 		d.hAcct = a.hMy
 	left outer join CaParam cp on
 		cp.hChart = 0
 Where
 	tr.iType in (3, 6, 10, 17) and
 	isnull(j.hProperty, 0) in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = ''
 		union all 
 		select 0)
 Group By
 	p.sCode, 
 	p.sAddr1, 
 	p.sState, 
 	ci.sCode, 
 	j.sCode, 
 	j.sBriefDesc, 
 	j.sSiteAddr, 
 	s.sStatus, 
 	jt.sCode, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate), 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate), 
 	j.dCommPercent, 
 	pm.sCode, 
 	ct.sCode, 
 	pr.uCode, 
 	pr.uLastName, 
 	c.sCode, 
 	c.sDesc, 
 	po.sCode, 
 	pod.hMy, 
 	tr.iType, 
 	tr.hMy, 
 	tr.sOtherDate1, 
 	tr.sDateOccurred, 
 	tr.uPostDate, 
 	d.sNotes, 
 	p.hMy, 
 	a.sCode, 
 	po.sDesc
 Having
 	sum(case
 		when tr.iType in (3, 17) and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000) and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%' and isnull(d.hAcct, 0) <> isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		else 0
 		end) <> 0 OR
 	sum(case
 		when tr.iType in (3, 17) and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000) and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%' and isnull(d.hAcct, 0) = isnull(cp.hRetentionAcct, 0)
 		then d.sAmount
 		else 0
 		end) <> 0 OR
 	sum(case
 		when tr.iType in (3, 17)
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (1, 1000)
 		then d.sAmount
 		when tr.iType = 6 and isnull(d.hChkOrChg, 0) not like '7%'
 		then d.sAmount
 		else 0
 		end) <> 0 OR
 	sum(case
 		when tr.iType = 6
 		then -d.sAmount
 		when tr.iType = 17
 		then d.sAmount
 		when tr.iType = 10 and tr.iType2 in (0, 1000)
 		then d.sAmount
 		else 0 
 		end) <> 0
 UNION ALL
 Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	ct.sCode sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	po.sCode sPO, 
 	isnull(pod.hMy, 0) hPODet, 
 	'K-' + convert(varchar, tr.hMy - 200000000) sCtrl, 
 	tr.sDateOccurred dtDate, 
 	tr.uPostDate dtMonth, 
 	0 dBud, 
 	0 dRev, 
 	0 dRevBud, 
 	0 dBid, 
 	0 dPO, 
 	0 dAct, 
 	0 dRetention, 
 	0 dNet, 
 	d.sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	sum(d.sAmount) dCash, 
 	po.sDesc sPODesc, 
 	'' sForecastNum, 
 	0 dForecast
 From
 	Trans tr
 	inner join Detail d on
 		tr.hMy = d.hChkOrChg
 	inner join Job j on
 		d.hJob = j.hMy
 	left outer join mm2PODet pod on
 		d.hPODet = pod.hMy
 	left outer join mm2PO po on
 		pod.hPO = po.hMy
 	inner join Property p on
 		 d.hProp = p.hMy
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	left outer join Category c on
 		d.hCateg = c.hMy 
 	left outer join Contract ct on
 		d.hContract = ct.hMy
 	left outer join Person pr on
 		tr.hAccrualAcct = pr.hMy
 	left outer join Acct a on
 		d.hAcct = a.hMy
 	left outer join CaParam cp on
 		cp.hChart = 0
 Where
 	tr.iType = 2 and
 	p.hMy in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = '')
 Group By
 	p.sCode, 
 	p.sAddr1, 
 	p.sState, 
 	ci.sCode, 
 	j.sCode, 
 	j.sBriefDesc, 
 	j.sSiteAddr, 
 	s.sStatus, 
 	jt.sCode, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate), 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate), 
 	j.dCommPercent, 
 	pm.sCode, 
 	ct.sCode, 
 	pr.uCode, 
 	pr.uLastName, 
 	c.sCode, 
 	c.sDesc, 
 	po.sCode, 
 	pod.hMy, 
 	tr.hMy, 
 	tr.sDateOccurred, 
 	tr.uPostDate, 
 	d.sNotes, 
 	p.hMy, 
 	a.sCode, 
 	po.sDesc
 Having
 	sum(d.sAmount) <> 0
 UNION ALL
 Select
 	p.sCode sPCode, 
 	p.sAddr1 sPName, 
 	p.sState sPState, 
 	upper(ci.sCode) sPCountry, 
 	j.sCode sJCode, 
 	j.sBriefDesc sJName, 
 	j.sSiteAddr sJAddr, 
 	s.sStatus sJStatus, 
 	jt.sCode sJType, 
 	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
 	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJEnd, 
 	j.dCommPercent dJMegaWatts, 
 	pm.sCode sProjectManager, 
 	'' sContract, 
 	pr.uCode sPrCode, 
 	pr.uLastName sPrName, 
 	c.sCode sCCode, 
 	c.sDesc sCDesc, 
 	'' sPO, 
 	0 hPODet, 
 	'C-' + convert(varchar, tr.hMy - 700000000) sCtrl, 
 	tr.sDateOccurred dtDate, 
 	tr.uPostDate dtMonth, 
 	0 dBud, 
 	0 dRev, 
 	0 dRevBud, 
 	0 dBid, 
 	0 dPO, 
 	-case tr.hOffsetAcct when isnull(cp.hRetentionAcct, 0) then 0.00 else tr.sTotalAmount end dAct, 
 	-case tr.hOffsetAcct when isnull(cp.hRetentionAcct, 0) then tr.sTotalAmount else 0.00 end dRetention, 
 	-tr.sTotalAmount dNet, 
 	tr.sNotes, 
 	p.hMy hProp, 
 	a.sCode sACode, 
 	0 dCash, 
 	'' sPODesc, 
 	'' sForecastNum, 
 	0 dForecast
 From
 	Trans tr
 	inner join Detail d on
 		tr.hMy = d.hInvOrRec
 	inner join Job j on
 		tr.hJob = j.hMy
 	inner join Property p on
 		 tr.hProp = p.hMy 
 	left outer join Country_Info ci on
 		p.hCountry = ci.hMy
 	left outer join VDC_Job_Status s on
 		j.iStatus = s.iStatus
 	left outer join JobType jt on
 		j.iJobType = jt.hMy
 	left outer join CMPMUser pmx on
 		j.hProjectMgr = pmx.hMy
 	left outer join pmUser pm on
 		pmx.hPMUser = pm.hMy
 	left outer join Category c on
 		tr.hCateg = c.hMy 
 	left outer join Person pr on
 		tr.hPerson = pr.hMy
 	left outer join Acct a on
 		tr.hOffsetAcct = a.hMy
 	left outer join CaParam cp on
 		cp.hChart = 0
 Where
 	tr.iType = 7 and
 	p.hMy in (select lp.hProperty from Property px, ListProp2 lp where 
 			px.sCode = @sPropList and 
 			px.hMy = lp.hPropList and
 			P.hMy = lp.hProperty
 		union all 
 		select P.hMy where @sPropList = '')
 ) AS X
 	left outer join intProp ip on
 		x.hProp = ip.hProp
 	left outer join intCurrency_Info fc on 
 		ip.hCurrency = fc.hMy
 ORDER BY
 	1, 5, 17, 22, 21, 15, 19, 20
 Alter Table #X Add iCtrl numeric identity
 SELECT
 	iCtrl, 
 	sPCode, 
 	sPName, 
 	sPState, 
 	sPCountry, 
 	sJCode, 
 	sJName, 
 	sJAddr, 
 	sJStatus, 
 	sJType, 
 	dtJStart, 
 	dtJEnd, 
 	dJMegaWatts, 
 	sProjectManager, 
 	sContract, 
 	sPrCode, 
 	sPrName, 
 	sCCode, 
 	sCDesc, 
 	sPO, 
 	hPODet, 
 	sCtrl, 
 	dtDate, 
 	dtMonth, 
 	dBud, 
 	dRev, 
 	dRevBud, 
 	dBid, 
 	dPO, 
 	dAct, 
 	dRetention, 
 	dNet, 
 	sNotes, 
 	sVDCSource, 
 	sCurrency, 
 	sACode, 
 	dCash, 
 	sPODesc, 
 	sForecastNum, 
 	dForecast, 
 	dtExported
 FROM
 	(Select 
 		0 iSort, 
 		'Export Control#' iCtrl, 
 		'Property' sPCode, 
 		'Property Name' sPName, 
 		'State' sPState, 
 		'Country' sPCountry, 
 		'Job' sJCode, 
 		'Job Name' sJName, 
 		'Job Address' sJAddr, 
 		'Job Status' sJStatus, 
 		'Job Type' sJType, 
 		'Job Start' dtJStart, 
 		'Job Completion' dtJEnd, 
 		'Megawatts' dJMegaWatts, 
 		'Project Manager' sProjectManager, 
 		'Contract' sContract, 
 		'Vendor Code' sPrCode, 
 		'Vendor Name' sPrName, 
 		'Category Code' sCCode, 
 		'Category Description' sCDesc, 
 		'PO #' sPO, 
 		'PO Detail #' hPODet, 
 		'Ctrl #' sCtrl, 
 		'Date' dtDate, 
 		'Period' dtMonth, 
 		'Budget' dBud, 
 		'Revision' dRev, 
 		'RevBudget' dRevBud, 
 		'Commitment' dBid, 
 		'Purchase Orders' dPO, 
 		'Trans Amount' dAct, 
 		'Retention' dRetention, 
 		'Net' dNet, 
 		'Notes' sNotes, 
 		'VDC Source' sVDCSource, 
 		'Currency' sCurrency, 
 		'Account' sACode, 
 		'Cash Books Amount' dCash, 
 		'PO Description' sPODesc, 
 		'Forecast Number' sForecastNum, 
 		'Forecast Amount' dForecast, 
 		'DateTime Exported' dtExported
 	UNION ALL
 	Select 
 		iCtrl iSort, 
 		convert(varchar, iCtrl) iCtrl, 
 		sPCode, 
 		sPName, 
 		sPState, 
 		sPCountry, 
 		sJCode, 
 		sJName, 
 		sJAddr, 
 		sJStatus, 
 		sJType, 
 		isnull(format(dtJStart, 'yyyy-MM-dd'), ''), 
 		isnull(format(dtJEnd, 'yyyy-MM-dd'), ''), 
 		convert(varchar, dJMegaWatts), 
 		sProjectManager, 
 		sContract, 
 		sPrCode, 
 		sPrName, 
 		sCCode, 
 		sCDesc, 
 		sPO, 
 		convert(varchar, hPODet), 
 		sCtrl, 
 		isnull(format(dtDate, 'yyyy-MM-dd'), ''), 
 		isnull(format(dtMonth, 'yyyy-MM'), ''), 
 		convert(varchar, dBud), 
 		convert(varchar, dRev), 
 		convert(varchar, dRevBud), 
 		convert(varchar, dBid), 
 		convert(varchar, dPO), 
 		convert(varchar, dAct), 
 		convert(varchar, dRetention), 
 		convert(varchar, dNet), 
 		sNotes, 
 		sVDCSource, 
 		sCurrency, 
 		sACode, 
 		convert(varchar, dCash), 
 		sPODesc, 
 		sForecastNum, 
 		convert(varchar, dForecast), 
 		isnull(format(getdate(), 'yyyy-MM-dd HH:mm.ss'), '') dtExported
 	From 
 		#X 
 ) AS O
 ORDER BY 
 	iSort
 End
GO


