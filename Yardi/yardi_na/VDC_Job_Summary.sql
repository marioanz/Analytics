Select
	p.sCode sPCode, 
	p.sAddr1 sPName, 
	j.sCode sJCode, 
	j.sBriefDesc sJName, 
	s.sStatus sJStatus, 
	jt.sCode sJT, 
	j.dtOrigBudget, 
	isnull(isnull(j.dtStartActual, j.dtStartRevised), j.sReqDate) dtJStart, 
	isnull(isnull(j.sActualDate, j.sCompDate), j.sSchedDate) dtJCompletion, 
	j.dCommPercent, 
	j.sSiteAddr, 
	substring(m.sText, 1, 64) sRemarks, 
	substring(a.sCode, 1, 5) + '-' + substring(a.sCode, 6, 3) sAcct, 
	x.dBudget, 
	x.dRevision, 
	x.dRevBudget, 
	x.dCOs, 
	x.dTotalBudget, 
	x.dCommitment, 
	x.dCommitmentCOs, 
	x.dRevisedCommitment, 
	pox.dPurchaseOrder, 
	isnull(x.dRevisedCommitment, 0) + isnull(pox.dPurchaseOrder, 0) dTotalCommitment, 
	x.dPendingCommitment, 
	x.dTI, 
	x.dInvoiced, 
	x.dTotalBudget - x.dInvoiced dCostToComplete, 
	x.dDrawBudget, 
	x.dForecast, 
	x.dProjectedFinalCost, 
	upper(c.sCode) sCurrency, 
	ltrim(rtrim(pmpr.sFirstName) + ' ' + pmpr.uLastName) sProjectManager, 
	j.sFields0 sVDCBudgetMgr, 
	j.sFields1 sSrApprover
From
	yardi_data.dbo.Job j
	left outer join yardi_data.dbo.Property p on
		j.hProperty = p.hMy
	left outer join yardi_data.dbo.VDC_Job_Status s on
		j.iStatus = s.iStatus
	left outer join yardi_data.dbo.JobType jt on
		j.iJobType = jt.hMy
	left outer join yardi_data.dbo.Memo m on
		m.iFileType = 65 and
		m.iField = 1 and
		j.hMy = m.hFileRcd
	left outer join yardi_data.dbo.Acct a on
		j.hGLAcct = a.hMy
	left outer join yardi_data.dbo.intCurrency_Info c on
		j.hCurrency = c.hMy
	left outer join yardi_data.dbo.CMPMUser pmx on
		j.hProjectMgr = pmx.hMy
	left outer join yardi_data.dbo.prEmployee e on
		pmx.hPMUser = e.hUser
	left outer join yardi_data.dbo.Person pmpr on
		e.hMyPerson = pmpr.hMy
	left outer join (select
			jd.hJob, 
			sum(jd.sBudget) dBudget, 
			sum(jd.sRevision) dRevision, 
			sum(jd.sBudget + jd.sRevision) dRevBudget, 
		0 dCOs, 
			sum(jd.sBudget + jd.sRevision) dTotalBudget, 
			sum(case jd.bRev when -1 then 0 else jd.sBid end) dCommitment, 
			sum(case jd.bRev when -1 then jd.sBid else 0 end) dCommitmentCOs, 
			sum(jd.sBid) dRevisedCommitment, 
		0 dPendingCommitment, 
			sum(convert(numeric, jd.sOther)) dTI, 
			sum(jd.sInvoiced) dInvoiced, 
			sum(jd.cDrawAmt) dDrawBudget, 
			sum(jd.cForecast) dForecast, 
			sum(jd.cProjectedFinalCost) dProjectedFinalCost
		From
			yardi_data.dbo.JobDetl jd
		Group By
			jd.hJob
		) as x on
		j.hMy = x.hJob
	left outer join (select
			pod.hJob, 
			sum(pod.dTotalCost) dPurchaseOrder
		from
			yardi_data.dbo.mm2PODet pod
		where
			isnull(pod.hContract, 0) = 0	
		group by
			pod.hJob
		) as pox on
		j.hMy = pox.hJob
Where
	j.iType = 65
	--#conditions#
Order By
	1, 3
