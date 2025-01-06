/******** DMA Schema Migration Deployment Script      Script Date: 6/28/2024 9:17:13 AM ********/

/****** Object:  Table [dbo].[NAMDFinTrakr]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NAMDFinTrakr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NAMDFinTrakr](
	[Probability_of_Close] [decimal](5, 2) NULL,
	[Market] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Site] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Project_Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Demand_Signal_Type] [nvarchar](55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Market_Tier] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[2023 Demand_Signal] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Base_or_Upside_Case] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Acquisition_Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total_Size] [decimal](8, 2) NULL,
	[IT_Capacity_MW] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[DevCoBBNB]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DevCoBBNB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DevCoBBNB](
	[Building] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contract] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[kW_Ramped] [int] NULL,
	[kW_Leased] [int] NULL,
	[Revenue] [money] NULL,
	[Opex_kW_Mth] [money] NULL,
	[Opex] [money] NULL,
	[NOI] [money] NULL,
	[NOI_Margin] [money] NULL,
	[EBITDA] [money] NULL
)
END
GO
/****** Object:  Table [dbo].[YieldCoBBNB]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[YieldCoBBNB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[YieldCoBBNB](
	[Building] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contract] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[kW_Ramped] [int] NULL,
	[kW_Leased] [int] NULL,
	[Revenue] [money] NULL,
	[Opex_kW_Mth] [money] NULL,
	[Opex] [money] NULL,
	[NOI] [money] NULL,
	[NOI_Margin] [money] NULL,
	[EBITDA] [money] NULL
)
END
GO
/****** Object:  Table [dbo].[AcctTree]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctTree]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctTree](
	[hMy] [int] NULL,
	[sCode] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sDesc] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hChart] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sAccountformat] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dtDate] [date] NULL,
	[sUser] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iType] [int] NULL,
	[hDivisor] [int] NULL,
	[hForeigndb] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[FinModel]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FinModel](
	[YearMonth] [int] NULL,
	[Entity] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Market] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Campus] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bldg] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[kWs_Signed_by_Month] [int] NULL,
	[KWs_Operational] [int] NULL,
	[Rental_Revenue] [money] NULL,
	[Total_Revenue] [money] NULL,
	[BBNB_Revenue] [money] NULL,
	[NOI_xPower] [money] NULL,
	[Total_NOI] [money] NULL,
	[BBNB_NOI] [money] NULL,
	[EBITDA] [money] NULL,
	[BBNB_EBITDA] [money] NULL,
	[Cap_Ex] [money] NULL,
	[BBNB_Cap_Ex] [money] NULL
)
END
GO
/****** Object:  Table [dbo].[Datatape]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Datatape]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Datatape](
	[Agg_Incl_Flag] [bit] NULL,
	[YCO_SZN_Incl_Flag] [bit] NULL,
	[DCO_SZN_Incl_Flag] [bit] NULL,
	[All_DevCo_Incl_Flag] [bit] NULL,
	[Lease_ID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lease_Sig_Order] [smallint] NULL,
	[Tenant_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ultimate_Customer_Parent] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lease_Sig_Date] [date] NULL,
	[Building] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data_Module] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Leased_kW] [int] NULL,
	[Ramped_kW] [int] NULL,
	[Rent_Currency] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FX_Latest_Rate] [money] NULL,
	[FX_Sign_Rate] [money] NULL,
	[Initial_Rent] [money] NULL,
	[Loc_Curr_Current_Rate] [money] NULL,
	[USD_Current_Rate] [money] NULL,
	[Mth_Base_Rent] [money] NULL,
	[Annualized_Rent] [money] NULL,
	[Run_Rate_Revenu] [money] NULL,
	[BBNB_Revenue] [money] NULL,
	[TCV_(MM_USD)] [money] NULL,
	[Add_Base_Rent] [money] NULL,
	[Init_Office_Base_Rent] [money] NULL,
	[Curr_Office_Base_Rent] [money] NULL,
	[Total_Curr_Add_Rent_(LC)] [money] NULL,
	[Total_Curr_Add_Rent_(USD)] [money] NULL,
	[Run-Rate_Add_Rent] [money] NULL,
	[Lease_Start_Date] [date] NULL,
	[Lease_End_Date] [date] NULL,
	[Original_Term] [smallint] NULL,
	[Remain_Term] [smallint] NULL,
	[Remain_Term_(Yrs)] [money] NULL,
	[Cashflow_Begin_Period] [smallint] NULL,
	[Payment_Frequency] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rent_Electricity] [money] NULL,
	[Rent_Tax_Ins] [money] NULL,
	[Annual_Escalator] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Escalator_Date] [date] NULL,
	[Escalator_Frequency] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[calendarTbl]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calendarTbl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[calendarTbl](
	[Date] [date] NOT NULL,
	[YearMonth] [int] NULL,
 CONSTRAINT [PK__calendar__77387D06A3BFB325] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
/****** Object:  Table [dbo].[MasterBuildSchedule]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterBuildSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MasterBuildSchedule](
	[Campus] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Building] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YearMonth] [int] NULL,
	[KWs_Operational] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[LeaseMatrix]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeaseMatrix]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LeaseMatrix](
	[Entity] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Campus] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bldg] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YearMonth] [int] NULL,
	[Customer] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Space] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PH] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Termination] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lease_Signature] [date] NULL,
	[Commencement] [date] NULL,
	[Maturity] [date] NULL,
	[Lease_Term] [smallint] NULL,
	[Leased_kW] [smallint] NULL,
	[Start_Rate] [money] NULL,
	[Min_TCV] [money] NULL,
	[TCV] [money] NULL,
	[Start_Rate_USD] [money] NULL,
	[Avg_Rate] [money] NULL,
	[GAAP_Rate_USD] [money] NULL,
	[Rent_Esc] [money] NULL,
	[Guar_TCV_M_USD] [money] NULL,
	[TCV_$M] [money] NULL
)
END
GO
/****** Object:  Table [dbo].[Rent-Ramp]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rent-Ramp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rent-Ramp](
	[LeaseName] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeaseID] [tinyint] NULL,
	[Currency] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Entity] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignatureOrder] [tinyint] NULL,
	[ItemName] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemValue] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemDateType] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemDate] [date] NULL,
	[RevenueDetail] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RevDetailAmount] [money] NULL,
	[Building] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataModule] [varchar](63) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YearMonth] [int] NULL,
	[TotalRent] [money] NULL,
	[KWRamped] [money] NULL,
	[CurrentRate] [money] NULL,
	[CurrentAddRent] [money] NULL
)
END
GO
/****** Object:  Table [dbo].[FinanceDetail]    Script Date: 6/28/2024 9:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinanceDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FinanceDetail](
	[MonthYear] [int] NULL,
	[Building] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Campus] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Entity] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rental_Revenue] [money] NULL,
	[Total_Revenue] [money] NULL,
	[BBNB_Revenue] [money] NULL,
	[NOI_xPower] [money] NULL,
	[Total_NOI] [money] NULL,
	[BBNB_NOI] [money] NULL,
	[EBITDA] [money] NULL,
	[BBNB_EBITDA] [money] NULL,
	[Cap_Ex] [money] NULL,
	[BBNB_Cap_Ex] [money] NULL
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_Total_Revenue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_Total_Revenue]  DEFAULT ((480000)) FOR [Total_Revenue]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_BBNB_Revenue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_BBNB_Revenue]  DEFAULT ((925000)) FOR [BBNB_Revenue]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_NOI_xPower]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_NOI_xPower]  DEFAULT ((100000)) FOR [NOI_xPower]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_Total_NOI]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_Total_NOI]  DEFAULT ((100000)) FOR [Total_NOI]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_BBNB_NOI]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_BBNB_NOI]  DEFAULT ((200000)) FOR [BBNB_NOI]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_EBITDA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_EBITDA]  DEFAULT ((80000)) FOR [EBITDA]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_BBNB_EBITDA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_BBNB_EBITDA]  DEFAULT ((150000)) FOR [BBNB_EBITDA]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_Cap_Ex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_Cap_Ex]  DEFAULT ((20000)) FOR [Cap_Ex]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceDetail_BBNB_Cap_Ex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceDetail] ADD  CONSTRAINT [DF_FinanceDetail_BBNB_Cap_Ex]  DEFAULT ((40000)) FOR [BBNB_Cap_Ex]
END

GO

