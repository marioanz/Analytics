USE [yardi_na]
GO

/****** Object:  StoredProcedure [dbo].[sp_VDC_BI_GLDetail]    Script Date: 2/26/2024 3:39:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 Create Procedure [dbo].[sp_VDC_BI_GLDetail] As
 /*
 	sp_VDC_BI_GLDetail
 	2023-03-22 Shannon Watts of The Watts Company creates for Vantage Data Centers Management Company, LLC
 	
 	This maintains a BI Table to look at the GL Detail, Beginning and Ending Balances and Budgets as one table, 
 		with a calculated dBalance value.
 	It is to later be used by the sp_VDC_Export_GLDetail Stored Procedure.
 	2023-05-24 JW closes per ME#40823, file work done 2023-05-31.
 	2023-05-31 SSW revises VDC_BI_GLDetail Insert to be 4 separate Inserts for performance 
 	2023-05-31 JW closes per ME#52273
 */
 Begin
 Declare 
 	@dtDate	datetime, 
 	@sSource varchar (64)
 Set @dtDate 	= getdate()
 Set @sSource 	= isnull((select min(ltrim(substring(sDesc, 8, 64))) from LookUp where sListName = 'VDC_Export' and sDesc like 'Source:%'), 'Source_TBD')
 Truncate Table VDC_BI_GLDetail
 Insert Into VDC_BI_GLDetail (
 	hProp
 	, sPCode
 	, sPName
 	, dtDate
 	, dtMonth
 	, iBook
 	, sBookName
 	, hPerson
 	, sPrCode
 	, sPrDesc
 	, sCtrl
 	, sRef
 	, sCurrency
 	, dDebit
 	, dCredit
 	, dBalance
 	, dAmount
 	, sRemarks
 	, hAcct
 	, sACode
 	, sADesc
 	, sUtilityMonth
 	, hGLDetail
 	, dBudget
 	, dEndBal
 	, sSource 
 	, dtProcessed)
 Select
 	d.hProp
 	, rtrim(p.sCode) sPCode
 	, substring(replace(isnull(p.sAddr1, ''), rtrim(', '), ''), 1, 200) sPName
 	, d.dtDate
 	, d.dtPost dtMonth
 	, d.iBook
 	, b.BookName sBookName
 	, d.hPerson hPerson
 	, isnull(rtrim(pr.uCode), '') sPrCode
 	, case
 		when pr.hMy is not null
 		then substring(replace(isnull(pr.uLastName, ''), rtrim(', '), ''), 1, 195) + '(' + rtrim(pr.uCode) + ')'
 		else substring(replace(isnull(d.sDesc, ''), rtrim(', '), ''), 1, 200) 
 		end sPrDesc
 	, d.sTranNum sCtrl
 	, substring(replace(isnull(d.sRef, ''), rtrim(', '), ''), 1, 200) sRef
 	, upper(rtrim(fc.sCode)) sCurrency
 	, case when d.dAmount < 0 then d.dAmount else 0 end dDebit
 	, case when d.dAmount > 0 then d.dAmount else 0 end dCredit
 	, 0 dBalance
 	, d.dAmount dAmount
 	, substring(isnull(
 		replace(replace(replace(replace(replace(
 		d.sNotes
 		, rtrim(', '), '')
 		, ' ' + ' ', '')
 		, '"', '')
 		, char(10), ' ')
 		, char(13), ' ')
 		, ''), 1, 200) sRemarks
 	, d.hAcct
 	, rtrim(a.sCode) sACode
 	, substring(replace(isnull(a.sDesc, ''), rtrim(', '), ''), 1, 200) sADesc
 	, isnull(d.sSegment2, '') sUtilityMonth
 	, d.hMy hGLDetail
 	, 0 dBudget
 	, 0 dEndBal
 	, @sSource 
 	, @dtDate dtProcessed
 From
 	GLDetail d
 	inner join ul_Books b on
 		d.iBook = b.Book and
 		b.bBudgetBook = 0
 	inner join Property p on
 		d.hProp = p.hMy
 	inner join Acct a on
 		d.hAcct = a.hMy
 	left outer join Person pr on
 		d.hPerson = pr.hMy
 	left outer join intProp ip on
 		p.hMy = ip.hProp
 	left outer join intCurrency_Info fc on 
 		case isnull(b.Currency, 0) when 0 then ip.hCurrency else isnull(b.Currency, 0) end = fc.hMy
 Where
 	d.iBook <> 0
 Order By
 	2, 5, 20, 7, 4, 11, 23
 Insert Into VDC_BI_GLDetail (
 	hProp
 	, sPCode
 	, sPName
 	, dtDate
 	, dtMonth
 	, iBook
 	, sBookName
 	, hPerson
 	, sPrCode
 	, sPrDesc
 	, sCtrl
 	, sRef
 	, sCurrency
 	, dDebit
 	, dCredit
 	, dBalance
 	, dAmount
 	, sRemarks
 	, hAcct
 	, sACode
 	, sADesc
 	, sUtilityMonth
 	, hGLDetail
 	, dBudget
 	, dEndBal
 	, sSource 
 	, dtProcessed)
 Select
 	t.hPpty hProp
 	, rtrim(p.sCode) sPCode
 	, substring(replace(isnull(p.sAddr1, ''), rtrim(', '), ''), 1, 200) sPName
 	, t.uMonth dtDate
 	, t.uMonth dtMonth
 	, t.iBook
 	, b.BookName sBookName
 	, 0 hPerson
 	, '' sPrCode
 	, 'Beginning Balance' sPrDesc
 	, '' sCtrl
 	, '' sRef
 	, upper(rtrim(fc.sCode)) sCurrency
 	, case when t.sBegin < 0 then t.sBegin else 0 end dDebit
 	, case when t.sBegin > 0 then t.sBegin else 0 end dCredit
 	, t.sBegin dBalance
 	, t.sBegin dAmount
 	, '' sRemarks
 	, t.hAcct
 	, rtrim(a.sCode) sACode
 	, substring(replace(isnull(a.sDesc, ''), rtrim(', '), ''), 1, 200) sADesc
 	, isnull(t.sSegment2, '') sUtilityMonth
 	, 0 hGLDetail
 	, 0 dBudget
 	, 0 dEndBal
 	, @sSource 
 	, @dtDate dtProcessed
 From
 	GLTotal t
 	inner join ul_Books b on
 		t.iBook = b.Book and
 		b.bBudgetBook = 0
 	inner join Property p on
 		t.hPpty = p.hMy
 	inner join Acct a on
 		t.hAcct = a.hMy and
 		a.iRptType = 1 /*Balance Sheet*/
 	left outer join intProp ip on
 		p.hMy = ip.hProp
 	left outer join intCurrency_Info fc on 
 		case isnull(b.Currency, 0) when 0 then ip.hCurrency else isnull(b.Currency, 0) end = fc.hMy
 Where
 	t.iBook <> 0
 Order By
 	2, 5, 20, 7, 4, 11, 23
 Insert Into VDC_BI_GLDetail (
 	hProp
 	, sPCode
 	, sPName
 	, dtDate
 	, dtMonth
 	, iBook
 	, sBookName
 	, hPerson
 	, sPrCode
 	, sPrDesc
 	, sCtrl
 	, sRef
 	, sCurrency
 	, dDebit
 	, dCredit
 	, dBalance
 	, dAmount
 	, sRemarks
 	, hAcct
 	, sACode
 	, sADesc
 	, sUtilityMonth
 	, hGLDetail
 	, dBudget
 	, dEndBal
 	, sSource 
 	, dtProcessed)
 Select
 	t.hPpty hProp
 	, rtrim(p.sCode) sPCode
 	, substring(replace(isnull(p.sAddr1, ''), rtrim(', '), ''), 1, 200) sPName
 	, t.uMonth dtDate
 	, t.uMonth dtMonth
 	, t.iBook
 	, b.BookName sBookName
 	, 0 hPerson
 	, '' sPrCode
 	, 'Ending Balance' sPrDesc
 	, '' sCtrl
 	, '' sRef
 	, upper(rtrim(fc.sCode)) sCurrency
 	, 0 dDebit
 	, 0 dCredit
 	, 0 dBalance
 	, 0 dAmount
 	, '' sRemarks
 	, t.hAcct
 	, rtrim(a.sCode) sACode
 	, substring(replace(isnull(a.sDesc, ''), rtrim(', '), ''), 1, 200) sADesc
 	, isnull(t.sSegment2, '') sUtilityMonth
 	, 0 hGLDetail
 	, 0 dBudget
 	, t.sBegin + t.sMTD dEndBal
 	, @sSource 
 	, @dtDate dtProcessed
 From
 	GLTotal t
 	inner join ul_Books b on
 		t.iBook = b.Book and
 		b.bBudgetBook = 0
 	inner join Property p on
 		t.hPpty = p.hMy
 	inner join Acct a on
 		t.hAcct = a.hMy and
 		a.iRptType = 1 /*Balance Sheet*/
 	left outer join intProp ip on
 		p.hMy = ip.hProp
 	left outer join intCurrency_Info fc on 
 		case isnull(b.Currency, 0) when 0 then ip.hCurrency else isnull(b.Currency, 0) end = fc.hMy
 Where
 	t.iBook <> 0
 Order By
 	2, 5, 20, 7, 4, 11, 23
 Insert Into VDC_BI_GLDetail (
 	hProp
 	, sPCode
 	, sPName
 	, dtDate
 	, dtMonth
 	, iBook
 	, sBookName
 	, hPerson
 	, sPrCode
 	, sPrDesc
 	, sCtrl
 	, sRef
 	, sCurrency
 	, dDebit
 	, dCredit
 	, dBalance
 	, dAmount
 	, sRemarks
 	, hAcct
 	, sACode
 	, sADesc
 	, sUtilityMonth
 	, hGLDetail
 	, dBudget
 	, dEndBal
 	, sSource 
 	, dtProcessed)
 Select
 	t.hPpty hProp
 	, rtrim(p.sCode) sPCode
 	, substring(replace(isnull(p.sAddr1, ''), rtrim(', '), ''), 1, 200) sPName
 	, t.uMonth dtDate
 	, t.uMonth dtMonth
 	, t.iBook
 	, b.BookName sBookName
 	, 0 hPerson
 	, '' sPrCode
 	, 'Budget' sPrDesc
 	, '' sCtrl
 	, '' sRef
 	, upper(rtrim(fc.sCode)) sCurrency
 	, 0 dDebit
 	, 0 dCredit
 	, 0 dBalance
 	, 0 dAmount
 	, '' sRemarks
 	, t.hAcct
 	, rtrim(a.sCode) sACode
 	, substring(replace(isnull(a.sDesc, ''), rtrim(', '), ''), 1, 200) sADesc
 	, isnull(t.sSegment2, '') sUtilityMonth
 	, 0 hGLDetail
 	, t.sBudget * case when a.iNormalBalance = 1 then -1.00 else 1.00 end dBudget
 	, 0 dEndBal
 	, @sSource 
 	, @dtDate dtProcessed
 From
 	GLTotal t
 	inner join ul_Books b on
 		t.iBook = b.Book and
 		b.bBudgetBook = 0
 	inner join Property p on
 		t.hPpty = p.hMy
 	inner join Acct a on
 		t.hAcct = a.hMy
 	left outer join intProp ip on
 		p.hMy = ip.hProp
 	left outer join intCurrency_Info fc on 
 		case isnull(b.Currency, 0) when 0 then ip.hCurrency else isnull(b.Currency, 0) end = fc.hMy
 Where
 	t.iBook <> 0 and 
 	isnull(t.sBudget, 0) <> 0
 Order By
 	2, 5, 20, 7, 4, 11, 23
 Update VDC_BI_GLDetail Set dBalance = (select sum(x.dAmount) from VDC_BI_GLDetail x where
 	VDC_BI_GLDetail.sPCode = x.sPCode and
 	VDC_BI_GLDetail.sACode = x.sACode and
 	VDC_BI_GLDetail.dtMonth = x.dtMonth and
 	VDC_BI_GLDetail.sBookName = x.sBookName and
 	VDC_BI_GLDetail.dtDate >= x.dtDate and
 	VDC_BI_GLDetail.hGLDetail >= x.hGLDetail)
 Where
 	hGLDetail > 0
 End
GO


